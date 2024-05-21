import {mkdir, mkdtemp, rm, rmdir, writeFile} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {join} from "node:path"
import process from "node:process"
import type {TransformCallback} from "node:stream"
import {Readable, Transform} from "node:stream"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {jq} from "@onlyoffice/jq"
import type {Doclet} from "@onlyoffice/jsdoc"
import {jsdoc} from "@onlyoffice/jsdoc"
import {Cache, FirstIteration, SecondIteration, ThirdIteration} from "@onlyoffice/jsdoc-declaration"
import {resource} from "@onlyoffice/library-resource"
import {declarationBasename, indexBasename, resourceBasename} from "@onlyoffice/resource"
import {StringWritable} from "@onlyoffice/stream-string"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
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
  const w = new JSDocBuffer()
  await jsdoc(w, [fd, "--debug", "--explain", "--recurse"])

  const cache = new Cache()
  cache.setup()

  await new Promise((res, rej) => {
    const c = new Chain([
      w.toReadable(),
      new Parser(),
      new StreamArray(),
      new Preprocess(),
      new FirstIteration(cache),
      cache.toWritable()
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  cache.step()

  await new Promise((res, rej) => {
    const c = new Chain([
      cache.toReadable(),
      new SecondIteration(cache),
      cache.toWritable()
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  cache.step()

  await new Promise((res, rej) => {
    const c = new Chain([
      cache.toReadable(),
      new ThirdIteration(cache),
      cache.toWritable()
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  cache.step()

  const f = join(td, "resource.json")

  await new Promise((res, rej) => {
    const c = new Chain([
      Readable.from(cache.current.declarations),
      new Disassembler(),
      new Stringer({makeArray: true}),
      createWriteStream(f)
    ])
    c.on("close", res)
    c.on("error", rej)
  })

  const dn = declarationBasename("resource")
  const df = join(dd, dn)

  const mn = indexBasename("resource")
  const mf = join(dd, mn)

  const rn = resourceBasename("resource")
  const rf = join(dd, rn)

  await Promise.all([
    (async () => {
      const w = createWriteStream(df)
      await jq(w, [".", f])
      w.close()
    })(),

    (async () => {
      const f = join(td, mn)
      await new Promise((res, rej) => {
        const c = new Chain([
          Readable.from([cache.current.indexes]),
          new Disassembler(),
          new Stringer(),
          createWriteStream(f)
        ])
        c.on("close", res)
        c.on("error", rej)
      })

      const w = createWriteStream(mf)
      await jq(w, [".", f])
      w.close()

      await rm(f)
    })(),

    (async () => {
      const r = await resource(df, mf)
      await writeFile(rf, r)
    })()
  ])

  await rm(f)
  await rmdir(td)

  console.log("Finish building")
}

class JSDocBuffer extends StringWritable {
  _write(ch: unknown, _: BufferEncoding, cb: TransformCallback): void {
    const l = String(ch)
    const a = l.split("\n")
    for (const [i, s] of a.entries()) {
      if (
        !s.startsWith("DEBUG") &&
        !s.startsWith("Parsing") &&
        !s.startsWith("Finished running")
      ) {
        this.buf += s
        if (i < a.length - 1) {
          this.buf += "\n"
        }
      }
    }
    cb()
  }
}

class Preprocess extends Transform {
  constructor() {
    super({objectMode: true})
  }

  _transform(ch: {value: Doclet}, _: BufferEncoding, cb: TransformCallback): void {
    if (ch.value.undocumented) {
      cb()
      return
    }
    this.push(ch)
    cb()
  }
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

await main()
