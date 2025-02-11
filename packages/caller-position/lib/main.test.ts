/* eslint-disable unicorn/error-message */
// todo: add tests for the browser environment

import {test} from "uvu"
import {is} from "uvu/assert"
import {callerPosition} from "./main.ts"

test("returns the position of the caller", () => {
  const e = new Error()
  const [l, c] = callerPosition(e)
  is(l, 9)
  is(c, 13)
})

test.run()
