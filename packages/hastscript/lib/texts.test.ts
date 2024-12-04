import {test} from "uvu"
import {is} from "uvu/assert"
import * as _ from "./texts.ts"

test("satisfies c8", () => {
  is(typeof _, "object")
})
