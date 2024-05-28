import "./main.ts"
import {equal as eq, is} from "uvu/assert"

const {ServerClient: Client} = window

it("adds client constructor to the window", () => {
  const c = new Client()
  is(c instanceof Client, true)
})

it("assigns a document editor config", async () => {
  const c = new Client()
  c.baseURL = "http://localhost:4000/"
  const [r] = await c.documentEditor.assign({documentType: "word"})
  eq(r, {documentType: "word", token: "xxx"})
})
