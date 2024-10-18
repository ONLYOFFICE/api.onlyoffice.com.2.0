import {
  ArrayType,
  CircularReference,
  ComplexType,
  Entity,
  EnumType,
  NumberType,
  ObjectType,
  OperationDeclaration,
  Property,
  Request,
  Response,
  StringType,
} from "@onlyoffice/service-declaration"
import {
  KeywordToken,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"
import {normalize} from "@onlyoffice/signature/utils.ts"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  computeDeclaration,
  computeEntity,
  computeProperty,
  computeRequest,
  computeResponse,
  computeType,
} from "./main.ts"

test("computeType: computes signature for an empty array type", () => {
  const a = new ArrayType()
  computeType(a)
  const e = new ArrayType()
  eq(a, e)
})

test("computeType: computes signature for an array with a circular reference", () => {
  const a = new ArrayType()
  a.items = new CircularReference()

  computeType(a)

  const e = new ArrayType()
  e.items = new CircularReference()

  eq(a, e)
})

test("computeType: computes signature for an array with an entity", () => {
  const a = new ArrayType()
  a.items = es0()

  computeType(a)

  const e = new ArrayType()
  e.items = es1()

  eq(a, e)
})

test("computeType: computes signature for an empty complex type", () => {
  const a = new ComplexType()
  computeType(a)
  const e = new ComplexType()
  eq(a, e)
})

test("computeType: computes signature for a complex type with entities", () => {
  const a = new ComplexType()
  a.by = "allOf"
  a.entities = [es0(), en0()]

  computeType(a)

  const e = new ComplexType()
  e.by = "allOf"
  e.entities = [es1(), en1()]

  eq(a, e)
})

test("computeType: computes signature for an empty enum type", () => {
  const a = new EnumType()
  computeType(a)
  const e = new EnumType()
  eq(a, e)
})

test("computeType: computes signature for an enum type with cases", () => {
  const a = new EnumType()
  a.cases = [es0(), en0()]

  computeType(a)

  const e = new EnumType()
  e.cases = [es1(), en1()]

  eq(a, e)
})

test("computeType: computes signature for an empty object type", () => {
  const a = new ObjectType()
  computeType(a)
  const e = new ObjectType()
  eq(a, e)
})

test("computeType: computes signature for an object type with properties", () => {
  const a = new ObjectType()
  let p: Property

  p = new Property()
  p.self = es0()
  a.properties.push(p)

  p = new Property()
  p.self = en0()
  a.properties.push(p)

  computeType(a)

  const e = new ObjectType()

  p = new Property()
  p.self = es1()
  e.properties.push(p)

  p = new Property()
  p.self = en1()
  e.properties.push(p)

  eq(a, e)
})

test("computeEntity: computes signature for an entity", () => {
  const a = new Entity()
  a.type = new ArrayType()
  a.type.items = es0()

  computeEntity(a)

  const e = new Entity()
  let t: Token

  e.type = new ArrayType()
  e.type.items = es1()

  t = new TypeToken()
  t.text = "array"
  e.signature.push(t)

  t = new TypeToken()
  t.text = " of "
  e.signature.push(t)

  t = new TypeToken()
  t.text = "string"
  e.signature.push(t)

  e.signature = normalize(e.signature)

  eq(a, e)
})

test("computeProperty: computes signature for a property", () => {
  const a = new Property()
  a.self = es0()

  computeProperty(a)

  const e = new Property()
  e.self = es1()

  eq(a, e)
})

test("computeResponse: computes signature for a response", () => {
  const a = new Response()
  a.body = eo0()

  computeResponse(a)

  const e = new Response()
  e.body = eo1()

  eq(a, e)
})

test("computeRequest: computes signature for a request", () => {
  const a = new Request()
  a.method = "GET"
  a.path = "/"
  a.headerParameters = eo0()
  a.cookieParameters = eo0()
  a.pathParameters = eo0()
  a.queryParameters = eo0()
  a.bodyParameters = eo0()

  computeRequest(a)

  const e = new Request()
  let t: Token

  e.method = "GET"
  e.path = "/"
  e.headerParameters = eo1()
  e.cookieParameters = eo1()
  e.pathParameters = eo1()
  e.queryParameters = eo1()
  e.bodyParameters = eo1()

  t = new KeywordToken()
  t.text = "GET"
  e.signature.push(t)

  t = new TextToken()
  t.text = " "
  e.signature.push(t)

  t = new StringToken()
  t.text = "/"
  e.signature.push(t)

  eq(a, e)
})

test("computeDeclaration: computes signature for a operation declaration", () => {
  const a = new OperationDeclaration()
  a.request.method = "GET"

  let r = new Response()
  r.body = eo0()
  a.responses.push(r)

  computeDeclaration(a)

  const e = new OperationDeclaration()

  e.request.method = "GET"
  const t = new KeywordToken()
  t.text = "GET"
  e.request.signature.push(t)

  r = new Response()
  r.body = eo1()
  e.responses.push(r)

  eq(a, e)
})

test.run()

function en0(): Entity {
  const e = new Entity()
  e.type = new NumberType()
  return e
}

function eo0(): Entity {
  const e = new Entity()
  e.type = new ObjectType()
  return e
}

function es0(): Entity {
  const e = new Entity()
  e.type = new StringType()
  return e
}

function en1(): Entity {
  const e = new Entity()
  e.type = new NumberType()
  const t = new TypeToken()
  t.text = "number"
  e.signature.push(t)
  return e
}

function eo1(): Entity {
  const e = new Entity()
  e.type = new ObjectType()
  const t = new TypeToken()
  t.text = "object"
  e.signature.push(t)
  return e
}

function es1(): Entity {
  const e = new Entity()
  e.type = new StringType()
  const t = new TypeToken()
  t.text = "string"
  e.signature.push(t)
  return e
}
