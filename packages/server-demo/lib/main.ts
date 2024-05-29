import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {argv, stderr, stdout} from "node:process"
import {Console} from "@onlyoffice/console"
import {body} from "@onlyoffice/node-http"
import type {Algorithm} from "jsonwebtoken"
import jwt from "jsonwebtoken"
import sade from "sade"
import pack from "../package.json"

const {sign} = jwt
const console = new Console(pack.name, stdout, stderr)

interface Options {
  hostname: string
  port: number
  jwt: {
    algorithm: Algorithm
    header: string
    secret: string
  }
}

function main(): void {
  sade("server-demo", true)
    .option("--hostname", "Hostname to listen on", "0.0.0.0")
    .option("--port", "Port to listen on", 4000)
    .option("--jwt-algorithm", "JWT algorithm", "HS256")
    .option("--jwt-header", "JWT header", "Authorization")
    .option("--jwt-secret", "JWT secret", "your-256-bit-secret")
    .action((opts) => {
      serve({
        hostname: opts.hostname,
        port: opts.port,
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

  if (req.url === "/editors/configcreate") {
    const b = await body(req)
    const j = JSON.parse(b)
    const l = JSON.parse(j.jsonConfig)
    l.token = sign(l, opts.jwt.secret, {algorithm: opts.jwt.algorithm})
    j.jsonConfig = JSON.stringify(l)
    const c = JSON.stringify(j)

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write(c)
    res.end()
    return
  }

  throw new Error("Unknown route")
}

main()
