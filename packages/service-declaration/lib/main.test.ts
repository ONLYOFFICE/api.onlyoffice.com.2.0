import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {
  arrayType,
  booleanType,
  integerType,
  numberType,
  objectType,
  stringType,
  typeNode,
  unknownType
} from "./main.ts"

test("creates a type node with correct order of keys", () => {
  const t = typeNode()
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates a type node with defaults", () => {
  const t = typeNode()
  is(t.type, "")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates an unknown type with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates an unknown type with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  is(t.type, "unknown")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates a string type with correct order of keys", () => {
  const n = typeNode()
  const t = stringType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates a string type with defaults", () => {
  const n = typeNode()
  const t = stringType(n)
  is(t.type, "string")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates an object type with correct order of keys", () => {
  const n = typeNode()
  const t = objectType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases", "properties"])
})

test("creates an object type with defaults", () => {
  const n = typeNode()
  const t = objectType(n)
  is(t.type, "object")
  is(t.format, undefined)
  is(t.cases, undefined)
  is(t.properties, undefined)
})

test("creates a number type with correct order of keys", () => {
  const n = typeNode()
  const t = numberType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates a number type with defaults", () => {
  const n = typeNode()
  const t = numberType(n)
  is(t.type, "number")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates an integer type with correct order of keys", () => {
  const n = typeNode()
  const t = integerType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates an integer type with defaults", () => {
  const n = typeNode()
  const t = integerType(n)
  is(t.type, "integer")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates a boolean type with correct order of keys", () => {
  const n = typeNode()
  const t = booleanType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases"])
})

test("creates a boolean type with defaults", () => {
  const n = typeNode()
  const t = booleanType(n)
  is(t.type, "boolean")
  is(t.format, undefined)
  is(t.cases, undefined)
})

test("creates an array type with correct order of keys", () => {
  const n = typeNode()
  const t = arrayType(n)
  const a = Object.keys(t)
  eq(a, ["type", "format", "cases", "items"])
})

test("creates an array type with defaults", () => {
  const n = typeNode()
  const t = arrayType(n)
  is(t.type, "array")
  is(t.format, undefined)
  is(t.cases, undefined)
  is(t.items, undefined)
})

test.run()
