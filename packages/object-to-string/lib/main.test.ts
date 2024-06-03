import {is} from "uvu/assert"
import {test} from "uvu"
import {toString} from "./main.ts"

test("stringifies an empty string", () => {
  const s = toString("")
  is(s, '""')
})

test("stringifies a non-empty string", () => {
  const s = toString("a")
  is(s, '"a"')
})

test("uses double quotes for strings by default", () => {
  const s = toString("a")
  is(s, '"a"')
})

test("uses double quotes for strings with single quotes", () => {
  const s = toString("'a'")
  is(s, '"\'a\'"')
})

test("uses single quotes for strings with double quotes", () => {
  const s = toString('"a"')
  is(s, "'\"a\"'")
})

test("uses backticks for strings with double and single quotes", () => {
  const s = toString("'\"a\"'")
  is(s, "`'\"a\"'`")
})

test("stringifies a number", () => {
  const s = toString(1)
  is(s, "1")
})

test("stringifies a boolean", () => {
  const s = toString(true)
  is(s, "true")
})

test("stringifies null", () => {
  const s = toString(null)
  is(s, "null")
})

test("stringifies an empty array", () => {
  const s = toString([])
  is(s, "[]")
})

test("stringifies an array with a string", () => {
  const s = toString(["a"])
  is(s, '[\n  "a"\n]')
})

test("stringifies an array with a number", () => {
  const s = toString([1])
  is(s, "[\n  1\n]")
})

test("stringifies an array with a boolean", () => {
  const s = toString([true])
  is(s, "[\n  true\n]")
})

test("stringifies an array with null", () => {
  const s = toString([null])
  is(s, "[\n  null\n]")
})

test("stringifies an array with an empty array", () => {
  const s = toString([[]])
  is(s, "[\n  []\n]")
})

test("stringifies an array with an non-empty array", () => {
  const s = toString([[1]])
  is(s, "[\n  [\n    1\n  ]\n]")
})

test("stringifies an empty object", () => {
  const s = toString({})
  is(s, "{}")
})

test("stringifies an object with a string", () => {
  const s = toString({a: "b"})
  is(s, '{\n  a: "b"\n}')
})

test("stringifies an object with a number", () => {
  const s = toString({a: 1})
  is(s, "{\n  a: 1\n}")
})

test("stringifies an object with a boolean", () => {
  const s = toString({a: true})
  is(s, "{\n  a: true\n}")
})

test("stringifies an object with a null", () => {
  const s = toString({a: null})
  is(s, "{\n  a: null\n}")
})

test("stringifies an array with an empty object", () => {
  const s = toString([{}])
  is(s, "[\n  {}\n]")
})

test("stringifies an array with an non-empty object", () => {
  const s = toString([{a: 1}])
  is(s, "[\n  {\n    a: 1\n  }\n]")
})

test("stringifies an array with multiple types", () => {
  const s = toString([1, "a", true, null, [], {}])
  is(s, "[\n  1,\n  \"a\",\n  true,\n  null,\n  [],\n  {}\n]")
})

test("stringifies an object with an empty array", () => {
  const s = toString({a: []})
  is(s, "{\n  a: []\n}")
})

test("stringifies an object with an non-empty array", () => {
  const s = toString({a: [1]})
  is(s, "{\n  a: [\n    1\n  ]\n}")
})

test("stringifies an object with multiple types", () => {
  const s = toString({a: 1, b: "a", c: true, d: null, e: [], f: {}})
  is(s, "{\n  a: 1,\n  b: \"a\",\n  c: true,\n  d: null,\n  e: [],\n  f: {}\n}")
})

test("stringifies a function", () => {
  function fn(): void {}
  const s = toString(fn)
  is(s, "function fn(){}")
})

test("respects the function toString", () => {
  function fn(): void {}
  fn.toString = () => "function fn() {}"
  const s = toString(fn)
  is(s, "function fn() {}")
})

test("stringifies an arrow function", () => {
  const fn = (): void => {}
  const s = toString(fn)
  is(s, "()=>{}")
})

test("respects the arrow function toString", () => {
  const fn = (): void => {}
  fn.toString = () => "() => {}"
  const s = toString(fn)
  is(s, "() => {}")
})

test("stringifies an object with a function", () => {
  function fn(): void {}
  const s = toString({a: fn})
  is(s, "{\n  a: function fn(){}\n}")
})

test("stringifies an object with an arrow function", () => {
  const fn = (): void => {}
  const s = toString({a: fn})
  is(s, "{\n  a: ()=>{}\n}")
})

test("stringifies an object with a method", () => {
  const s = toString({a() {}})
  is(s, "{\n  a: a(){}\n}")
})

test("allows to customize the indentation", () => {
  const s = toString({a: 1}, 4)
  is(s, "{\n    a: 1\n}")
})

test.run()
