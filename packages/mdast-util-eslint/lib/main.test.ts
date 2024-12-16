import {u} from "unist-builder"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {eslint} from "./main.ts"

test("eslint(): ignores an empty tree", async () => {
  const a = u("root", [])
  await eslint(a)
  const e = u("root", [])
  eq(a, e)
})

test("eslint(): ignores a fenced code block without a language", async () => {
  const a = u("root", [u("code", "'hi'")])
  await eslint(a)
  const e = u("root", [u("code", "'hi'")])
  eq(a, e)
})

test("eslint(): lints a fenced code block with a language", async () => {
  const a = u("root", [u("code", {lang: "js"}, "'hi'")])
  await eslint(a)
  const e = u("root", [u("code", {lang: "js"}, '"hi"')])
  eq(a, e)
})

test("eslint(): lints a fenced code block with a non-extension language", async () => {
  const a = u("root", [u("code", {lang: "javascript"}, "'hi'")])
  await eslint(a)
  const e = u("root", [u("code", {lang: "javascript"}, '"hi"')])
  eq(a, e)
})

test.run()
