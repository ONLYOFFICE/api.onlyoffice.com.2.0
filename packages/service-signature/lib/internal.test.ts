import {
  ArrayType,
  BooleanType,
  CircularReference,
  ComplexType,
  Entity,
  EnumType,
  IntegerType,
  LiteralType,
  NoopType,
  NullType,
  NumberType,
  ObjectType,
  Request,
  StringType,
  UnionType,
  UnknownType,
} from "@onlyoffice/service-declaration"
import {
  KeywordToken,
  type Signature,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  arrayType,
  booleanType,
  complexType,
  // entity,
  enumType,
  integerType,
  literalType,
  noopType,
  nullType,
  numberType,
  objectType,
  request,
  stringType,
  // type,
  unionType,
  unknownType,
} from "./internal.ts"

test("unknownType: creates a signature", () => {
  const d = new UnknownType()
  const a = unknownType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "unknown"
  e.push(t)

  eq(a, e)
})

test("unionType: creates a signature", () => {
  const d = new UnionType()
  const a = unionType(d)
  const e: Signature = []
  eq(a, e)
})

test("stringType: creates a signature", () => {
  const d = new StringType()
  const a = stringType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "string"
  e.push(t)

  eq(a, e)
})

test("objectType: creates a signature", () => {
  const d = new ObjectType()
  const a = objectType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "object"
  e.push(t)

  eq(a, e)
})

test("numberType: creates a signature", () => {
  const d = new NumberType()
  const a = numberType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "number"
  e.push(t)

  eq(a, e)
})

test("nullType: creates a signature", () => {
  const d = new NullType()
  const a = nullType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "null"
  e.push(t)

  eq(a, e)
})

test("noopType: creates a signature", () => {
  const d = new NoopType()
  const a = noopType(d)
  const e: Signature = []
  eq(a, e)
})

test("literalType: creates a signature", () => {
  const d = new LiteralType()
  const a = literalType(d)
  const e: Signature = []
  eq(a, e)
})

test("integerType: creates a signature", () => {
  const d = new IntegerType()
  const a = integerType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "integer"
  e.push(t)

  eq(a, e)
})

test("enumType: creates a signature for an empty enum", () => {
  const d = new EnumType()
  const a = enumType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "enum"
  e.push(t)

  eq(a, e)
})

test("enumType: creates a signature for an enum with cases", () => {
  const d = new EnumType()
  let c: Entity

  c = new Entity()
  c.type = new LiteralType()
  c.type.base = new StringType()
  d.cases.push(c)

  c = new Entity()
  c.type = new LiteralType()
  c.type.base = new NumberType()
  d.cases.push(c)

  const a = enumType(d)

  const e: Signature = []
  let t: Token

  t = new TypeToken()
  t.text = "enum"
  e.push(t)

  t = new TypeToken()
  t.text = " of "
  e.push(t)

  t = new TypeToken()
  t.text = "string"
  e.push(t)

  eq(a, e)
})

test("complexType: creates a signature for an empty complex type", () => {
  const d = new ComplexType()
  const a = complexType(d)
  const e: Signature = []
  eq(a, e)
})

test("complexType: creates a signature for allOf", () => {
  const d = new ComplexType()
  d.by = "allOf"

  const a = complexType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "all of"
  e.push(t)

  eq(a, e)
})

test("complexType: creates a signature for anyOf", () => {
  const d = new ComplexType()
  d.by = "anyOf"

  const a = complexType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "any of"
  e.push(t)

  eq(a, e)
})

test("complexType: creates a signature for oneOf", () => {
  const d = new ComplexType()
  d.by = "oneOf"

  const a = complexType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "one of"
  e.push(t)

  eq(a, e)
})

test("booleanType: creates a signature", () => {
  const d = new BooleanType()
  const a = booleanType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "boolean"
  e.push(t)

  eq(a, e)
})

test("arrayType: creates a signature for an empty array", () => {
  const d = new ArrayType()
  const a = arrayType(d)

  const e: Signature = []
  const t = new TypeToken()
  t.text = "array"
  e.push(t)

  eq(a, e)
})

test("arrayType: create a signature for an array with a circular reference", () => {
  const d = new ArrayType()
  d.items = new CircularReference()

  const a = arrayType(d)

  const e: Signature = []
  let t: Token

  t = new TypeToken()
  t.text = "array"
  e.push(t)

  t = new TypeToken()
  t.text = " of "
  e.push(t)

  t = new TypeToken()
  t.text = "circular references"
  e.push(t)

  eq(a, e)
})

test("arrayType: create a signature for an array with an entity", () => {
  const d = new ArrayType()
  d.items = new Entity()
  d.items.type = new StringType()

  const a = arrayType(d)

  const e: Signature = []
  let t: Token

  t = new TypeToken()
  t.text = "array"
  e.push(t)

  t = new TypeToken()
  t.text = " of "
  e.push(t)

  t = new TypeToken()
  t.text = "string"
  e.push(t)

  eq(a, e)
})

test.skip("type", () => {
  // todo
})

test.skip("entity", () => {
  // todo
})

test("request: creates an empty signature", () => {
  const d = new Request()
  const a = request(d)
  const e: Signature = []
  eq(a, e)
})

test("request: creates a signature with a method", () => {
  const d = new Request()
  d.method = "GET"

  const a = request(d)

  const e: Signature = []
  const t = new KeywordToken()
  t.text = "GET"
  e.push(t)

  eq(a, e)
})

test("request: creates a signature with a path", () => {
  const d = new Request()
  d.path = "/"

  const a = request(d)

  const e: Signature = []
  const t = new StringToken()
  t.text = "/"
  e.push(t)

  eq(a, e)
})

test("request: creates a signature with a method and a path", () => {
  const d = new Request()
  d.method = "GET"
  d.path = "/"

  const a = request(d)

  const e: Signature = []
  let t: Token

  t = new KeywordToken()
  t.text = "GET"
  e.push(t)

  t = new TextToken()
  t.text = " "
  e.push(t)

  t = new StringToken()
  t.text = "/"
  e.push(t)

  eq(a, e)
})

test.run()
