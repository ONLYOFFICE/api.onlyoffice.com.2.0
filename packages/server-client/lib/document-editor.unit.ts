import {body} from "@onlyoffice/node-http"
import {equal as eq, is, unreachable as un} from "uvu/assert"
import {suite} from "uvu"
import {type Teardown, setup} from "./shared.ts"
import {DocumentEditorService} from "./document-editor.ts"
import {Client, ErrorResponse} from "./client.ts"

interface Context {
  t: Teardown
}

const test = suite<Context>("", {t() {}})

test.after.each((ctx) => {
  ctx.t()
})

test("creates a services", () => {
  const c = new Client()
  const s = new DocumentEditorService(c)
  is(s instanceof DocumentEditorService, true)
})

test("signs a document editor config", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", async (req, res) => {
    is(req.method, "POST")
    is(req.url, "/editors/configcreate")

    const b = await body(req)
    const j = JSON.parse(b)
    j.token = "xxx"
    const c = JSON.stringify(j)

    res.setHeader("Content-Type", "application/json")
    res.write(c)
    res.end()
  })

  const [r, req, res] = await c.documentEditor.sign({documentType: "word"})

  is(res.status, 200)
  is(req.method, "POST")
  eq(r, {documentType: "word", token: "xxx"})
})

test("throws an error if the response is not ok", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", async (_, res) => {
    res.statusCode = 500
    res.end()
  })

  try {
    const [_, __, res] = await c.documentEditor.sign({documentType: "word"})
    un(`Expected an error, but got '${res.status}'`)
  } catch (e) {
    is(e instanceof ErrorResponse, true)
  }
})

test.run()
