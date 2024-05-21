import {mkdir, mkdtemp, rm, rmdir, writeFile} from "node:fs/promises"
import type {WriteStream} from "node:fs"
import {createWriteStream, existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {dirname, join} from "node:path"
import type {Writable} from "node:stream"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {hasJQ, jq} from "@onlyoffice/jq"
import {Cache, ProcessComponent, ProcessPath, ProcessRequest} from "@onlyoffice/openapi-declaration"
import {PickComponent, PickPath} from "@onlyoffice/openapi-resource"
import {relative} from "@onlyoffice/path"
import {componentBasename, declarationBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {resource} from "@onlyoffice/service-resource"
import {UnstreamObject, makeObject} from "@onlyoffice/stream-json"
import {StringReadable, StringWritable} from "@onlyoffice/stream-string"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import pack from "../package.json" with {type: "json"}

const config = [
  {
    name: "docspace-hosted-solutions",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-hosted-solutions-declarations",
      reference: "dist",
      path: "hosted-solutions.json"
    }
  }
]

const console = new Console(pack.name, process.stdout, process.stderr)

async function main(): Promise<void> {
  console.log("Start building")

  const rd = rootDir()
  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  for (const cfg of config) {
    const m = JSON.stringify({name: cfg.name, variant: cfg.variant})
    console.log(`Start building '${m}'`)

    const rw = new StringWritable()
    const ru = rawURL(cfg.source.owner, cfg.source.repo, cfg.source.reference, cfg.source.path)
    await readURL(rw, ru)

    const ch = new Cache()

    const dn = declarationBasename(cfg.name)
    const df = join(dd, dn)
    const dw = createWriteStream(df)
    await writeDeclaration(ch, rw, dw)
    dw.close()

    const cn = componentBasename(cfg.name)
    const cf = join(dd, cn)
    const cw = createWriteStream(cf)
    await writeComponent(ch, rw, cw)
    cw.close()

    const en = resourceBasename(cfg.name)
    const ef = join(dd, en)
    const ew = createWriteStream(ef)
    await writeEntrypoint(ew, df, cf)
    ew.close()

    console.log(`Finish building '${m}'`)
  }

  console.log("Finish building")
}

async function writeDeclaration(ch: Cache, rw: StringWritable, dw: Writable): Promise<void> {
  let from: StringWritable
  let to = new StringWritable()
  await new Promise((res, rej) => {
    const c = new Chain([
      rw.toReadable(),
      new Parser(),
      new PickPath(),
      new StreamObject(),
      new ProcessPath(ch),
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
      new ProcessRequest(ch),
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
        // todo: see how it handles in the jsdoc
        new StringReadable(JSON.stringify(Object.values(ch.groups))),
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

  if (!await hasJQ()) {
    dw.write(to.buf)
  } else {
    const td = await mkdtemp(`${tempDir()}-`)
    const tf = join(td, "d")
    await writeFile(tf, to.buf)
    await jq(dw, [".", tf])
    await rm(tf)
    await rmdir(td)
  }
}

async function writeComponent(ch: Cache, rw: StringWritable, cw: Writable): Promise<void> {
  let from: StringWritable
  let to = new StringWritable()

  const ks: ConstructorParameters<typeof PickComponent>[0][] =
  ["schemas", "responses"]
  for (const k of ks) {
    // eslint-disable-next-line no-loop-func
    await new Promise((res, rej) => {
      const c = new Chain([
        rw.toReadable(),
        new Parser(),
        new PickComponent(k),
        new StreamObject(),
        new ProcessComponent(ch, k),
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

  // eslint-disable-next-line prefer-const
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

  if (!await hasJQ()) {
    cw.write(to.buf)
  } else {
    const td = await mkdtemp(`${tempDir()}-`)
    const tf = join(td, "c")
    await writeFile(tf, to.buf)
    await jq(cw, [".", tf])
    await rm(tf)
    await rmdir(td)
  }
}

async function writeEntrypoint(ew: WriteStream, df: string, cf: string): Promise<void> {
  const ef = String(ew.path)
  const ed = dirname(ef)
  df = relative(ed, df)
  cf = relative(ed, cf)
  const c = await resource(df, cf)
  ew.write(c)
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

await main()
