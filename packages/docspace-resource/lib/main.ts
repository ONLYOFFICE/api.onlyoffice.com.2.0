import {mkdir, rm} from "node:fs/promises"
import {createWriteStream, existsSync} from "node:fs"
import {join} from "node:path"
import type {TransformCallback} from "node:stream"
import {Transform} from "node:stream"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import type {PathChunk} from "@onlyoffice/openapi-declaration"
import {Cache, httpMethods} from "@onlyoffice/openapi-declaration"
import {writeComponent, writeDeclaration, writeEntrypoint} from "@onlyoffice/openapi-resource"
import {componentBasename, declarationBasename, rawURL, readURL, resourceBasename} from "@onlyoffice/resource"
import {StringWritable} from "@onlyoffice/stream-string"
import pack from "../package.json" with {type: "json"}

const config = [
  {
    name: "docspace",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "dist",
      paths: [
        {name: "data", path: "asc.data.backup.swagger.json"},
        {name: "files", path: "asc.files.swagger.json"},
        {name: "people", path: "asc.people.swagger.json"},
        {name: "web", path: "asc.web.api.swagger.json"}
      ]
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

    for (const p of cfg.source.paths) {
      const m = JSON.stringify({name: p.name, path: p.path})
      console.log(`Start building '${m}'`)

      const rw = new StringWritable()
      const ru = rawURL(cfg.source.owner, cfg.source.repo, cfg.source.reference, p.path)
      await readURL(rw, ru)

      const ch = new Cache()

      const dn = declarationBasename(p.name)
      const df = join(dd, dn)
      const dw = createWriteStream(df)
      await writeDeclaration(ch, rw, dw, [new PatchPath()])
      dw.close()

      const cn = componentBasename(p.name)
      const cf = join(dd, cn)
      const cw = createWriteStream(cf)
      await writeComponent(ch, rw, cw)
      cw.close()

      const en = resourceBasename(p.name)
      const ef = join(dd, en)
      const ew = createWriteStream(ef)
      await writeEntrypoint(ew, df, cf)
      ew.close()

      console.log(`Finish building '${m}'`)
    }

    console.log(`Finish building '${m}'`)
  }

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

// It is not good that we patch the path on our side.
class PatchPath extends Transform {
  constructor() {
    super({objectMode: true})
  }

  _transform(ch: PathChunk, _: BufferEncoding, cb: TransformCallback): void {
    // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/web/ASC.Web.Api/Api/CapabilitiesController.cs#L33
    if (ch.key.endsWith("{.format}")) {
      cb()
      return
    }

    for (const m of httpMethods()) {
      const o = ch.value[m]
      if (!o) {
        continue
      }

      if (o.description) {
        o.description = `**Note**: ${o.description}`
      }

      if (o.summary) {
        if (!o.description) {
          o.description = o.summary
        } else {
          o.description = `${o.summary}\n\n${o.description}`
        }
      }

      const x = o["x-shortName" as keyof typeof o] as string | undefined
      if (x) {
        o.summary = x
      }

      // https://github.com/ONLYOFFICE/DocSpace-server/blob/v2.0.2-server/products/ASC.People/Server/Api/UserController.cs#L2028
      if (!o.summary) {
        delete ch.value[m]
      }
    }

    this.push(ch)
    cb()
  }
}

await main()
