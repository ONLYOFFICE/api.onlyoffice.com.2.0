import {createServer} from "node:http"
import {is} from "uvu/assert"
import {suite} from "uvu"
import {body} from "./main.ts"

interface Context {
  t: Teardown
}

const test = suite<Context>("", {t() {}})

test.after.each((ctx) => {
  ctx.t()
})

test("reads the full body of a request", async (ctx) => {
  const [u, s, t] = setup()
  ctx.t = t

  s.on("request", async (req, res) => {
    const b = await body(req)
    is(b, "hi")
    res.end()
  })

  const r = await fetch(u, {method: "POST", body: "hi"})
  is(r.status, 200)
})

test.run()

export type Server = ReturnType<typeof createServer>
export type Teardown = () => void

function setup(): [string, Server, Teardown] {
  const s = createServer()
  s.listen()

  const a = s.address()
  if (!a || typeof a === "string") {
    s.close()
    throw new Error("Server address is not available")
  }

  return [`http://localhost:${a.port}/`, s, s.close.bind(s)]
}
