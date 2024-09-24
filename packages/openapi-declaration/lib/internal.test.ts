// todo: cover all retrieve methods.

import * as Service from "@onlyoffice/service-declaration"
import {isValidUUIDV4} from "is-valid-uuid-v4"
import {test} from "uvu"
import {equal as eq, is, unreachable as un} from "uvu/assert"
import {
  ApiKeyAuthorization,
  ArrayType,
  AuthorizationComponent,
  AuthorizationRequirement,
  BooleanType,
  CircularReference,
  ComplexType,
  ComponentsCache,
  DeclarationsCache,
  DirectReference,
  Entity,
  EntityComponent,
  EnumType,
  GroupDeclaration,
  IntegerType,
  LiteralType,
  NoopAuthorization,
  NoopComponent,
  NoopConst,
  NoopType,
  NullType,
  NumberType,
  ObjectType,
  OperationDeclaration,
  Parameter,
  PassthroughConst,
  Property,
  Request,
  Response,
  ResponseComponent,
  ResponseRecord,
  State,
  StringType,
  UnionType,
  UnknownType,
  authorization,
  component,
  declaration,
  type,
} from "./internal.ts"

test("DirectReference: initializes an empty instance", () => {
  const r = new DirectReference()
  const k = Object.keys(r)
  eq(k, ["id"])
  is(r.id, "")
})

test("DirectReference: initializes from an OpenApi.ReferenceObject", () => {
  const [a, ...es] = DirectReference.fromOpenApi({$ref: "$"})
  is(es.length, 0)

  const e = dr("$")
  eq(a, e)
})

test("CircularReference: initializes an empty instance", () => {
  const r = new CircularReference()
  const k = Object.keys(r)
  eq(k, [])
})

test("CircularReference: converts to the Service.CircularReference", () => {
  const r = new CircularReference()
  const a = r.toService()
  const e = new Service.CircularReference()
  eq(a, e)
})

test("UnknownType: initializes an empty instance", () => {
  const t = new UnknownType()
  const k = Object.keys(t)
  eq(k, [])
})

test("UnknownType: merges with an error if the second type is a UnknownType", () => {
  const a = new UnknownType()
  const b = new UnknownType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The UnknownType cannot be merged")
  }
})

test("UnknownType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new UnknownType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("UnknownType: converts to the Service.UnknownType", () => {
  const t = new UnknownType()
  const a = t.toService()
  const e = new Service.UnknownType()
  eq(a, e)
})

test("UnionType: initializes an empty instance", () => {
  const t = new UnionType()
  const k = Object.keys(t)
  eq(k, ["types"])
  eq(t.types, [])
})

test("UnionType: initializes from an OpenApi.SchemaObject with an error if the type property is missing", () => {
  const [a, ...es] = UnionType.fromOpenApi({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The type of the SchemaObject is missing")

  const e = new UnionType()
  e.types = [new UnknownType()]

  eq(a, e)
})

test("UnionType: initializes from an OpenApi.SchemaObject with an error if the type property is not an array", () => {
  const [a, ...es] = UnionType.fromOpenApi({type: "string"})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The type of the SchemaObject is not an array")

  const e = new UnionType()
  e.types = [new UnknownType()]

  eq(a, e)
})

test("UnionType: initializes from an OpenApi.SchemaObject with an array of types", () => {
  const [a, ...es] = UnionType.fromOpenApi({type: ["string", "number"]})
  is(es.length, 0)

  const e = new UnionType()
  e.types = [new StringType(), new NumberType()]

  eq(a, e)
})

test("UnionType: merges with an error if the second type is a UnionType", () => {
  const a = new UnionType()
  const b = new UnionType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The UnionType cannot be merged")
  }
})

test("UnionType: converts to the Service.UnionType", () => {
  const t = new UnionType()
  t.types = [s(), n()]

  const a = t.toService()

  const e = new Service.UnionType()
  e.types = [s().toService(), n().toService()]

  eq(a, e)

  function s(): StringType {
    return new StringType()
  }

  function n(): NumberType {
    return new NumberType()
  }
})

test("StringType: initializes an empty instance", () => {
  const t = new StringType()
  const k = Object.keys(t)
  eq(k, [])
})

test("StringType: merges with an error if the second type is a StringType", () => {
  const a = new StringType()
  const b = new StringType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The StringType cannot be merged")
  }
})

test("StringType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new StringType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("StringType: converts to the Service.StringType", () => {
  const t = new StringType()
  const a = t.toService()
  const e = new Service.StringType()
  eq(a, e)
})

test("ObjectType: initializes an empty instance", () => {
  const t = new ObjectType()
  const k = Object.keys(t)
  eq(k, ["properties"])
  eq(t.properties, [])
})

test("ObjectType: initializes from an OpenApi.SchemaObject with an error if the properties property is missing", () => {
  const [a, ...es] = ObjectType.fromOpenApi({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The properties of the NonArraySchemaObject is missing")

  const e = new ObjectType()
  eq(a, e)
})

test("ObjectType: initializes from an OpenApi.SchemaObject with properties", () => {
  const [a, ...es] = ObjectType.fromOpenApi({
    properties: {
      s: {type: "string"},
      n: {type: "number"},
    },
  })
  is(es.length, 0)

  const e = new ObjectType()
  e.properties = [s(), n()]

  eq(a, e)

  function s(): Property {
    const p = new Property()
    p.identifier = "s"
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function n(): Property {
    const p = new Property()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }
})

test("ObjectType: initializes from an OpenApi.SchemaObject with required properties", () => {
  const [a, ...es] = ObjectType.fromOpenApi({
    properties: {
      s: {type: "string"},
      n: {type: "number"},
    },
    required: ["s"],
  })
  is(es.length, 0)

  const e = new ObjectType()
  e.properties = [s(), n()]

  eq(a, e)

  function s(): Property {
    const p = new Property()
    p.identifier = "s"
    p.required = true
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function n(): Property {
    const p = new Property()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }
})

test("ObjectType: merges with an error if the second type is a a different type", () => {
  const a = new ObjectType()
  const b = new StringType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The ObjectType cannot be merged with a different type")
  }
})

test("ObjectType: converts to the Service.ObjectType", () => {
  const t = new ObjectType()
  t.properties = [s(), n()]

  const a = t.toService()

  const e = new Service.ObjectType()
  e.properties = [s().toService(), n().toService()]

  eq(a, e)

  function s(): Property {
    const p = new Property()
    p.identifier = "s"
    p.required = true
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function n(): Property {
    const p = new Property()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }
})

test("NumberType: initializes an empty instance", () => {
  const t = new NumberType()
  const k = Object.keys(t)
  eq(k, [])
})

test("NumberType: merges with an error if the second type is a NumberType", () => {
  const a = new NumberType()
  const b = new NumberType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The NumberType cannot be merged")
  }
})

test("NumberType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new NumberType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("NumberType: converts to the Service.NumberType", () => {
  const t = new NumberType()
  const a = t.toService()
  const e = new Service.NumberType()
  eq(a, e)
})

test("NullType: initializes an empty instance", () => {
  const t = new NullType()
  const k = Object.keys(t)
  eq(k, [])
})

test("NullType: merges with an error if the second type is a NullType", () => {
  const a = new NullType()
  const b = new NullType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The NullType cannot be merged")
  }
})

test("NullType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new NullType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("NullType: converts to the Service.NullType", () => {
  const t = new NullType()
  const a = t.toService()
  const e = new Service.NullType()
  eq(a, e)
})

test("NoopType: initializes an empty instance", () => {
  const t = new NoopType()
  const k = Object.keys(t)
  eq(k, [])
})

test("NoopType: merges with an error if the second type is a NoopType", () => {
  const a = new NoopType()
  const b = new NoopType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The NoopType cannot be merged")
  }
})

test("NoopType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new NoopType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("NoopType: converts to the Service.NoopType", () => {
  const t = new NoopType()
  const a = t.toService()
  const e = new Service.NoopType()
  eq(a, e)
})

