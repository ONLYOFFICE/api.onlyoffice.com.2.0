/* c8 ignore start */
import type {IncomingMessage} from "node:http"
import {createServer} from "node:http"
import {Client} from "./main.ts"

export type Server = ReturnType<typeof createServer>
export type Teardown = () => void

export function setup(): [Client, Server, Teardown] {
  const c = new Client()

  const s = createServer()
  s.listen()

  const a = s.address()
  if (!a || typeof a === "string") {
    s.close()
    throw new Error("Server address is not available")
  }

  c.baseURL = `http://localhost:${a.port}/`
  return [c, s, s.close.bind(s)]
}

export async function body(req: IncomingMessage): Promise<string> {
  return await new Promise<string>((res, rej) => {
    req.on("error", rej)

    let b = ""

    req.on("data", (d) => {
      b += String(d)
    })

    req.on("end", () => {
      res(b)
    })
  })
}
