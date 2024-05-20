import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {
  anyType,
  arrayType,
  classDeclaration,
  constructDeclaration,
  declarationNode,
  eventDeclaration,
  functionReturns,
  functionType,
  literalType,
  methodDeclaration,
  objectType,
  passthroughType,
  propertyDeclaration,
  typeDeclaration,
  typeNode,
  unionType,
  unknownType,
  value,
  voidType
} from "./main.ts"

test("creates a type node with correct order of keys", () => {
  const t = typeNode()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a type node with defaults", () => {
  const t = typeNode()
  is(t.type, "")
})

test("creates a void type with correct order of keys", () => {
  const n = typeNode()
  const t = voidType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates a void type with defaults", () => {
  const n = typeNode()
  const t = voidType(n)
  is(t.type, "void")
})

test("creates an unknown type with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates an unknown type with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  is(t.type, "unknown")
})

test("creates a union type with correct order of keys", () => {
  const n = typeNode()
  const t = unionType(n)
  const a = Object.keys(t)
  eq(a, ["type", "types"])
})

test("creates a union type with defaults", () => {
  const n = typeNode()
  const t = unionType(n)
  is(t.type, "union")
  eq(t.types, [])
})

test("creates a passthrough type with correct order of keys", () => {
  const n = typeNode()
  const t = passthroughType(n, {})
  const a = Object.keys(t)
  eq(a, ["type", "value"])
})

test("creates a passthrough type with defaults", () => {
  const n = typeNode()
  const t = passthroughType(n, {})
  is(t.type, "passthrough")
  eq(t.value, {})
})

test("creates an object type with correct order of keys", () => {
  const n = typeNode()
  const t = objectType(n)
  const a = Object.keys(t)
  eq(a, ["type", "properties", "methods"])
})

test("creates an object type with defaults", () => {
  const n = typeNode()
  const t = objectType(n)
  is(t.type, "object")
  is(t.properties, undefined)
  is(t.methods, undefined)
})

test("creates a literal type with correct order of keys", () => {
  const n = typeNode()
  const t = literalType(n, "")
  const a = Object.keys(t)
  eq(a, ["type", "value"])
})

test("creates a literal type with defaults", () => {
  const n = typeNode()
  const t = literalType(n, "s")
  is(t.type, "literal")
  is(t.value, "s")
})

test("creates a function returns with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const r = functionReturns(t)
  const a = Object.keys(r)
  eq(a, ["signature", "description", "type"])
})

test("creates a function returns with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  const r = functionReturns(t)
  is(r.signature, undefined)
  is(r.description, undefined)
  eq(r.type, t)
})

test("creates a function type with correct order of keys", () => {
  const n = typeNode()
  const t = functionType(n)
  const a = Object.keys(t)
  eq(a, ["type", "parameters", "returns"])
})

test("creates a function type with defaults", () => {
  const n = typeNode()
  const t = functionType(n)
  is(t.type, "function")
  is(t.parameters, undefined)
  is(t.returns, undefined)
})

test("creates an array type with correct order of keys", () => {
  const n = typeNode()
  const t = arrayType(n)
  const a = Object.keys(t)
  eq(a, ["type", "items"])
})

test("creates an array type with defaults", () => {
  const n = typeNode()
  const t = arrayType(n)
  is(t.type, "array")
  is(t.items, undefined)
})

test("creates an any type with correct order of keys", () => {
  const n = typeNode()
  const t = anyType(n)
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("creates an any type with defaults", () => {
  const n = typeNode()
  const t = anyType(n)
  is(t.type, "any")
})

test("creates a value with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const v = value(t)
  const a = Object.keys(v)
  eq(a, valueKeys())
})

test("creates a value with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  const v = value(t)
  is(v.identifier, "")
  is(v.signature, undefined)
  is(v.description, undefined)
  is(v.default, undefined)
  eq(v.type, t)
})

