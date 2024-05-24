import {Buffer} from "node:buffer"
import {createHmac} from "node:crypto"
import {stat} from "node:fs/promises"
import {createReadStream} from "node:fs"
import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {uniqueString} from "@onlyoffice/unique-string"

// todo: move to env variables
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
  s.on("request", (req, res) => {
    console.log(`${req.method} ${req.url}`)
    res.setHeader("Access-Control-Allow-Origin", "*")
    route(req, res)
  })
  s.listen(config.port, config.hostname, () => {
    console.log(`Server running at http://${config.hostname}:${config.port}/`)
  })
}

type Request = IncomingMessage
type Response = ServerResponse

async function route(req: Request, res: Response): Promise<void> {
  switch (req.url) {
  case "/config":
    routeConfig(res)
    break
  case "/document":
    routeDocument(res)
    break
  default:
    res.statusCode = 404
    res.write("Unknown route")
    res.end()
    break
  }
}

async function routeConfig(res: Response): Promise<void> {
  const j: DocEditorConfig = {
    documentType: "word",
    document: {
      fileType: "docx",
      key: uniqueString(),
      title: "Document",
      url: `http://${config.internal.hostname}:${config.internal.port}/document`
    }
  }
  let s = JSON.stringify(j)
  j.token = encode(config.jwt.secret, s)
  s = JSON.stringify(j)
  res.statusCode = 200
  res.setHeader("Content-Type", "application/json")
  res.write(s)
  res.end()
}

async function routeDocument(res: Response): Promise<void> {
  const cd = currentDir()
  const df = documentFile(cd)
  const ds = await stat(df)
  res.statusCode = 200
  res.setHeader("Content-Type", "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
  res.setHeader("Content-Length", ds.size)
  createReadStream(df).pipe(res)
}

function currentDir(): string {
  const u = new URL(".", import.meta.url)
  return fileURLToPath(u)
}

function documentFile(d: string): string {
  return join(d, "document.docx")
}

function encode(secret: string, payload: string): string {
  const header = JSON.stringify({alg: config.jwt.algorithm, typ: "JWT"})
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
