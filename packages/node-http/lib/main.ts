import type {IncomingMessage} from "node:http"

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