test("LiteralType: initializes an empty instance", () => {
  const t = new LiteralType()
  const k = Object.keys(t)
  eq(k, ["base", "const"])
  eq(t.base, new NoopType())
  eq(t.const, new NoopConst())
})

test("LiteralType: merges with an error if the second type is a LiteralType", () => {
  const a = new LiteralType()
  const b = new LiteralType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The LiteralType cannot be merged")
  }
})

test("LiteralType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new LiteralType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("LiteralType: converts to the Service.LiteralType", () => {
  const t = new LiteralType()
  t.base = new StringType()
  t.const = new PassthroughConst()
  t.const.value = "s"

  const a = t.toService()

  const e = new Service.LiteralType()
  e.base = new Service.StringType()
  e.const = new Service.PassthroughConst()
  e.const.value = "s"

  eq(a, e)
})

test("IntegerType: initializes an empty instance", () => {
  const t = new IntegerType()
  const k = Object.keys(t)
  eq(k, [])
})

test("IntegerType: merges with an error if the second type is a IntegerType", () => {
  const a = new IntegerType()
  const b = new IntegerType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The IntegerType cannot be merged")
  }
})

test("IntegerType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new IntegerType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("IntegerType: converts to the Service.IntegerType", () => {
  const t = new IntegerType()
  const a = t.toService()
  const e = new Service.IntegerType()
  eq(a, e)
})

test("EnumType: initializes an empty instance", () => {
  const t = new EnumType()
  const k = Object.keys(t)
  eq(k, ["cases"])
  eq(t.cases, [])
})

