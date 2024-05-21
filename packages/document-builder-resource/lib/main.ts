import {mkdir, mkdtemp, rm, rmdir, writeFile} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {tmpdir} from "node:os"
import {join} from "node:path"
import process from "node:process"
import {Readable} from "node:stream"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {jq} from "@onlyoffice/jq"
import {Cache, FirstIteration, SecondIteration, ThirdIteration} from "@onlyoffice/jsdoc-declaration"
import {resource} from "@onlyoffice/library-resource"
import {declarationBasename, indexBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {StringWritable} from "@onlyoffice/stream-string"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"
import pack from "../package.json" with {type: "json"}

const config = [
  {
    name: "document",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder/master/document.json"
    }
  },
  {
    name: "form",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder/master/form.json"
    }
  },
  {
    name: "presentation",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder/master/presentation.json"
    }
  },
  {
    name: "spreadsheet",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder/master/spreadsheet.json"
    }
  },

  {
    name: "plugin-common",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder-plugin/master/common.json"
    }
  },
  {
    name: "plugin-document",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder-plugin/master/document.json"
    }
  },
  {
    name: "plugin-form",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder-plugin/master/form.json"
    }
  },
  {
    name: "plugin-presentation",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder-plugin/master/presentation.json"
    }
  },
  {
    name: "plugin-spreadsheet",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "document-builder-declarations",
      branch: "dist",
      path: "document-builder-plugin/master/spreadsheet.json"
    }
  }
]

const console = new Console(pack.name, process.stdout, process.stderr)

await main()

async function main(): Promise<void> {
  console.log("Start building")

  const td = await mkdtemp(`${tempDir()}-`)

  const dd = distDir(rootDir())
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  for (const cfg of config) {
    const m = JSON.stringify({name: cfg.name, variant: cfg.variant})
    console.log(`Start building '${m}'`)

    const w = new StringWritable()
    const u = rawURL(cfg.source.owner, cfg.source.repo, cfg.source.branch, cfg.source.path)
    await readURL(w, u)

    const cache = new Cache()
    cache.setup()

    await new Promise((res, rej) => {
      const c = new Chain([
        w.toReadable(),
        new Parser(),
        new StreamArray(),
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

    const f = join(td, `${cfg.name}.json`)

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

    const dn = declarationBasename(cfg.name)
    const df = join(dd, dn)

    const mn = indexBasename(cfg.name)
    const mf = join(dd, mn)

    const rn = resourceBasename(cfg.name)
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

    console.log(`Finish building '${m}'`)
  }

  await rmdir(td)

  console.log("Finish building")
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
