import type {IncomingMessage, ServerResponse} from "node:http"
import {createServer} from "node:http"
import {body} from "@onlyoffice/node-http"

const config = {
  hostname: "0.0.0.0",
  port: 4000
}

main()

function main(): void {
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

  s.listen(config.port, config.hostname, () => {
    console.log(`Server running at http://${config.hostname}:${config.port}/`)
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
    const jj = JSON.parse(j.jsonConfig)
    jj.token = "xxx"
    const cc = JSON.stringify(jj)
    j.jsonConfig = cc
    const c = JSON.stringify(j)

    res.statusCode = 200
    res.setHeader("Content-Type", "application/json")
    res.write(c)
    res.end()
    return
  }

  throw new Error("Unknown route")
}
