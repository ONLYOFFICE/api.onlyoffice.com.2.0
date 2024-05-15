import {Buffer} from "node:buffer"
import {createHmac} from "node:crypto"
import {stat} from "node:fs/promises"
import {createReadStream} from "node:fs"
import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import type {DocumentEditorConfig} from "@onlyoffice/document-editor-html-element"

const config = {
  hostname: "0.0.0.0",
  port: 4000,
  internal: {
    hostname: "host.docker.internal",
    port: 4000
  },
  jwt: {
    algorithm: "HS256",
    header: "Authorization",
    secret: "your-256-bit-secret"
  }
}

main()

function main(): void {
  const s = createServer()

  s.on("request", async (req, res) => {
    console.log(`${req.method} ${req.url}`)
    res.setHeader("Access-Control-Allow-Origin", "*")
    try {
      await route(req, res)
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

  s.listen(config.port, config.hostname, () => {
    console.log(`Server running at http://${config.hostname}:${config.port}/`)
  })
}

async function route(req: IncomingMessage, res: ServerResponse): Promise<void> {
  if (req.url && req.url.startsWith("/config")) {
    const u = new URL(req.url, `http://${req.headers.host}/`)

    const fileType = u.searchParams.get("fileType")
    if (!fileType) {
      throw new Error("Missing fileType")
    }

    const du = new URL("/sample", `http://${config.internal.hostname}:${config.internal.port}/`)
    du.searchParams.set("fileType", fileType)

    const co: DocumentEditorConfig = {
      documentType: documentType(fileType),
      document: {
        fileType,
        key: uniqString(),
        title: "Document Builder Demo Document",
        url: du.toString()
      }
    }

    const cs = JSON.stringify(co)
    co.token = encode(config.jwt.algorithm, config.jwt.secret, cs)

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

    const cd = currentDir()
    const sd = join(cd, "samples")
    const sf = join(sd, `sample.${fileType}`)
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

function currentDir(): string {
  const u = new URL(".", import.meta.url)
  return fileURLToPath(u)
}

function documentType(t: string): DocumentEditorConfig["documentType"] {
  switch (t) {
  case "docx":
    return "word"
  case "xlsx":
    return "cell"
  default:
    throw new Error(`Unknown file type: ${t}`)
  }
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

function uniqString(): string {
  const date = new Date()
  const timestamp = date.getTime()
  return timestamp.toString(36)
}

function encode(alg: string, secret: string, payload: string): string {
  const header = JSON.stringify({alg, typ: "JWT"})
  const h = base64URLEncode(header)
  const p = base64URLEncode(payload)
  const hp = `${h}.${p}`
  const s = createHmac("sha256", secret)
    .update(hp)
    .digest("base64")
    .replace("+", "-")
    .replace("/", "_")
    .replace(/=+$/, "")
  return `${hp}.${s}`
  function base64URLEncode(s: string): string {
    return Buffer
      .from(s)
      .toString("base64")
      .replace("+", "-")
      .replace("/", "_")
      .replace(/=+$/, "")
  }
}
