/* eslint-disable unicorn/no-useless-undefined */

import {test} from "uvu"
import {is} from "uvu/assert"
import {join, split} from "./main.ts"

test("join(): joins multiple errors into a single error", () => {
  const a = new Error("a")
  const b = new Error("b")
  const c = join(a, b)

  try {
    throw c
  } catch (e) {
    is(e instanceof Error && e.message, "a\nb")
  }
})

test("join(): ignores an undefined error", () => {
  const a = new Error("a")
  const b = join(undefined, a, undefined)

  try {
    throw b
  } catch (e) {
    is(e instanceof Error && e.message, "a")
  }
})

test("split(): splits an error into multiple errors", () => {
  const a = new Error("a")
  const b = new Error("b")
  const c = join(a, b)
  const d = split(c)

  try {
    throw d[0]
  } catch (e) {
    is(e instanceof Error && e.message, "a")
  }

  try {
    throw d[1]
  } catch (e) {
    is(e instanceof Error && e.message, "b")
  }
})

test("split(): ignores an undefined error", () => {
  const b = split(undefined)
  is(b.length, 0)
})

test.run()
