/* eslint-disable unicorn/error-message */
// todo: add tests for the browser environment

import {is} from "uvu/assert"
import {test} from "uvu"
import {callerPosition} from "./main.ts"

test("returns the position of the caller", () => {
  const [l, c] = callerPosition(new Error())
  is(l, 9)
  is(c, 33)
})

test.run()
