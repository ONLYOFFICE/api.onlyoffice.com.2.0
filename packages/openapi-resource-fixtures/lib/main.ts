import {mkdir, mkdtemp, readFile, rm, rmdir, writeFile} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {hasJQ, jq} from "@onlyoffice/jq"
import {Cache, ProcessComponent, ProcessPath, ProcessRequest} from "@onlyoffice/openapi-declaration"
import {PickComponent, PickPath} from "@onlyoffice/openapi-resource"
import {relative} from "@onlyoffice/path"
import {componentBasename, declarationBasename, resourceBasename} from "@onlyoffice/resource"
import {resource} from "@onlyoffice/service-resource"
import {UnstreamObject, makeObject} from "@onlyoffice/stream-json"
import {StringReadable, StringWritable} from "@onlyoffice/stream-string"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import {parse} from "yaml"
import Stringer from "stream-json/Stringer.js"
import pack from "../package.json" with {type: "json"}

const console = new Console(pack.name, process.stdout, process.stderr)

async function main(): Promise<void> {
  console.log("Start building")

  const td = await mkdtemp(`${tempDir()}-`)

  const rd = rootDir()
  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  const fd = fixturesDir(rd)
  const rf = resourceFile(fd)
  const rw = new StringWritable()
  const rc = await readFile(rf, "utf8")
  const ro = parse(rc)
  rw.buf = JSON.stringify(ro)

  const [df, cf] = await writeData(td, dd, rw)
  await writeEntrypoint(dd, df, cf)

  await rmdir(td)

  console.log("Finish building")
}

async function writeData(td: string, dd: string, rw: StringWritable): Promise<[string, string]> {
  const cache = new Cache()

  let from = rw
  let to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      from.toReadable(),
      new Parser(),
      new PickPath(),
      new StreamObject(),
      new ProcessPath(cache),
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      from.toReadable(),
      new Parser(),
      new StreamArray(),
      new ProcessRequest(cache),
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      new MultiStream([
        new StringReadable(JSON.stringify(Object.values(cache.groups))),
        from.toReadable()
      ]),
      new Parser({jsonStreaming: true}),
      new StreamArray(),
      (ch: {value: unknown}): unknown => {
        return ch.value
      },
      new Disassembler(),
      new Stringer({makeArray: true}),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  const dn = declarationBasename("resource")
  const df = join(dd, dn)

  if (!await hasJQ()) {
    await writeFile(df, to.buf)
  } else {
    const tf = join(td, dn)
    await writeFile(tf, to.buf)

    const dw = createWriteStream(df)
    await jq(dw, [".", tf])
    dw.close()

    await rm(tf)
  }

  from = rw
  to = new StringWritable()

  const ks: ConstructorParameters<typeof PickComponent>[0][] =
  ["schemas", "responses"]
  for (const k of ks) {
    // eslint-disable-next-line no-loop-func
    await new Promise((res, rej) => {
      const c = new Chain([
        from.toReadable(),
        new Parser(),
        new PickComponent(k),
        new StreamObject(),
        new ProcessComponent(cache, k),
        new UnstreamObject(),
        makeObject(),
        new Stringer(),
        to
      ])
      c.on("close", res)
      c.on("error", rej)
    })
    to = new StringWritable(to.buf)
  }

  from = to
  to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      from.toReadable(),
      new Parser({jsonStreaming: true}),
      new StreamObject(),
      new UnstreamObject(),
      makeObject(),
      new Stringer(),
      to
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  const cn = componentBasename("resource")
  const cf = join(dd, cn)

  if (!await hasJQ()) {
    await writeFile(cf, to.buf)
  } else {
    const tf = join(td, cn)
    await writeFile(tf, to.buf)

    const cw = createWriteStream(cf)
    await jq(cw, [".", tf])
    cw.close()

    await rm(tf)
  }

  return [df, cf]
}

async function writeEntrypoint(dd: string, df: string, cf: string): Promise<void> {
  df = relative(dd, df)
  cf = relative(dd, cf)
  const n = resourceBasename("resource")
  const f = join(dd, n)
  const c = await resource(df, cf)
  await writeFile(f, c)
}

function tempDir(): string {
  const n = pack.name.replace("/", "+")
  return join(tmpdir(), n)
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

function fixturesDir(d: string): string {
  return join(d, "fixtures")
}

function resourceFile(d: string): string {
  return join(d, "resource.yml")
}

await main()
