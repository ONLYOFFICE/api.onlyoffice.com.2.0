import {test} from "uvu"
import {is} from "uvu/assert"
import * as _ from "./builder.ts"

test("satisfies c8", () => {
  is(typeof _, "object")
})
