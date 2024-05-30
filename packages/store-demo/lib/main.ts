import {stat} from "node:fs/promises"
import {createReadStream} from "node:fs"
import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {join} from "node:path"
import {argv, stderr, stdout} from "node:process"
import {URL, fileURLToPath} from "node:url"
import {Console} from "@onlyoffice/console"
import type {DocEditorConfigurableOptions} from "@onlyoffice/document-server-types"
import {body} from "@onlyoffice/node-http"
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
  sade("store-demo", true)
    .option("--hostname", "Hostname to listen on", "0.0.0.0")
    .option("--port", "Port to listen on", 4000)
    .option("--internal-hostname", "Hostname for internal requests", "host.docker.internal")
    .option("--internal-port", "Port for internal requests", 4000)
    .option("--jwt-algorithm", "JWT algorithm", "HS256")
    .option("--jwt-header", "JWT header", "Authorization")
    .option("--jwt-secret", "JWT secret", "your-256-bit-secret")
    .action((opts) => {
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

  if (req.url === "/config") {
    const b = await body(req)

    const c: DocEditorConfigurableOptions = JSON.parse(b)
    if (!c.document) {
      throw new Error("Missing document")
    }
    if (!c.document.fileType) {
      throw new Error("Missing fileType")
    }

    c.document.key = uniqueString()

    const u = new URL("/sample", `http://${opts.internal.hostname}:${opts.internal.port}/`)
    u.searchParams.set("fileType", c.document.fileType)
    c.document.url = u.toString()

    c.token = sign(c, opts.jwt.secret, {algorithm: opts.jwt.algorithm})

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write(JSON.stringify(c))
    res.end()
    return
  }

  if (req.url && req.url.startsWith("/sample")) {
    const u = new URL(req.url, `http://${req.headers.host}/`)

    const t = u.searchParams.get("fileType")
    if (!t) {
      throw new Error("Missing fileType")
    }

    const rd = rootDir()
    const fd = fixturesDir(rd)
    const sb = sampleBasename(t)
    const sf = join(fd, sb)
    const st = contentType(t)
    const ss = await stat(sf)

    res.statusCode = 200
    res.setHeader("Content-Type", st)
    res.setHeader("Content-Length", ss.size)
    createReadStream(sf).pipe(res)
    return
  }

  // todo: The store-demo package is specifically tailored for making demos of
  // html-element packages. Endpoints mentioned below is a part of our site's
  // documentation, also known as the server. Looking ahead, we should extract
  // it from the store-demo package and utilize a independent mock server.

  if (req.url === "/editors/configcreate") {
    const b = await body(req)
    const j = JSON.parse(b)

    const c: DocEditorConfigurableOptions = JSON.parse(j.jsonConfig)
    if (!c.document) {
      throw new Error("Missing document")
    }
    if (!c.document.fileType) {
      throw new Error("Missing fileType")
    }

    c.document.key = uniqueString()

    const u = new URL("/sample", `http://${opts.internal.hostname}:${opts.internal.port}/`)
    u.searchParams.set("fileType", c.document.fileType)
    c.document.url = u.toString()

    c.token = sign(c, opts.jwt.secret, {algorithm: opts.jwt.algorithm})
    j.jsonConfig = JSON.stringify(c)

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write(JSON.stringify(j))
    res.end()
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