test("EnumType: initializes from an OpenApi.SchemaObject with an error if the enum property is missing", () => {
  const [a, ...es] = EnumType.fromOpenApi({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The enum of the SchemaObject is missing")

  const e = new EnumType()
  eq(a, e)
})

test("EnumType: initializes from an OpenApi.SchemaObject with enum and type properties", () => {
  const [a, ...es] = EnumType.fromOpenApi({enum: ["s", "s"], type: "string"})
  is(es.length, 0)

  const e = new EnumType()
  e.cases = [s(), s()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new LiteralType()
    y.type.base = new StringType()
    y.type.const = new PassthroughConst()
    y.type.const.value = "s"
    return y
  }
})

test("EnumType: merges with an error if the second type is a a different type", () => {
  const a = new EnumType()
  const b = new StringType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The EnumType cannot be merged with a different type")
  }
})

test("EnumType: converts to the Service.EnumType", () => {
  const t = new EnumType()
  t.cases = [s(), s()]

  const a = t.toService()

  const e = new Service.EnumType()
  e.cases = [s().toService(), s().toService()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new LiteralType()
    y.type.base = new StringType()
    y.type.const = new PassthroughConst()
    y.type.const.value = "s"
    return y
  }
})

test("ComplexType: initializes an empty instance", () => {
  const t = new ComplexType()
  const k = Object.keys(t)
  eq(k, ["by", "entities"])
  is(t.by, "")
  eq(t.entities, [])
})

test("ComplexType: initializes from an OpenApi.SchemaObject with the allOf property", () => {
  const [a, ...es] = ComplexType.fromOpenApi({
    allOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "allOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("ComplexType: initializes from an OpenApi.SchemaObject with the anyOf property", () => {
  const [a, ...es] = ComplexType.fromOpenApi({
    anyOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "anyOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("ComplexType: initializes from an OpenApi.SchemaObject with the oneOf property", () => {
  const [a, ...es] = ComplexType.fromOpenApi({
    oneOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "oneOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("ComplexType: initializes from an OpenApi.SchemaObject with an error if the allOf, anyOf, or oneOf property is missing", () => {
  const [a, ...es] = ComplexType.fromOpenApi({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The allOf, anyOf, or oneOf of the SchemaObject is missing")

  const e = new ComplexType()
  eq(a, e)
})

test("ComplexType: merges with an error if the second type is a ComplexType", () => {
  const a = new ComplexType()
  const b = new ComplexType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The ComplexType cannot be merged")
  }
})

test("ComplexType: converts to the Service.ComplexType", () => {
  const t = new ComplexType()
  t.by = "allOf"
  t.entities = [s(), n()]

  const a = t.toService()

  const e = new Service.ComplexType()
  e.by = "allOf"
  e.entities = [s().toService(), n().toService()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("BooleanType: initializes an empty instance", () => {
  const t = new BooleanType()
  const k = Object.keys(t)
  eq(k, [])
})

test("BooleanType: merges with an error if the second type is a BooleanType", () => {
  const a = new BooleanType()
  const b = new BooleanType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The BooleanType cannot be merged")
  }
})

test("BooleanType: resolves a reference", () => {
  const c = new ComponentsCache()
  const s = new State()
  const a = new BooleanType()
  const e = a.resolve(c, s)
  is(a !== e, true)
})

test("BooleanType: converts to the Service.BooleanType", () => {
  const t = new BooleanType()
  const a = t.toService()
  const e = new Service.BooleanType()
  eq(a, e)
})

test("ArrayType: initializes an empty instance", () => {
  const t = new ArrayType()
  const k = Object.keys(t)
  eq(k, ["items"])
  eq(t.items, new Entity())
})

test("ArrayType: initializes from an OpenApi.ArraySchemaObject", () => {
  const [a, ...es] = ArrayType.fromOpenApi({
    type: "array",
    items: {type: "string"},
  })
  is(es.length, 0)

  const e = new ArrayType()
  e.items = new Entity()
  e.items.type = new StringType()

  eq(a, e)
})

test("ArrayType: initializes from an OpenApi.ArraySchemaObject with an error if the items property is missing", () => {
  const [a, ...es] = ArrayType.fromOpenApi(
    // @ts-expect-error
    {type: "array"},
  )
  is(es.length, 1)

  const [er] = es
  is(er.message, "The items of the ArraySchemaObject is missing")

  const e = new ArrayType()
  e.items = new Entity()
  e.items.type = new UnknownType()

  eq(a, e)
})

test("ArrayType: resolves with a circular reference", () => {
  const c = new ComponentsCache()

  const s = new State()
  s.push("r")

  const t = new ArrayType()
  const r = new DirectReference()
  r.id = "r"
  t.items = r

  const a = t.resolve(c, s)

  const e = new ArrayType()
  e.items = new CircularReference()

  eq(a, e)
})

test("ArrayType: resolves with an error if the reference does not point to an EntityComponent", () => {
  const c = new ComponentsCache()
  const y = new NoopComponent()
  y.id = "y"
  c.add(y)

  const s = new State()

  const t = new ArrayType()
  const r = new DirectReference()
  r.id = y.id
  t.items = r

  try {
    t.resolve(c, s)
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The DirectReference does not point to an EntityComponent")
  }
})

test("ArrayType: resolves a reference", () => {
  const c = new ComponentsCache()
  const y = new EntityComponent()
  y.id = "y"
  y.self = new Entity()
  y.self.type = new StringType()
  c.add(y)

  const s = new State()

  const t = new ArrayType()
  const r = new DirectReference()
  r.id = y.id
  t.items = r

  const a = t.resolve(c, s)

  const e = new ArrayType()
  e.items = new Entity()
  e.items.type = new StringType()

  eq(s, new State())
  eq(a, e)
})

test("ArrayType: resolves nested references", () => {
  const c = new ComponentsCache()

  const y0 = new EntityComponent()
  y0.id = "y0"
  y0.self = new Entity()
  y0.self.type = new StringType()
  c.add(y0)

  const y1 = new EntityComponent()
  y1.id = "y1"
  y1.self = new Entity()
  y1.self.type = new ArrayType()
  const r1 = new DirectReference()
  r1.id = y0.id
  y1.self.type.items = r1
  c.add(y1)

  const s = new State()

  const t = new ArrayType()
  const r = new DirectReference()
  r.id = y1.id
  t.items = r

  const a = t.resolve(c, s)

  const e = new ArrayType()
  e.items = new Entity()
  e.items.type = new ArrayType()
  e.items.type.items = new Entity()
  e.items.type.items.type = new StringType()

  eq(s, new State())
  eq(a, e)
})

test("ArrayType: merges with an error if the second type is a ArrayType", () => {
  const a = new ArrayType()
  const b = new ArrayType()

  try {
    a.merge(b)
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The ArrayType cannot be merged")
  }
})

test("ArrayType: converts to the Service.ArrayType with an error if the items is a reference", () => {
  const t = new ArrayType()
  t.items = new DirectReference()

  try {
    t.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The DirectReference cannot be converted")
  }
})

test("ArrayType: converts to the Service.ArrayType", () => {
  const t = new ArrayType()
  t.items = new Entity()
  t.items.type = new StringType()

  const a = t.toService()

  const e = new Service.ArrayType()
  e.items = t.items.toService()

  eq(a, e)
})

test("type: creates a ComplexType with the allOf property", () => {
  const [a, ...es] = type({
    allOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "allOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("type: creates a ComplexType with the anyOf property", () => {
  const [a, ...es] = type({
    anyOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "anyOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("type: creates a ComplexType with the oneOf property", () => {
  const [a, ...es] = type({
    oneOf: [
      {type: "string"},
      {type: "number"},
    ],
  })
  is(es.length, 0)

  const e = new ComplexType()
  e.by = "oneOf"
  e.entities = [s(), n()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new StringType()
    return y
  }

  function n(): Entity {
    const y = new Entity()
    y.type = new NumberType()
    return y
  }
})

test("type: creates an EnumType", () => {
  const [a, ...es] = type({enum: ["s", "s"], type: "string"})
  is(es.length, 0)

  const e = new EnumType()
  e.cases = [s(), s()]

  eq(a, e)

  function s(): Entity {
    const y = new Entity()
    y.type = new LiteralType()
    y.type.base = new StringType()
    y.type.const = new PassthroughConst()
    y.type.const.value = "s"
    return y
  }
})

test("type: returns an error if the type property is missing", () => {
  const [a, ...es] = type({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The type of the SchemaObject is missing")

  const e = new UnknownType()
  eq(a, e)
})

test("type: creates an UnionType", () => {
  const [a, ...es] = type({type: ["string", "number"]})
  is(es.length, 0)

  const e = new UnionType()
  e.types = [new StringType(), new NumberType()]

  eq(a, e)
})

test("type: creates an ArrayType", () => {
  const [a, ...es] = type({type: "array", items: {type: "string"}})
  is(es.length, 0)

  const e = new ArrayType()
  e.items = new Entity()
  e.items.type = new StringType()

  eq(a, e)
})

test("type: creates a BooleanType", () => {
  const [a, ...es] = type({type: "boolean"})
  is(es.length, 0)

  const e = new BooleanType()
  eq(a, e)
})

test("type: creates an IntegerType", () => {
  const [a, ...es] = type({type: "integer"})
  is(es.length, 0)

  const e = new IntegerType()
  eq(a, e)
})

test("type: creates a NullType", () => {
  const [a, ...es] = type({type: "null"})
  is(es.length, 0)

  const e = new NullType()
  eq(a, e)
})

test("type: creates a NumberType", () => {
  const [a, ...es] = type({type: "number"})
  is(es.length, 0)

  const e = new NumberType()
  eq(a, e)
})

test("type: creates a ObjectType", () => {
  const [a, ...es] = type({
    type: "object",
    properties: {
      s: {type: "string"},
      n: {type: "number"},
    },
  })
  is(es.length, 0)

  const e = new ObjectType()
  e.properties = [s(), n()]

  eq(a, e)

  function s(): Property {
    const p = new Property()
    p.identifier = "s"
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function n(): Property {
    const p = new Property()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }
})

test("type: creates a StringType", () => {
  const [a, ...es] = type({type: "string"})
  is(es.length, 0)

  const e = new StringType()
  eq(a, e)
})

test("type: returns an error if type is not supported", () => {
  // @ts-expect-error
  const [a, ...es] = type({type: "unsupported"})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The type 'unsupported' is not supported")

  const e = new UnknownType()
  eq(a, e)
})

test("ApiKeyAuthorization: initializes an empty instance", () => {
  const a = new ApiKeyAuthorization()
  const k = Object.keys(a)
  eq(k, ["identifier", "description", "in", "scopes"])
  is(a.identifier, "")
  is(a.description, "")
  is(a.in, "")
  eq(a.scopes, [])
})

test("ApiKeyAuthorization: initializes from an OpenApi.ApiKeySecurityScheme", () => {
  const [a, ...es] = ApiKeyAuthorization.fromOpenApi({
    type: "apiKey",
    name: "n",
    in: "cookie",
    description: "d",
  })
  is(es.length, 0)

  const e = new ApiKeyAuthorization()
  e.identifier = "n"
  e.in = "cookie"
  e.description = "d"

  eq(a, e)
})

test("ApiKeyAuthorization: initializes from an OpenApi.ApiKeySecurityScheme with an error if the name property is missing", () => {
  const [a, ...es] = ApiKeyAuthorization.fromOpenApi(
    // @ts-expect-error
    {type: "apiKey", in: "cookie"},
  )
  is(es.length, 1)

  const [er] = es
  is(er.message, "The name of the ApiKeySecurityScheme is missing")

  const e = new ApiKeyAuthorization()
  e.in = "cookie"

  eq(a, e)
})

test("ApiKeyAuthorization: initializes from an OpenApi.ApiKeySecurityScheme with an error if the in property is not supported", () => {
  const [a, ...es] = ApiKeyAuthorization.fromOpenApi({
    type: "apiKey",
    name: "n",
    in: "u",
  })
  is(es.length, 1)

  const [er] = es
  is(er.message, "The in 'u' is not supported")

  const e = new ApiKeyAuthorization()
  e.identifier = "n"

  eq(a, e)
})

test("ApiKeyAuthorization: converts to the Service.ApiKeyAuthorization", () => {
  const u = new ApiKeyAuthorization()
  u.identifier = "n"
  u.in = "cookie"
  u.description = "d"
  u.scopes = ["r", "w"]

  const a = u.toService()

  const e = new Service.ApiKeyAuthorization()
  e.identifier = "n"
  e.in = "cookie"
  e.description = "d"
  e.scopes = ["r", "w"]

  eq(a, e)
})

test("NoopAuthorization: initializes an empty instance", () => {
  const a = new NoopAuthorization()
  const k = Object.keys(a)
  eq(k, ["identifier", "description"])
  is(a.identifier, "")
  is(a.description, "")
})

test("authorization: creates an ApiKeyAuthorization", () => {
  const [a, ...es] = authorization({
    type: "apiKey",
    name: "n",
    in: "cookie",
  })
  is(es.length, 0)

  const e = new ApiKeyAuthorization()
  e.identifier = "n"
  e.in = "cookie"

  eq(a, e)
})

test("authorization: returns an error if the type property is not supported", () => {
  const [a, ...es] = authorization(
    // @ts-expect-error
    {type: "u"},
  )
  is(es.length, 1)

  const [er] = es
  is(er.message, "The type 'u' is not supported")

  const e = new NoopAuthorization()
  eq(a, e)
})

test("AuthorizationRequirement: initializes an empty instance", () => {
  const a = new AuthorizationRequirement()
  const k = Object.keys(a)
  eq(k, ["identifier", "scopes"])
  is(a.identifier, "")
  eq(a.scopes, [])
})

test("Entity: initializes an empty instance", () => {
  const y = new Entity()
  const k = Object.keys(y)
  eq(k, ["description", "deprecated", "type", "format", "default", "example"])
  is(y.description, "")
  is(y.deprecated, false)
  eq(y.type, new NoopType())
  is(y.format, "")
  eq(y.default, new NoopConst())
  is(y.example, "")
})

test("Entity: initializes from an OpenApi.SchemaObject", () => {
  const [a, ...es] = Entity.fromOpenApi({
    description: "d",
    deprecated: true,
    type: "string",
    format: "s",
    default: "s",
    example: "s",
  })
  is(es.length, 0)

  const e = new Entity()
  e.description = "d"
  e.deprecated = true
  e.type = new StringType()
  e.format = "s"
  e.default = new PassthroughConst()
  e.default.value = "s"
  e.example = "s"

  eq(a, e)
})

test("Entity: converts to the Service.Entity", () => {
  const y = new Entity()
  y.description = "d"
  y.deprecated = true
  y.type = new StringType()
  y.format = "s"
  y.default = new PassthroughConst()
  y.default.value = "s"
  y.example = "s"

  const a = y.toService()

  const e = new Service.Entity()
  e.description = "d"
  e.deprecated = true
  e.type = y.type.toService()
  e.format = "s"
  e.default = y.default.toService()
  e.example = "s"

  eq(a, e)
})

test("Property: initializes an empty instance", () => {
  const p = new Property()
  const k = Object.keys(p)
  eq(k, ["identifier", "required", "self"])
  is(p.identifier, "")
  is(p.required, false)
  eq(p.self, new Entity())
})

test("Property: initializes from an OpenApi.SchemaObject", () => {
  const [a, ...es] = Property.fromOpenApi({type: "string"})
  is(es.length, 0)

  const e = new Property()
  e.self = new Entity()
  e.self.type = new StringType()

  eq(a, e)
})

test("Property: initializes from an OpenApi.ReferenceObject", () => {
  const [a, ...es] = Property.fromOpenApi({$ref: "$"})
  is(es.length, 0)

  const e = new Property()
  e.self = dr("$")

  eq(a, e)
})

test("Property: converts to the Service.Property with an error if the self is a reference", () => {
  const p = new Property()
  p.self = new DirectReference()

  try {
    p.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The DirectReference cannot be converted")
  }
})

test("Property: converts to the Service.Property", () => {
  const p = new Property()
  p.identifier = "s"
  p.required = true
  p.self = new Entity()
  p.self.description = "d"
  p.self.type = new StringType()

  const a = p.toService()

  const e = new Service.Property()
  e.identifier = "s"
  e.required = true
  e.self = p.self.toService()

  eq(a, e)
})

test("Parameter: initializes an empty instance", () => {
  const p = new Parameter()
  const k = Object.keys(p)
  eq(k, ["identifier", "description", "required", "deprecated", "self"])
  is(p.identifier, "")
  is(p.description, "")
  is(p.required, false)
  is(p.deprecated, false)
  eq(p.self, new Entity())
})

test("Parameter: initializes from an OpenApi.ParameterObject with an error if the schema property is missing", () => {
  const [a, ...es] = Parameter.fromOpenApi({in: "", name: "n"})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The schema of the ParameterObject is missing")

  const e = new Parameter()
  e.identifier = "n"
  e.self = new Entity()
  e.self.type = new UnknownType()

  eq(a, e)
})

test("Parameter: initializes from an OpenApi.ParameterObject with a schema reference", () => {
  const [a, ...es] = Parameter.fromOpenApi({
    in: "",
    name: "n",
    schema: {$ref: "$"},
  })
  is(es.length, 0)

  const e = new Parameter()
  e.identifier = "n"
  e.self = dr("$")

  eq(a, e)
})

test("Parameter: initializes from an OpenApi.ParameterObject with a schema type", () => {
  const [a, ...es] = Parameter.fromOpenApi({
    in: "",
    name: "n",
    schema: {type: "string"},
  })
  is(es.length, 0)

  const e = new Parameter()
  e.identifier = "n"
  e.self = new Entity()
  e.self.type = new StringType()

  eq(a, e)
})

test("Parameter: initializes from an OpenApi.ParameterObject with additional properties", () => {
  const [a, ...es] = Parameter.fromOpenApi({
    in: "",
    name: "n",
    description: "d",
    required: true,
    deprecated: true,
    schema: {type: "string"},
  })
  is(es.length, 0)

  const e = new Parameter()
  e.identifier = "n"
  e.description = "d"
  e.required = true
  e.deprecated = true
  e.self = new Entity()
  e.self.type = new StringType()

  eq(a, e)
})

test("Parameter: converts to the Service.Parameter with an error if the self is a reference", () => {
  const p = new Parameter()
  p.self = new DirectReference()

  try {
    p.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The self is a DirectReference, which cannot be converted")
  }
})

test("Parameter: converts to the Service.Parameter", () => {
  const p = new Parameter()
  p.identifier = "n"
  p.description = "d"
  p.required = true
  p.deprecated = true
  p.self = new Entity()
  p.self.type = new StringType()

  const a = p.toService()

  const e = new Service.Property()
  e.identifier = "n"
  e.required = true
  e.self = p.self.toService()
  e.self.description = "d"
  e.self.deprecated = true

  eq(a, e)
})

test("Request: initializes an empty instance", () => {
  const r = new Request()
  const k = Object.keys(r)
  eq(k, [
    "method",
    "path",
    "description",
    "authorizations",
    "authorizationRequirements",
    "headerParameters",
    "cookieParameters",
    "pathParameters",
    "queryParameters",
    "bodyParameters",
    "unknownParameters",
  ])
  is(r.method, "")
  is(r.path, "")
  is(r.description, "")
  eq(r.authorizations, [])
  eq(r.authorizationRequirements, [])
  eq(r.headerParameters, new Entity())
  eq(r.cookieParameters, new Entity())
  eq(r.pathParameters, new Entity())
  eq(r.queryParameters, new Entity())
  eq(r.bodyParameters, new Entity())
  eq(r.unknownParameters, [])
})

test("Request: initializes from an OpenApi.OperationObject with the security property", () => {
  const [a, ...es] = Request.fromOpenApi({
    security: [
      {a: ["r"]},
      {b: ["w"]},
    ],
  })
  is(es.length, 0)

  const e = new Request()
  e.authorizationRequirements = [a0(), a1()]

  eq(a, e)

  function a0(): AuthorizationRequirement {
    const a = new AuthorizationRequirement()
    a.identifier = "a"
    a.scopes = ["r"]
    return a
  }

  function a1(): AuthorizationRequirement {
    const a = new AuthorizationRequirement()
    a.identifier = "b"
    a.scopes = ["w"]
    return a
  }
})

test("Request: initializes from an OpenApi.OperationObject with the parameters property of types", () => {
  const [a, ...es] = Request.fromOpenApi({
    parameters: [
      {in: "header", name: "a", schema: {type: "string"}},
      {in: "cookie", name: "b", schema: {type: "number"}},
      {in: "path", name: "c", schema: {type: "boolean"}},
      {in: "query", name: "d", schema: {type: "integer"}},
    ],
  })
  is(es.length, 0)

  const e = new Request()
  e.headerParameters = ps(p0())
  e.cookieParameters = ps(p1())
  e.pathParameters = ps(p2())
  e.queryParameters = ps(p3())

  eq(a, e)

  function p0(): Parameter {
    const p = new Parameter()
    p.identifier = "a"
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function p1(): Parameter {
    const p = new Parameter()
    p.identifier = "b"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }

  function p2(): Parameter {
    const p = new Parameter()
    p.identifier = "c"
    p.self = new Entity()
    p.self.type = new BooleanType()
    return p
  }

  function p3(): Parameter {
    const p = new Parameter()
    p.identifier = "d"
    p.self = new Entity()
    p.self.type = new IntegerType()
    return p
  }
})

test("Request: initializes from an OpenApi.OperationObject with the parameters property of references", () => {
  const [a, ...es] = Request.fromOpenApi({
    parameters: [
      {$ref: "a"},
      {$ref: "b"},
      {$ref: "c"},
      {$ref: "d"},
    ],
  })
  is(es.length, 0)

  const e = new Request()
  e.unknownParameters = [dr("a"), dr("b"), dr("c"), dr("d")]

  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with an error if the parameters in property is not supported", () => {
  const [a, ...es] = Request.fromOpenApi({
    parameters: [
      {in: "unsupported", name: "n", schema: {type: "string"}},
    ],
  })
  is(es.length, 1)

  const [er] = es
  is(er.message, "The parameter 'in' value 'unsupported' is not supported")

  const e = new Request()
  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with an error if the requestBody schema property is missing", () => {
  const [a, ...es] = Request.fromOpenApi({
    requestBody: {
      content: {
        "application/json": {},
      },
    },
  })
  is(es.length, 1)

  const [er] = es
  is(er.message, "The schema of the MediaTypeObject is missing")

  const e = new Request()
  e.headerParameters = a.headerParameters

  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with the requestBody property", () => {
  const [a, ...es] = Request.fromOpenApi({
    requestBody: {
      content: {
        "application/json": {schema: {type: "string"}},
      },
    },
  })
  is(es.length, 0)

  const e = new Request()
  e.headerParameters = a.headerParameters
  e.bodyParameters = new Entity()
  e.bodyParameters.type = new StringType()

  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with a first requestBody only", () => {
  const [a, ...es] = Request.fromOpenApi({
    requestBody: {
      content: {
        "application/json": {schema: {type: "string"}},
        "application/xml": {schema: {type: "number"}},
      },
    },
  })
  is(es.length, 0)

  const e = new Request()
  e.headerParameters = a.headerParameters
  e.bodyParameters = new Entity()
  e.bodyParameters.type = new StringType()

  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with a Content-Type header", () => {
  const [a, ...es] = Request.fromOpenApi({
    requestBody: {
      content: {
        "application/json": {schema: {type: "string"}},
        "application/xml": {schema: {type: "number"}},
      },
    },
  })
  is(es.length, 0)

  const e = new Request()
  e.headerParameters = ps(co(aj(), ax()))
  e.bodyParameters = a.bodyParameters

  eq(a, e)
})

test("Request: initializes from an OpenApi.OperationObject with additional properties", () => {
  const [a, ...es] = Request.fromOpenApi({
    description: "d",
  })
  is(es.length, 0)

  const e = new Request()
  e.description = "d"

  eq(a, e)
})

test("Request: normalizes the order of the headerParameters", () => {
  const r = new Request()
  r.headerParameters = ps(co(), ac())

  const a = r.normalize()

  const e = new Request()
  e.headerParameters = ps(ac(), co())

  eq(a, e)
})

test("Request: normalizes the order of Accept header cases", () => {
  const r = new Request()
  r.headerParameters = ps(ac(ax(), aj()))

  const a = r.normalize()

  const e = new Request()
  e.headerParameters = ps(ac(aj(), ax()))

  eq(a, e)
})

test("Request: normalizes the order of Content-Type header cases", () => {
  const r = new Request()
  r.headerParameters = ps(co(ax(), aj()))

  const a = r.normalize()

  const e = new Request()
  e.headerParameters = ps(co(aj(), ax()))

  eq(a, e)
})

test("Request: converts to the Service.Request with an error if the unknownParameters contains a reference", () => {
  const r = new Request()
  r.unknownParameters = [new DirectReference()]

  try {
    r.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The unknownParameters contains a Reference, which cannot be converted")
  }
})

test("Request: converts to the Service.Request with an error if the bodyParameters is a reference", () => {
  const r = new Request()
  r.bodyParameters = new DirectReference()

  try {
    r.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The bodyParameters is a DirectReference, which cannot be converted")
  }
})

test("Request: converts to the Service.Request", () => {
  const r = new Request()
  r.method = "m"
  r.path = "p"
  r.description = "d"
  r.authorizations = [au()]
  r.headerParameters = ps(ac(aj()))
  r.cookieParameters = ps(ac(aj()))
  r.pathParameters = ps(ac(aj()))
  r.queryParameters = ps(ac(aj()))
  r.bodyParameters = ps(ac(aj()))

  const a = r.toService()

  const e = new Service.Request()
  e.method = "m"
  e.path = "p"
  e.description = "d"
  e.authorizations = [au().toService()]
  e.headerParameters = ps(ac(aj())).toService()
  e.cookieParameters = ps(ac(aj())).toService()
  e.pathParameters = ps(ac(aj())).toService()
  e.queryParameters = ps(ac(aj())).toService()
  e.bodyParameters = ps(ac(aj())).toService()

  eq(a, e)

  function au(): ApiKeyAuthorization {
    const a = new ApiKeyAuthorization()
    a.identifier = "a"
    a.description = "d"
    a.in = "cookie"
    a.scopes = ["r", "w"]
    return a
  }
})

test("Response: initializes an empty instance", () => {
  const r = new Response()
  const k = Object.keys(r)
  eq(k, ["request", "description", "body"])
  eq(r.request, new Request())
  is(r.description, "")
  eq(r.body, new Entity())
})

test("Response: initializes from an OpenApi.ResponseObject with an error if the content property does not have a schema", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "",
    content: {
      "application/json": {},
    },
  })
  is(es.length, 1)

  const [er] = es
  is(er.message, "The schema of the MediaTypeObject is missing")

  const e = new Response()
  e.request = a.request
  e.body = a.body

  eq(a, e)
})

test("Response: initializes from an OpenApi.ResponseObject with an Accept header", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "",
    content: {
      "application/json": {},
    },
  })
  is(es.length, 1)

  const [er] = es
  is(er.message, "The schema of the MediaTypeObject is missing")

  const e = new Response()
  e.request.headerParameters = ps(ac(aj()))
  e.body = a.body

  eq(a, e)
})

test("Response: initializes from an OpenApi.ResponseObject with a content reference", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "",
    content: {
      "application/json": {schema: {$ref: "$"}},
    },
  })
  is(es.length, 0)

  const e = new Response()
  e.request = a.request
  e.body = dr("$")

  eq(a, e)
})

test("Response: initializes from an OpenApi.ResponseObject with a content type", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "",
    content: {
      "application/json": {schema: {type: "string"}},
    },
  })
  is(es.length, 0)

  const e = new Response()
  e.request = a.request
  e.body = new Entity()
  e.body.type = new StringType()

  eq(a, e)
})

test("Response: initializes from an OpenApi.ResponseObject with a first content only", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "",
    content: {
      "application/json": {schema: {type: "string"}},
      "application/xml": {schema: {type: "number"}},
    },
  })
  is(es.length, 0)

  const e = new Response()
  e.request = a.request
  e.body = new Entity()
  e.body.type = new StringType()

  eq(a, e)
})

test("Response: initializes from an OpenApi.ResponseObject with additional properties", () => {
  const [a, ...es] = Response.fromOpenApi({
    description: "d",
    content: {
      "application/json": {schema: {type: "string"}},
    },
  })
  is(es.length, 0)

  const e = new Response()
  e.request = a.request
  e.description = "d"
  e.body = a.body

  eq(a, e)
})

test("Response: converts to the Service.Response with an error if the body is a reference", () => {
  const r = new Response()
  r.body = new DirectReference()

  try {
    r.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The body is a DirectReference, which cannot be converted")
  }
})

test("Response: converts to the Service.Response", () => {
  const r = new Response()
  r.description = "d"
  r.body = new Entity()
  r.body.type = new StringType()

  const a = r.toService()

  const e = new Service.Response()
  e.description = "d"
  e.body = r.body.toService()

  eq(a, e)
})

test("ResponseRecord: initializes an empty instance", () => {
  const r = new ResponseRecord()
  const k = Object.keys(r)
  eq(k, ["status", "self"])
  is(r.status, -1)
  eq(r.self, new Response())
})

test("ResponseRecord: initializes from an OpenApi.ResponseObject", () => {
  const [a, ...es] = ResponseRecord.fromOpenApi({
    description: "d",
    content: {
      "application/json": {schema: {type: "string"}},
    },
  })
  is(es.length, 0)

  const e = new ResponseRecord()
  e.status = -1
  e.self = new Response()
  e.self.description = "d"
  e.self.request.headerParameters = ps(ac(aj()))
  e.self.body = new Entity()
  e.self.body.type = new StringType()

  eq(a, e)
})

test("ResponseRecord: initializes from an OpenApi.ReferenceObject", () => {
  const [a, ...es] = ResponseRecord.fromOpenApi({$ref: "$"})
  is(es.length, 0)

  const e = new ResponseRecord()
  e.status = -1
  e.self = dr("$")

  eq(a, e)
})

test("ResponseRecord: converts to the Service.Response with an error if the self is a reference", () => {
  const r = new ResponseRecord()
  r.self = new DirectReference()

  try {
    r.toService()
    un("Expected an error")
  } catch (e) {
    is(e instanceof TypeError && e.message, "The self is a DirectReference, which cannot be converted")
  }
})

test("ResponseRecord: converts to the Service.Response", () => {
  const r = new ResponseRecord()
  r.status = 200
  r.self = new Response()
  r.self.description = "d"
  r.self.body = new Entity()
  r.self.body.type = new StringType()

  const a = r.toService()

  const e = r.self.toService()
  e.status = 200

  eq(a, e)
})

test("AuthorizationComponent: initializes an empty instance", () => {
  const a = new AuthorizationComponent()
  const k = Object.keys(a)
  eq(k, ["id", "self"])
  is(a.id, "")
  eq(a.self, new NoopAuthorization())
})

test("AuthorizationComponent: initializes from an OpenApi.SecuritySchemeObject", () => {
  const [a, ...es] = AuthorizationComponent.fromOpenApi({
    type: "apiKey",
    name: "a",
    in: "cookie",
  })
  is(es.length, 0)

  const e = new AuthorizationComponent()
  e.id = a.id
  e.self = ak()

  eq(a, e)

  function ak(): ApiKeyAuthorization {
    const a = new ApiKeyAuthorization()
    a.identifier = "a"
    a.in = "cookie"
    return a
  }
})

test("AuthorizationComponent: initializes from an OpenApi.ReferenceObject", () => {
  const [a, ...es] = AuthorizationComponent.fromOpenApi({$ref: "$"})
  is(es.length, 0)

  const e = new AuthorizationComponent()
  e.id = a.id
  e.self = dr("$")

  eq(a, e)
})

test("EntityComponent: initializes an empty instance", () => {
  const a = new EntityComponent()
  const k = Object.keys(a)
  eq(k, ["id", "self"])
  is(a.id, "")
  eq(a.self, new Entity())
})

test("EntityComponent: initializes from an OpenApi.SchemaObject", () => {
  const [a, ...es] = EntityComponent.fromOpenApi({type: "string"})
  is(es.length, 0)

  const e = new EntityComponent()
  e.id = a.id
  e.self = new Entity()
  e.self.type = new StringType()

  eq(a, e)
})

test("NoopComponent: initializes an empty instance", () => {
  const a = new NoopComponent()
  const k = Object.keys(a)
  eq(k, ["id"])
  is(a.id, "")
})

test("ResponseComponent: initializes an empty instance", () => {
  const a = new ResponseComponent()
  const k = Object.keys(a)
  eq(k, ["id", "self"])
  is(a.id, "")
  eq(a.self, new Response())
})

test("ResponseComponent: initializes from an OpenApi.ResponseObject", () => {
  const [a, ...es] = ResponseComponent.fromOpenApi({description: "d"})
  is(es.length, 0)

  const e = new ResponseComponent()
  e.id = a.id
  e.self = new Response()
  e.self.description = "d"

  eq(a, e)
})

test("ResponseComponent: initializes from an OpenApi.ReferenceObject", () => {
  const [a, ...es] = ResponseComponent.fromOpenApi({$ref: "$"})
  is(es.length, 0)

  const e = new ResponseComponent()
  e.id = a.id
  e.self = dr("$")

  eq(a, e)
})

test("component: creates an AuthorizationComponent", () => {
  const [a, ...es] = component("securitySchemes", {
    type: "apiKey",
    name: "a",
    in: "cookie",
  })
  is(es.length, 0)

  const e = new AuthorizationComponent()
  e.id = a.id
  e.self = ak()

  eq(a, e)

  function ak(): ApiKeyAuthorization {
    const a = new ApiKeyAuthorization()
    a.identifier = "a"
    a.in = "cookie"
    return a
  }
})

test("component: creates an EntityComponent", () => {
  const [a, ...es] = component("schemas", {type: "string"})
  is(es.length, 0)

  const e = new EntityComponent()
  e.id = a.id
  e.self = new Entity()
  e.self.type = new StringType()

  eq(a, e)
})

test("component: creates an ResponseComponent", () => {
  const [a, ...es] = component("responses", {description: "d"})
  is(es.length, 0)

  const e = new ResponseComponent()
  e.id = a.id
  e.self = new Response()
  e.self.description = "d"

  eq(a, e)
})

test("component: returns an error if component is not supported", () => {
  const [a, ...es] = component(
    // @ts-expect-error
    "u",
    {},
  )
  is(es.length, 1)

  const [er] = es
  is(er.message, "The component 'u' is not supported")

  const e = new NoopComponent()
  eq(a, e)
})

test("OperationDeclaration: initializes an empty instance", () => {
  const r = new OperationDeclaration()
  const k = Object.keys(r)
  eq(k, [
    "id",
    "name",
    "parent",
    "deprecated",
    "request",
    "responses",
  ])
  is(isValidUUIDV4(r.id), true)
  is(r.name, "")
  is(r.parent, "")
  is(r.deprecated, false)
  eq(r.request, new Request())
  eq(r.responses, [])
})

test("OperationDeclaration: initializes from an OpenApi.OperationObject with an error if the summary property is missing", () => {
  const [a, ...es] = OperationDeclaration.fromOpenApi({})
  is(es.length, 1)

  const [er] = es
  is(er.message, "The summary of the OperationObject is missing")

  const e = new OperationDeclaration()
  e.id = a.id

  eq(a, e)
})

test("OperationDeclaration: initializes from an OpenApi.OperationObject with the responses property", () => {
  const [a, ...es] = OperationDeclaration.fromOpenApi({
    summary: "s",
    responses: {
      200: {
        description: "d",
        content: {
          "application/json": {schema: {type: "string"}},
        },
      },
      400: {
        description: "d",
        content: {
          "application/xml": {schema: {type: "string"}},
        },
      },
    },
  })
  is(es.length, 0)

  const e = new OperationDeclaration()
  e.id = a.id
  e.name = a.name
  e.request.headerParameters = a.request.headerParameters
  e.responses = [r(200), r(400)]

  eq(a, e)

  function r(status: number): ResponseRecord {
    const r = new ResponseRecord()
    r.status = status
    r.self = new Response()
    r.self.description = "d"
    r.self.body = new Entity()
    r.self.body.type = new StringType()
    return r
  }
})

test("OperationDeclaration: initializes from an OpenApi.OperationObject with headers from multiple sources", () => {
  const [a, ...es] = OperationDeclaration.fromOpenApi({
    summary: "s",
    parameters: [
      {in: "header", name: "s", schema: {type: "string"}},
      {in: "header", name: "n", schema: {type: "number"}},
    ],
    requestBody: {
      content: {
        "application/json": {schema: {type: "string"}},
        "application/xml": {schema: {type: "string"}},
      },
    },
    responses: {
      200: {
        description: "d",
        content: {
          "application/json": {schema: {type: "string"}},
        },
      },
      400: {
        description: "d",
        content: {
          "application/xml": {schema: {type: "string"}},
        },
      },
    },
  })
  is(es.length, 0)

  const e = new OperationDeclaration()
  e.id = a.id
  e.name = a.name
  e.request.headerParameters = ps(p0(), p1(), co(aj(), ax()), ac(aj(), ax()))
  e.request.bodyParameters = a.request.bodyParameters
  e.responses = a.responses

  eq(a, e)

  function p0(): Parameter {
    const p = new Parameter()
    p.identifier = "s"
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function p1(): Parameter {
    const p = new Parameter()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }
})

test("OperationDeclaration: initializes from an OpenApi.OperationObject with additional properties", () => {
  const [a, ...es] = OperationDeclaration.fromOpenApi({
    summary: "s",
    description: "d",
    deprecated: true,
  })
  is(es.length, 0)

  const e = new OperationDeclaration()
  e.id = a.id
  e.name = "s"
  e.deprecated = true
  e.request = a.request

  eq(a, e)
})

test("OperationDeclaration: initializes from a full featured OpenApi.OperationObject", () => {
  const [a, ...es] = OperationDeclaration.fromOpenApi({
    summary: "s",
    description: "d",
    deprecated: true,
    security: [
      {a: ["r"]},
      {b: ["w"]},
    ],
    parameters: [
      {
        $ref: "$",
      },
      {
        in: "header",
        name: "a",
        description: "d",
        required: true,
        deprecated: true,
        schema: {
          type: "array",
          items: {
            type: "string",
          },
        },
      },
      {
        in: "cookie",
        name: "b",
        description: "d",
        schema: {
          type: "object",
          properties: {
            s: {
              type: "string",
            },
            n: {
              type: "number",
            },
          },
          required: ["s"],
        },
      },
      {
        in: "path",
        name: "c",
        description: "d",
        schema: {
          type: "string",
        },
      },
    ],
    requestBody: {
      content: {
        "application/json": {
          schema: {
            type: "string",
          },
        },
        "application/xml": {
          schema: {
            $ref: "$",
          },
        },
      },
    },
    responses: {
      200: {
        description: "d",
        content: {
          "application/json": {
            schema: {
              type: "string",
            },
          },
          "application/xml": {
            schema: {
              $ref: "$",
            },
          },
        },
      },
      400: {
        $ref: "$",
      },
    },
  })
  is(es.length, 0)

  const e = new OperationDeclaration()
  e.id = a.id
  e.name = "s"
  e.deprecated = true
  e.request = new Request()
  e.request.description = "d"
  e.request.authorizationRequirements = [a0(), a1()]
  e.request.headerParameters = ps(p0(), co(aj(), ax()), ac(aj(), ax()))
  e.request.cookieParameters = ps(p1())
  e.request.pathParameters = ps(p2())
  e.request.bodyParameters = new Entity()
  e.request.bodyParameters.type = new StringType()
  e.request.unknownParameters = [dr("$")]
  e.responses = [r0(), r2()]

  eq(a, e)

  function a0(): AuthorizationRequirement {
    const a = new AuthorizationRequirement()
    a.identifier = "a"
    a.scopes = ["r"]
    return a
  }

  function a1(): AuthorizationRequirement {
    const a = new AuthorizationRequirement()
    a.identifier = "b"
    a.scopes = ["w"]
    return a
  }

  function p0(): Parameter {
    const p = new Parameter()
    p.identifier = "a"
    p.description = "d"
    p.required = true
    p.deprecated = true
    p.self = new Entity()
    p.self.type = new ArrayType()
    p.self.type.items = new Entity()
    p.self.type.items.type = new StringType()
    return p
  }

  function p1(): Parameter {
    const p = new Parameter()
    p.identifier = "b"
    p.description = "d"
    p.self = new Entity()
    p.self.type = new ObjectType()
    p.self.type.properties = [p3(), p4()]
    return p
  }

  function p3(): Property {
    const p = new Property()
    p.identifier = "s"
    p.required = true
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function p4(): Property {
    const p = new Property()
    p.identifier = "n"
    p.self = new Entity()
    p.self.type = new NumberType()
    return p
  }

  function p2(): Parameter {
    const p = new Parameter()
    p.identifier = "c"
    p.description = "d"
    p.self = new Entity()
    p.self.type = new StringType()
    return p
  }

  function r0(): ResponseRecord {
    const r = new ResponseRecord()
    r.status = 200
    r.self = new Response()
    r.self.description = "d"
    r.self.body = new Entity()
    r.self.body.type = new StringType()
    return r
  }

  function r2(): ResponseRecord {
    const r = new ResponseRecord()
    r.status = 400
    r.self = dr("$")
    return r
  }
})

test("OperationDeclaration: converts to the Service.OperationDeclaration", () => {
  const r = new OperationDeclaration()
  r.name = "s"
  r.parent = "p"
  r.deprecated = true
  r.request = new Request()
  r.responses = [re(200), re(400)]

  const a = r.toService()

  const e = new Service.OperationDeclaration()
  e.id = a.id
  e.name = "s"
  e.parent = "p"
  e.deprecated = true
  e.responses = [re(200).toService(), re(400).toService()]

  eq(a, e)

  function re(status: number): ResponseRecord {
    const r = new ResponseRecord()
    r.status = status
    r.self = new Response()
    r.self.description = "d"
    r.self.body = new Entity()
    r.self.body.type = new StringType()
    return r
  }
})

test("GroupDeclaration: initializes an empty instance", () => {
  const d = new GroupDeclaration()
  const k = Object.keys(d)
  eq(k, ["id", "name", "parent", "children"])
  is(isValidUUIDV4(d.id), true)
  is(d.name, "")
  is(d.parent, "")
  eq(d.children, [])
})

test("GroupDeclaration: converts to the Service.GroupDeclaration", () => {
  const d = new GroupDeclaration()
  d.name = "n"
  d.children = ["a", "b"]

  const a = d.toService()

  const e = new Service.GroupDeclaration()
  e.id = a.id
  e.name = "n"
  e.children = ["a", "b"]

  eq(a, e)
})

test("declaration: returns an error if the tags property is missing", () => {
  const [ds, ...es] = declaration({})
  is(es.length, 1)
  is(ds.length, 0)

  const [e] = es
  is(e.message, "The tags of the OperationObject is missing")
})

test("declaration: creates a GroupDeclaration", () => {
  const [ds, ...es] = declaration({tags: ["g"], summary: "s"})
  is(es.length, 0)
  is(ds.length, 2)

  const [a, d] = ds

  const e = new GroupDeclaration()
  e.id = a.id
  e.name = "g"
  e.children = [d.id]

  eq(a, e)
})

test("declaration: creates multiple GroupDeclarations", () => {
  const [ds, ...es] = declaration({tags: ["a", "b"], summary: "s"})
  is(es.length, 0)
  is(ds.length, 4)

  const [g0, g1, d0, d1] = ds

  const a = new GroupDeclaration()
  a.id = g0.id
  a.name = "a"
  a.children = [d0.id]

  const b = new GroupDeclaration()
  b.id = g1.id
  b.name = "b"
  b.children = [d1.id]

  eq(g0, a)
  eq(g1, b)
})

test("declaration: creates nested GroupDeclarations", () => {
  const [ds, ...es] = declaration({tags: ["a / b"], summary: "s"})
  is(es.length, 0)
  is(ds.length, 3)

  const [g0, g1, d] = ds

  const a = new GroupDeclaration()
  a.id = g0.id
  a.name = "a"

  const b = new GroupDeclaration()
  b.id = g1.id
  b.name = "b"
  b.parent = a.id
  b.children = [d.id]

  a.children = [b.id]

  eq(g0, a)
  eq(g1, b)
})

test("declaration: creates various GroupDeclarations", () => {
  const [ds, ...es] = declaration({tags: ["a", "b / c"], summary: "s"})
  is(es.length, 0)
  is(ds.length, 5)

  const [g0, g1, g2, d0, d1] = ds

  const a = new GroupDeclaration()
  a.id = g0.id
  a.name = "a"
  a.children = [d0.id]

  const b = new GroupDeclaration()
  b.id = g1.id
  b.name = "b"

  const c = new GroupDeclaration()
  c.id = g2.id
  c.name = "c"
  c.parent = b.id
  c.children = [d1.id]

  b.children = [c.id]

  eq(g0, a)
  eq(g1, b)
  eq(g2, c)
})

test("declaration: creates a OperationDeclaration", () => {
  const [ds, ...es] = declaration({
    tags: ["t"],
    summary: "s",
  })
  is(es.length, 0)
  is(ds.length, 2)

  const [g, a] = ds

  const e = new OperationDeclaration()
  e.id = a.id
  e.parent = g.id
  e.name = "s"

  eq(a, e)
})

test("ComponentsCache: initializes an empty instance", () => {
  const c = new ComponentsCache()
  const k = Object.keys(c)
  eq(k, ["indexes", "list"])
  eq(c.indexes, {})
  eq(c.list, [])
})

test("ComponentsCache: adds a component", () => {
  const c0 = new NoopComponent()
  c0.id = "a"

  const a = new ComponentsCache()
  a.add(c0)

  const e = new ComponentsCache()
  e.indexes = {a: 0}
  e.list = [c0]

  eq(a, e)
})

test("ComponentsCache: adds multiple components", () => {
  const c0 = new NoopComponent()
  c0.id = "a"

  const c1 = new NoopComponent()
  c1.id = "b"

  const a = new ComponentsCache()
  a.add(c0)
  a.add(c1)

  const e = new ComponentsCache()
  e.indexes = {a: 0, b: 1}
  e.list = [c0, c1]

  eq(a, e)
})

test("ComponentsCache: retrieves a component", () => {
  const c0 = new NoopComponent()
  c0.id = "a"

  const c = new ComponentsCache()
  c.add(c0)

  const a = c.retrieve("a")
  const e = c0

  eq(a, e)
})

test("ComponentsCache: retrieves a component with an error if the component does not exist", () => {
  const c = new ComponentsCache()

  try {
    c.retrieve("a")
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The component 'a' does not exist")
  }
})

test("ComponentsCache: retrieves a component with an error if the component is missing", () => {
  const c = new ComponentsCache()
  c.indexes.a = 0

  try {
    c.retrieve("a")
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The component 'a' is missing")
  }
})

test("DeclarationCache: initializes an empty instance", () => {
  const c = new DeclarationsCache()
  const k = Object.keys(c)
  eq(k, ["indexes", "list"])
  eq(c.indexes, {})
  eq(c.list, [])
})

test("DeclarationCache: adds a declaration", () => {
  const d0 = new Service.OperationDeclaration()
  d0.id = "a"

  const a = new DeclarationsCache()
  a.add(d0)

  const e = new DeclarationsCache()
  e.indexes = {a: 0}
  e.list = [d0]

  eq(a, e)
})

test("DeclarationCache: adds multiple declarations", () => {
  const d0 = new Service.OperationDeclaration()
  d0.id = "a"

  const d1 = new Service.OperationDeclaration()
  d1.id = "b"

  const a = new DeclarationsCache()
  a.add(d0)
  a.add(d1)

  const e = new DeclarationsCache()
  e.indexes = {a: 0, b: 1}
  e.list = [d0, d1]

  eq(a, e)
})

test("DeclarationsCache: does not add a group declaration if it already exists", () => {
  const d0 = new Service.GroupDeclaration()
  d0.id = "d0"
  d0.name = "d0+"
  d0.children = ["d1"]

  const d1 = new Service.OperationDeclaration()
  d1.id = "d1"
  d1.name = "d1+"
  d1.parent = "d0"

  const d2 = new Service.GroupDeclaration()
  d2.id = "d2"
  d2.name = "d0+"
  d2.children = ["d3"]

  const d3 = new Service.OperationDeclaration()
  d3.id = "d3"
  d3.name = "d3+"
  d3.parent = "d2"

  const a = new DeclarationsCache()
  a.add(d0)
  a.add(d1)
  a.add(d2)
  a.add(d3)

  const b0 = new Service.GroupDeclaration()
  b0.id = "d0"
  b0.name = "d0+"
  b0.children = ["d1", "d3"]

  const b1 = new Service.OperationDeclaration()
  b1.id = "d1"
  b1.name = "d1+"
  b1.parent = "d0"

  const b3 = new Service.OperationDeclaration()
  b3.id = "d3"
  b3.name = "d3+"
  b3.parent = "d0"

  const e = new DeclarationsCache()
  e.indexes = {d0: 0, d1: 1, d3: 2}
  e.list = [b0, b1, b3]

  eq(a, e)
})

test("DeclarationsCache: takes into account the order of nesting groups", () => {
  const d0 = new Service.GroupDeclaration()
  d0.id = "d0"
  d0.name = "d0+"
  d0.children = ["d1"]

  const d1 = new Service.GroupDeclaration()
  d1.id = "d1"
  d1.name = "d1+"
  d1.parent = "d0"
  d1.children = ["d2"]

  const d2 = new Service.OperationDeclaration()
  d2.id = "d2"
  d2.name = "d2+"
  d2.parent = "d1"

  const d3 = new Service.GroupDeclaration()
  d3.id = "d3"
  d3.name = "d3+"
  d3.children = ["d4"]

  const d4 = new Service.GroupDeclaration()
  d4.id = "d4"
  d4.name = "d1+"
  d4.parent = "d3"
  d4.children = ["d5"]

  const d5 = new Service.OperationDeclaration()
  d5.id = "d5"
  d5.name = "d5+"
  d5.parent = "d4"

  const a = new DeclarationsCache()
  a.add(d0)
  a.add(d1)
  a.add(d2)
  a.add(d3)
  a.add(d4)
  a.add(d5)

  const b0 = new Service.GroupDeclaration()
  b0.id = "d0"
  b0.name = "d0+"
  b0.children = ["d1"]

  const b1 = new Service.GroupDeclaration()
  b1.id = "d1"
  b1.name = "d1+"
  b1.parent = "d0"
  b1.children = ["d2"]

  const b2 = new Service.OperationDeclaration()
  b2.id = "d2"
  b2.name = "d2+"
  b2.parent = "d1"

  const b3 = new Service.GroupDeclaration()
  b3.id = "d3"
  b3.name = "d3+"
  b3.children = ["d4"]

  const b4 = new Service.GroupDeclaration()
  b4.id = "d4"
  b4.name = "d1+"
  b4.parent = "d3"
  b4.children = ["d5"]

  const b5 = new Service.OperationDeclaration()
  b5.id = "d5"
  b5.name = "d5+"
  b5.parent = "d4"

  const e = new DeclarationsCache()
  e.indexes = {d0: 0, d1: 1, d2: 2, d3: 3, d4: 4, d5: 5}
  e.list = [b0, b1, b2, b3, b4, b5]

  eq(a, e)
})

test.run()

function ps(...a: Property[]): Entity {
  const y = new Entity()
  y.type = new ObjectType()
  y.type.properties = a
  return y
}

function ac(...c: Entity[]): Parameter {
  const p = new Parameter()
  p.identifier = "Accept"
  p.self = new Entity()
  p.self.type = new EnumType()
  p.self.type.cases = c
  return p
}

function co(...c: Entity[]): Parameter {
  const p = new Parameter()
  p.identifier = "Content-Type"
  p.self = new Entity()
  p.self.type = new EnumType()
  p.self.type.cases = c
  return p
}

function aj(): Entity {
  const y = new Entity()
  y.type = new LiteralType()
  y.type.base = new StringType()
  y.type.const = new PassthroughConst()
  y.type.const.value = "application/json"
  return y
}

function ax(): Entity {
  const y = new Entity()
  y.type = new LiteralType()
  y.type.base = new StringType()
  y.type.const = new PassthroughConst()
  y.type.const.value = "application/xml"
  return y
}

function dr(id: string): DirectReference {
  const r = new DirectReference()
  r.id = id
  return r
}
