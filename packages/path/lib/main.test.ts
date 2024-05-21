// todo: rename test cases

import path from "node:path"
import {is} from "uvu/assert"
import {test} from "uvu"
import {relative} from "./main.ts"

test("relative() includes a leading dot", () => {
  const n = path.relative("", "")
  is(n, "")

  const c = relative("", "")
  is(c, "./")
})

test("relative() includes a leading dot", () => {
  const n = path.relative("", "b")
  is(n, "b")

  const c = relative("", "b")
  is(c, "./b")
})

test("relative() includes a leading dot", () => {
  const n = path.relative("/", "/b")
  is(n, "b")

  const c = relative("/", "/b")
  is(c, "./b")
})

test("relative() does not include a leading dot", () => {
  const n = path.relative("a", "b")
  is(n, "../b")

  const c = relative("a", "b")
  is(c, "../b")
})

test.run()
