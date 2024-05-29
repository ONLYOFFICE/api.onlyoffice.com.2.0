import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {argv, stderr, stdout} from "node:process"
import {Console} from "@onlyoffice/console"
import {body} from "@onlyoffice/node-http"
import sade from "sade"
import pack from "../package.json"

const console = new Console(pack.name, stdout, stderr)

function main(): void {
  sade("server-demo", true)
    .option("--hostname", "Hostname to listen on", "0.0.0.0")
    .option("--port", "Port to listen on", 4000)
    .action((opts) => {
      serve(opts.hostname, opts.port)
    })
    .parse(argv)
}

function serve(hostname: string, port: number): void {
  const s = createServer()

  s.on("request", async (req, res) => {
    console.log(`${req.method} ${req.url}`)
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

  s.listen(port, hostname, () => {
    console.log(`Listening on http://${hostname}:${port}/`)
  })
}

async function route(req: IncomingMessage, res: ServerResponse): Promise<void> {
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
    l.token = "xxx"
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
