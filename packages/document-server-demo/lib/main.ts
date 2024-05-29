import {stat} from "node:fs/promises"
import {createReadStream} from "node:fs"
import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {join} from "node:path"
import {argv, stderr, stdout} from "node:process"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import type {DocEditorConfigurableOptions} from "@onlyoffice/document-server-types"
import {uniqueString} from "@onlyoffice/unique-string"
import type {Algorithm} from "jsonwebtoken"
import jwt from "jsonwebtoken"
import sade from "sade"
import pack from "../package.json"

const {sign} = jwt
const console = new Console(pack.name, stdout, stderr)

interface Options {
  hostname: string
  port: number
  internal: {
    hostname: string
    port: number
  }
  jwt: {
    algorithm: Algorithm
    header: string
    secret: string
  }
}

function main(): void {
  sade("document-server-demo", true)
    .option("--hostname", "Hostname to listen on", "0.0.0.0")
    .option("--port", "Port to listen on", 4000)
    .option("--internal-hostname", "Hostname for internal requests", "host.docker.internal")
    .option("--internal-port", "Port for internal requests", 4000)
    .option("--jwt-algorithm", "JWT algorithm", "HS256")
    .option("--jwt-header", "JWT header", "Authorization")
    .option("--jwt-secret", "JWT secret", "your-256-bit-secret")
    .action((opts) => {
      console.log(opts)
      serve({
        hostname: opts.hostname,
        port: opts.port,
        internal: {
          hostname: opts["internal-hostname"],
          port: opts["internal-port"]
        },
        jwt: {
          algorithm: opts["jwt-algorithm"],
          header: opts["jwt-header"],
          secret: opts["jwt-secret"]
        }
      })
    })
    .parse(argv)
}

function serve(opts: Options): void {
  const s = createServer()

  s.on("request", async (req, res) => {
    console.log(`${req.method} ${req.url}`)
    try {
      await route(opts, req, res)
    } catch (e) {
      let m = "Internal Server Error"
      if (e instanceof Error) {
        m = e.message
      }
      console.error(e)
      res.statusCode = 500
      res.write(m)
      res.end()
    }
  })

  s.listen(opts.port, opts.hostname, () => {
    console.log(`Listening on http://${opts.hostname}:${opts.port}/`)
  })
}

async function route(opts: Options, req: IncomingMessage, res: ServerResponse): Promise<void> {
  res.setHeader("Access-Control-Allow-Origin", "*")

  if (req.method === "OPTIONS") {
    res.statusCode = 204
    res.setHeader("Access-Control-Allow-Methods", "OPTIONS, GET, POST")
    res.setHeader("Access-Control-Allow-Headers", "Content-Type")
    res.setHeader("Content-Length", "0")
    res.end()
    return
  }

  if (req.url && req.url.startsWith("/config")) {
    const bo = await new Promise<string>((res, rej) => {
      req.on("error", rej)
      let bo = ""
      req.on("data", (d) => {
        bo += String(d)
      })
      req.on("end", () => {
        res(bo)
      })
    })

    const co: DocEditorConfigurableOptions = JSON.parse(bo)
    if (!co.document) {
      throw new Error("Missing document")
    }
    if (!co.document.fileType) {
      throw new Error("Missing fileType")
    }

    co.document.key = uniqueString()
    const du = new URL("/sample", `http://${opts.internal.hostname}:${opts.internal.port}/`)
    du.searchParams.set("fileType", co.document.fileType)
    co.document.url = du.toString()
    co.token = sign(co, opts.jwt.secret, {algorithm: opts.jwt.algorithm})

    const d = JSON.stringify(co)
    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write(d)
    res.end()
    return
  }

  if (req.url && req.url.startsWith("/sample")) {
    const u = new URL(req.url, `http://${req.headers.host}/`)

    const fileType = u.searchParams.get("fileType")
    if (!fileType) {
      throw new Error("Missing fileType")
    }

    const rd = rootDir()
    const fd = fixturesDir(rd)
    const sn = sampleBasename(fileType)
    const sf = join(fd, sn)
    const st = contentType(fileType)
    const ss = await stat(sf)
    res.statusCode = 200
    res.setHeader("Content-Type", st)
    res.setHeader("Content-Length", ss.size)
    createReadStream(sf).pipe(res)
    return
  }

  throw new Error("Unknown route")
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function fixturesDir(d: string): string {
  return join(d, "fixtures")
}

function sampleBasename(t: string): string {
  return `sample.${t}`
}

function contentType(t: string): string {
  switch (t) {
  case "docx":
    return "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  case "xlsx":
    return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  default:
    throw new Error(`Unknown file type: ${t}`)
  }
}

main()
