import {equal as eq, is} from "uvu/assert"
import {Client} from "./main.ts"

it("assigns a document editor config", async () => {
  const c = new Client()
  c.baseURL = "http://localhost:4000/"
  const [r] = await c.documentEditor.assign({documentType: "word"})
  const a = Object.keys(r)
  eq(a, ["documentType", "token"])
  is(r.documentType, "word")
  is(typeof r.token, "string")
  is.not(r.token, "")
})
