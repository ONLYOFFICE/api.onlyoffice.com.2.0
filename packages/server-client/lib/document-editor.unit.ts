import {body} from "@onlyoffice/node-http"
import {suite} from "uvu"
import {equal as eq, is, unreachable as un} from "uvu/assert"
import {Client, ResponseError} from "./client.ts"
import {DocumentEditorService} from "./document-editor.ts"
import {type Teardown, setup} from "./shared.ts"

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

  s.on("request", (req, res) => {
    is(req.method, "POST")
    is(req.url, "/editors/configcreate")
    body(req)
      .then((b) => {
        const j = JSON.parse(b)
        j.token = "xxx"
        const c = JSON.stringify(j)

        res.setHeader("Content-Type", "application/json")
        res.write(c)
        res.end()
      })
      .catch(un)
  })

  const [r, req, res] = await c.documentEditor.sign(
    {empty: false},
    {documentType: "word"},
  )

  is(res.status, 200)
  is(req.method, "POST")
  eq(r, {documentType: "word", token: "xxx"})
})

test("throws an error if the response is not ok", async (ctx) => {
  const [c, s, t] = setup()
  ctx.t = t

  s.on("request", (_, res) => {
    res.statusCode = 500
    res.end()
  })

  try {
    const [_, __, res] = await c.documentEditor.sign(
      {empty: false},
      {documentType: "word"},
    )
    un(`Expected an error, but got '${res.status}'`)
  } catch (e) {
    is(e instanceof ResponseError, true)
  }
})

test.run()
