import {is} from "uvu/assert"
import {test} from "uvu"
import {camelToDash} from "./main.ts"

test("returns an empty string when for the empty string", () => {
  const s = camelToDash("")
  is(s, "")
})

test("returns a string without changes when the string has no capital letters", () => {
  const s = camelToDash("foo")
  is(s, "foo")
})

test("returns a string with a dash when the string has one capital letter", () => {
  const s = camelToDash("fooBar")
  is(s, "foo-bar")
})

test("returns a string with multiple dashes when the string has multiple capital letters", () => {
  const s = camelToDash("fooBarBaz")
  is(s, "foo-bar-baz")
})

test("returns a string with multiple dashes when the string includes sequences of capital letters", () => {
  const s = camelToDash("fooBAR")
  is(s, "foo-b-a-r")
})

test.run()