test("creates a declaration node with correct order of keys", () => {
  const d = declarationNode()
  const a = Object.keys(d)
  eq(a, declarationNodeKeys())
})

test("creates a declaration node with defaults", () => {
  const d = declarationNode()
  is(d.id, "")
  is(d.kind, "")
  is(d.title, "")
  is(d.summary, undefined)
  is(d.description, undefined)
  is(d.parent, undefined)
  is(d.identifier, "")
  is(d.signature, undefined)
  is(d.examples, undefined)
  is(d.overloads, undefined)
  is(d.overloadsBy, undefined)
  is(d.tryIt, undefined)
})

test("creates a type declaration with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const d = declarationNode()
  const td = typeDeclaration(t, d)
  const a = Object.keys(td)
  eq(a, [...declarationNodeKeys(), "type"])
})

test("creates a type declaration with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  const d = declarationNode()
  const td = typeDeclaration(t, d)
  is(td.kind, "type")
  eq(td.type, t)
})

test.skip("creates a property declaration with correct order of keys", () => {
  const n = typeNode()
  const t = unknownType(n)
  const v = value(t)
  const d = declarationNode()
  const p = propertyDeclaration(v, d)
  const a = Object.keys(p)
  eq(a, [...declarationNodeKeys(), "scope", ...valueKeys()])
})

test.skip("creates a property declaration with defaults", () => {
  const n = typeNode()
  const t = unknownType(n)
  const v = value(t)
  const d = declarationNode()
  const p = propertyDeclaration(v, d)
  is(p.kind, "property")
  is(p.scope, "instance")
})

test("creates a method declaration with correct order of keys", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const m = methodDeclaration(t, d)
  const a = Object.keys(m)
  eq(a, [...declarationNodeKeys(), "scope", "type"])
})

test("creates a method declaration with defaults", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const m = methodDeclaration(t, d)
  is(m.kind, "method")
  is(m.scope, "instance")
  eq(m.type, t)
})

test("creates an event declaration with correct order of keys", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const e = eventDeclaration(t, d)
  const a = Object.keys(e)
  eq(a, [...declarationNodeKeys(), "type"])
})

test("creates an event declaration with defaults", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const e = eventDeclaration(t, d)
  is(e.kind, "event")
  eq(e.type, t)
})

test("creates a construct declaration with correct order of keys", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const c = constructDeclaration(t, d)
  const a = Object.keys(c)
  eq(a, [...declarationNodeKeys(), "type"])
})

test("creates a construct declaration with defaults", () => {
  const n = typeNode()
  const t = functionType(n)
  const d = declarationNode()
  const c = constructDeclaration(t, d)
  is(c.kind, "constructor")
  eq(c.type, t)
})

test("creates a class declaration with correct order of keys", () => {
  const d = declarationNode()
  const c = classDeclaration(d)
  const a = Object.keys(c)
  eq(a, [
    ...declarationNodeKeys(),
    "constructors",
    "events",
    "extends",
    "extendsBy",
    "instanceMethods",
    "instanceProperties",
    "typeMethods",
    "typeProperties"
  ])
})

test("creates a class declaration with defaults", () => {
  const d = declarationNode()
  const c = classDeclaration(d)
  is(c.kind, "class")
  is(c.constructors, undefined)
  is(c.events, undefined)
  is(c.extends, undefined)
  is(c.extendsBy, undefined)
  is(c.instanceMethods, undefined)
  is(c.instanceProperties, undefined)
  is(c.typeMethods, undefined)
  is(c.typeProperties, undefined)
})

test.run()

function valueKeys(): string[] {
  return [
    "identifier",
    "signature",
    "description",
    "default",
    "type"
  ]
}

function declarationNodeKeys(): string[] {
  return [
    "id",
    "kind",
    "title",
    "summary",
    "description",
    "parent",
    "identifier",
    "signature",
    "examples",
    "overloads",
    "overloadsBy",
    "tryIt"
  ]
}
