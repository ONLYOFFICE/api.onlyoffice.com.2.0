import {mkdir, mkdtemp, rm, rmdir, writeFile} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {jq} from "@onlyoffice/jq"
import {Cache, ProcessPath, ProcessRequest} from "@onlyoffice/openapi-declaration"
import {PickPath} from "@onlyoffice/openapi-resource"
import {componentBasename, declarationBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {resource} from "@onlyoffice/service-resource"
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
    name: "community-server",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "community-server-declarations",
      reference: "dist",
      path: "community-server.json"
    }
  }
]

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

  for (const cfg of config) {
    const m = JSON.stringify({name: cfg.name, variant: cfg.variant})
    console.log(`Start building '${m}'`)
    const df = await writeDeclaration(td, dd, cfg)
    const cf = await writeComponent(dd, cfg)
    await writeResource(dd, cfg, df, cf)
    console.log(`Finish building '${m}'`)
  }

  await rmdir(td)

  console.log("Finish building")
}

async function writeDeclaration(td: string, dd: string, cfg: typeof config[0]): Promise<string> {
  const rw = new StringWritable()
  const ru = rawURL(cfg.source.owner, cfg.source.repo, cfg.source.reference, cfg.source.path)
  await readURL(rw, ru)

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

  const n = declarationBasename(cfg.name)

  const tf = join(td, n)
  await writeFile(tf, to.buf)

  const df = join(dd, n)
  const dw = createWriteStream(df)
  await jq(dw, [".", tf])
  dw.close()

  await rm(tf)

  return df
}

async function writeComponent(dd: string, cfg: typeof config[0]): Promise<string> {
  const n = componentBasename(cfg.name)
  const f = join(dd, n)
  await writeFile(f, "{}")
  return f
}

async function writeResource(dd: string, cfg: typeof config[0], df: string, cf: string): Promise<void> {
  const n = resourceBasename(cfg.name)
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

await main()
