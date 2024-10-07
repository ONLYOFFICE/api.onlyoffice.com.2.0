import {test} from "uvu"
import {equal as eq, is} from "uvu/assert"
import {
  ApiKeyAuthorization,
  ArrayType,
  BooleanType,
  CircularReference,
  ComplexType,
  Entity,
  EnumType,
  Example,
  GroupDeclaration,
  IntegerType,
  LiteralType,
  NoopConst,
  NoopType,
  NullType,
  NumberType,
  ObjectType,
  OperationDeclaration,
  PassthroughConst,
  Property,
  Request,
  Response,
  StringType,
  UnionType,
  UnknownType,
} from "./main.ts"

test("Example: initializes an empty instance", () => {
  const e = new Example()
  const k = Object.keys(e)
  eq(k, ["syntax", "code"])
  is(e.syntax, "")
  is(e.code, "")
})

test("CircularReference: initializes an empty instance", () => {
  const r = new CircularReference()
  const k = Object.keys(r)
  eq(k, ["type"])
  is(r.type, "circular")
})

test("UnknownType: initializes an empty instance", () => {
  const t = new UnknownType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "unknown")
})

test("UnionType: initializes an empty instance", () => {
  const t = new UnionType()
  const k = Object.keys(t)
  eq(k, ["type", "types"])
  is(t.type, "union")
  eq(t.types, [])
})

test("StringType: initializes an empty instance", () => {
  const t = new StringType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "string")
})

test("ObjectType: initializes an empty instance", () => {
  const t = new ObjectType()
  const k = Object.keys(t)
  eq(k, ["type", "properties"])
  is(t.type, "object")
  eq(t.properties, [])
})

test("NumberType: initializes an empty instance", () => {
  const t = new NumberType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "number")
})

test("NullType: initializes an empty instance", () => {
  const t = new NullType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "null")
})

test("NoopType: initializes an empty instance", () => {
  const t = new NoopType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "noop")
})

test("LiteralType: initializes an empty instance", () => {
  const t = new LiteralType()
  const k = Object.keys(t)
  eq(k, ["type", "base", "const"])
  is(t.type, "literal")
  eq(t.base, new NoopType())
  eq(t.const, new NoopConst())
})

test("IntegerType: initializes an empty instance", () => {
  const t = new IntegerType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "integer")
})

test("EnumType: initializes an empty instance", () => {
  const t = new EnumType()
  const k = Object.keys(t)
  eq(k, ["type", "cases"])
  is(t.type, "enum")
  eq(t.cases, [])
})

test("BooleanType: initializes an empty instance", () => {
  const t = new BooleanType()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "boolean")
})

test("ComplexType: initializes an empty instance", () => {
  const t = new ComplexType()
  const k = Object.keys(t)
  eq(k, ["type", "by", "entities"])
  is(t.type, "complex")
  is(t.by, "")
  eq(t.entities, [])
})

test("ArrayType: initializes an empty instance", () => {
  const t = new ArrayType()
  const k = Object.keys(t)
  eq(k, ["type", "items"])
  is(t.type, "array")
  eq(t.items, new Entity())
})

test("PassthroughConst: initializes an empty instance", () => {
  const c = new PassthroughConst()
  const k = Object.keys(c)
  eq(k, ["type", "value"])
  is(c.type, "passthrough")
  is(c.value, "")
})

test("NoopConst: initializes an empty instance", () => {
  const c = new NoopConst()
  const k = Object.keys(c)
  eq(k, ["type"])
  is(c.type, "noop")
})

test("Entity: initializes an empty instance", () => {
  const e = new Entity()
  const k = Object.keys(e)
  eq(k, ["description", "deprecated", "type", "format", "default", "example"])
  is(e.description, "")
  is(e.deprecated, false)
  eq(e.type, new NoopType())
  is(e.format, "")
  eq(e.default, new NoopConst())
  eq(e.example, new NoopConst())
})

test("Property: initializes an empty instance", () => {
  const p = new Property()
  const k = Object.keys(p)
  eq(k, ["identifier", "required", "self"])
  is(p.identifier, "")
  is(p.required, false)
  eq(p.self, new Entity())
})

test("Response: initializes an empty instance", () => {
  const r = new Response()
  const k = Object.keys(r)
  eq(k, ["status", "description", "body"])
  eq(r.status, -1)
  is(r.description, "")
  eq(r.body, new Entity())
})

test("ApiKeyAuthorization: initializes an empty instance", () => {
  const a = new ApiKeyAuthorization()
  const k = Object.keys(a)
  eq(k, ["type", "identifier", "description", "in", "scopes"])
  is(a.type, "apiKey")
  is(a.identifier, "")
  is(a.description, "")
  is(a.in, "")
  eq(a.scopes, [])
})

test("Request: initializes an empty instance", () => {
  const r = new Request()
  const k = Object.keys(r)
  eq(k, [
    "method",
    "path",
    "description",
    "authorizations",
    "headerParameters",
    "cookieParameters",
    "pathParameters",
    "queryParameters",
    "bodyParameters",
    "examples",
  ])
  is(r.method, "")
  is(r.path, "")
  is(r.description, "")
  eq(r.authorizations, [])
  eq(r.headerParameters, new Entity())
  eq(r.cookieParameters, new Entity())
  eq(r.pathParameters, new Entity())
  eq(r.queryParameters, new Entity())
  eq(r.bodyParameters, new Entity())
  eq(r.examples, [])
})

test("OperationDeclaration: initializes an empty instance", () => {
  const o = new OperationDeclaration()
  const k = Object.keys(o)
  eq(k, [
    "id",
    "type",
    "name",
    "parent",
    "deprecated",
    "request",
    "responses",
  ])
  is(o.id, "")
  is(o.type, "operation")
  is(o.name, "")
  is(o.parent, "")
  is(o.deprecated, false)
  eq(o.request, new Request())
  eq(o.responses, [])
})

test("GroupDeclaration: initializes an empty instance", () => {
  const g = new GroupDeclaration()
  const k = Object.keys(g)
  eq(k, ["id", "type", "name", "description", "parent", "children"])
  is(g.id, "")
  is(g.type, "group")
  is(g.name, "")
  is(g.description, "")
  is(g.parent, "")
  eq(g.children, [])
})

test.run()
