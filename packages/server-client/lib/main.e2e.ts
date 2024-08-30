import {is} from "uvu/assert"
import {Client} from "./main.ts"

it("signs a document editor config", async () => {
  const c = new Client()
  c.baseURL = "http://localhost:4000/"
  const [r] = await c.documentEditor.sign(
    {
      empty: false,
    },
    {
      documentType: "word",
      document: {
        fileType: "docx",
        key: "",
        title: "",
        url: "",
      },
    },
  )
  is(r.documentType, "word")
  is(typeof r.token, "string")
  is.not(r.token, "")
})
