// todo: add tests for the browser environment

import {is} from "uvu/assert"
import {test} from "uvu"
import {callerPosition} from "./main.ts"

test("returns the position of the caller", () => {
  const [l, c] = callerPosition(0)
  is(l, 8)
  is(c, 18)
})

test.run()
