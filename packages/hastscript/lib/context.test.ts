import {test} from "uvu"
import {is} from "uvu/assert"
import * as ctx from "./context.ts"

test("satisfies c8", () => {
  const c = ctx.createContext("")
  const v = ctx.useContext(c)
  is(typeof ctx, "object")
  is(typeof c, "object")
  is(typeof v, "string")
})
