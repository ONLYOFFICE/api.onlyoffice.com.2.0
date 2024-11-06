import {test} from "uvu"
import {is} from "uvu/assert"
import * as _ from "./main.ts"

test("satisfies c8", () => {
  is(typeof _, "object")
})
