import {existsSync} from "node:fs"
import {mkdir, rm} from "node:fs/promises"
import path from "node:path"
import {Transform, type TransformCallback} from "node:stream"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import {type PathChunk} from "@onlyoffice/openapi-declaration"
import {type Config, build, download} from "@onlyoffice/openapi-resource"
import {OpenAPIV3} from "openapi-types"
import pack from "../package.json" with {type: "json"}

const {HttpMethods} = OpenAPIV3

const config: Config[] = [
  {
    name: "data",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "dist",
      path: "asc.data.backup.swagger.json",
    },
  },
  {
    name: "files",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "dist",
      path: "asc.files.swagger.json",
    },
  },
  {
    name: "people",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "dist",
      path: "asc.people.swagger.json",
    },
  },
  {
    name: "web",
    variant: "master",
    source: {
      owner: "onlyoffice",
      repo: "docspace-declarations",
      reference: "dist",
      path: "asc.web.api.swagger.json",
    },
  },
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

  for (const c of config) {
    const rw = await download(c)
    await build(c, dd, rw, {path: [new PatchPath()]})
  }

  console.log("Finish building")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return path.join(d, "dist")
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

    for (const m of Object.values(HttpMethods)) {
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
