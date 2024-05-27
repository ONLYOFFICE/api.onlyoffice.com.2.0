import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {
  booleanType,
  config,
  documentEditor,
  enumType,
  functionType,
  literalType,
  numberType,
  property,
  stringType,
  typeNode
} from "./well.ts"

test("creates a type node with correct order of keys", () => {
  const n = typeNode()
  const a = Object.keys(n)
  eq(a, ["type"])
})

test("creates a type node with an empty type", () => {
  const n = typeNode()
  is(n.type, "")
})

test("creates a string type with correct order of keys", () => {
  const n = typeNode()
  const t = stringType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a string type with the string type", () => {
  const n = typeNode()
  const t = stringType(n)
  is(t.type, "string")
})

test("creates a number type with correct order of keys", () => {
  const n = typeNode()
  const t = numberType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a number type with the number type", () => {
  const n = typeNode()
  const t = numberType(n)
  is(t.type, "number")
})

test("creates a literal type with correct order of keys", () => {
  const tn = typeNode()
  const bn = typeNode()
  const bt = stringType(bn)
  const tt = literalType(tn, bt, "foo")
  const a = Object.keys(tt)
  eq(a, ["type", "base", "const"])
})

test("creates a literal type with the literal type", () => {
  const tn = typeNode()
  const bn = typeNode()
  const bt = stringType(bn)
  const tt = literalType(tn, bt, "foo")
  is(tt.type, "literal")
  eq(tt.base, bt)
  eq(tt.const, "foo")
})

test("creates a enum type with correct order of keys", () => {
  const tn = typeNode()
  const cn = typeNode()
  const ct = stringType(cn)
  const tt = enumType(tn, [ct])
  const a = Object.keys(tt)
  eq(a, ["type", "cases"])
})

test("creates a enum type with the enum type", () => {
  const tn = typeNode()
  const cn = typeNode()
  const ct = stringType(cn)
  const tt = enumType(tn, [ct])
  is(tt.type, "enum")
  eq(tt.cases, [ct])
})

test("creates a function type with correct order of keys", () => {
  const n = typeNode()
  const t = functionType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a function type with the function type", () => {
  const n = typeNode()
  const t = functionType(n)
  is(t.type, "function")
})

test("creates a boolean type with correct order of keys", () => {
  const n = typeNode()
  const t = booleanType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a boolean type with the boolean type", () => {
  const n = typeNode()
  const t = booleanType(n)
  is(t.type, "boolean")
})

test("creates a property with correct order of keys", () => {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  const a = Object.keys(p)
  eq(a, ["path", "href", "type", "format", "default"])
})

test("creates a property with the correct type", () => {
  const n = typeNode()
  const t = stringType(n)
  const p = property(t)
  is(p.path, "")
  is(p.href, "")
  eq(p.type, t)
  is(p.format, undefined)
  is(p.default, undefined)
})

test("creates a document editor with correct order of keys", () => {
  const d = documentEditor()
  const a = Object.keys(d)
  eq(a, ["documentServerURL", "config"])
})

test("creates a document editor with an empty config", () => {
  const d = documentEditor()
  is(d.documentServerURL, "")
  eq(d.config, [])
})

test("creates a config with correct order of keys", () => {
  const d = documentEditor()
  const c = config(d)
  const a = Object.keys(c)
  eq(a, ["documentEditor"])
})

test("creates a config with the correct document editor", () => {
  const d = documentEditor()
  const c = config(d)
  eq(c.documentEditor, d)
})

test.run()
