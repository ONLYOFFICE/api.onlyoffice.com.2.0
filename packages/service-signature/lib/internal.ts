import {
  ArrayType,
  BooleanType,
  CircularReference,
  ComplexType,
  type Entity,
  EnumType,
  IntegerType,
  LiteralType,
  NoopType,
  NullType,
  NumberType,
  ObjectType,
  type Request,
  StringType,
  type Type,
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

export function request(r: Request): Signature {
  const s: Signature = []
  let t: Token

  if (r.method) {
    t = new KeywordToken()
    t.text = r.method
    s.push(t)
  }

  if (r.method && r.path) {
    t = new TextToken()
    t.text = " "
    s.push(t)
  }

  if (r.path) {
    t = new StringToken()
    t.text = r.path
    s.push(t)
  }

  return s
}

export function entity(e: Entity): Signature {
  return type(e.type)
}

export function type(u: Type): Signature {
  switch (true) {
  case u instanceof ArrayType:
    return arrayType(u)
  case u instanceof BooleanType:
    return booleanType(u)
  case u instanceof ComplexType:
    return complexType(u)
  case u instanceof EnumType:
    return enumType(u)
  case u instanceof IntegerType:
    return integerType(u)
  case u instanceof LiteralType:
    return literalType(u)
  case u instanceof NoopType:
    return noopType(u)
  case u instanceof NullType:
    return nullType(u)
  case u instanceof NumberType:
    return numberType(u)
  case u instanceof ObjectType:
    return objectType(u)
  case u instanceof StringType:
    return stringType(u)
  case u instanceof UnionType:
    return unionType(u)
  case u instanceof UnknownType:
    return unknownType(u)
  }
  return []
}

export function arrayType(u: ArrayType): Signature {
  const s: Signature = []

  let t: Token

  t = new TypeToken()
  t.text = u.type
  s.push(t)

  if (u.items instanceof CircularReference) {
    t = new TypeToken()
    t.text = " of "
    s.push(t)

    t = new TypeToken()
    t.text = "circular references"
    s.push(t)
  } else {
    // todo: humanize the type
    //   do not "array of string", do "array of strings"
    //   do not "array of number", do "array of numbers"
    //   etc

    const e = entity(u.items)
    if (e.length !== 0) {
      t = new TypeToken()
      t.text = " of "
      s.push(t)

      // eslint-disable-next-line unicorn/no-array-push-push
      s.push(...e)
    }
  }

  return s
}

export function booleanType(u: BooleanType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function complexType(u: ComplexType): Signature {
  const s: Signature = []
  let t: Token

  if (u.by === "allOf") {
    t = new TypeToken()
    t.text = "all of"
    s.push(t)
  } else if (u.by === "anyOf") {
    t = new TypeToken()
    t.text = "any of"
    s.push(t)
  } else if (u.by === "oneOf") {
    t = new TypeToken()
    t.text = "one of"
    s.push(t)
  }

  return s
}

export function enumType(u: EnumType): Signature {
  const s: Signature = []
  let t: Token

  t = new TypeToken()
  t.text = u.type
  s.push(t)

  if (u.cases.length !== 0) {
    const [c] = u.cases

    if (c.type instanceof LiteralType) {
      t = new TypeToken()
      t.text = " of "
      s.push(t)

      const b = type(c.type.base)
      s.push(...b)
    }
  }

  return s
}

export function integerType(u: IntegerType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function literalType(_: LiteralType): Signature {
  // todo
  return []

  // if (u.base instanceof NoopType || u.const instanceof NoopConst) {
  //   return []
  // }

  // let s: Signature = []
  // let t: Token

  // if (u.base instanceof ArrayType) {
  //   // todo
  // } else if (u.base instanceof BooleanType) {
  //   t = new TextToken()
  //   t.text = String(u.const.value)
  //   s.push(t)
  // } else if (u.base instanceof ComplexType) {
  //   // todo
  // } else if (u.base instanceof EnumType) {
  //   // todo
  // } else if (u.base instanceof IntegerType) {
  //   t = new TextToken()
  //   t.text = String(u.const.value)
  //   s.push(t)
  // } else if (u.base instanceof LiteralType) {
  //   s = literalType(u.base)
  // } else if (u.base instanceof NullType) {
  //   t = new TextToken()
  //   t.text = String(u.const.value)
  //   s.push(t)
  // } else if (u.base instanceof NumberType) {
  //   t = new TextToken()
  //   t.text = String(u.const.value)
  //   s.push(t)
  // } else if (u.base instanceof ObjectType) {
  //   // todo
  // } else if (u.base instanceof StringType) {
  //   t = new StringToken()
  //   t.text = `"${u.const.value}"`
  //   s.push(t)
  // } else if (u.base instanceof UnionType) {
  //   // todo
  // } else if (u.base instanceof UnknownType) {
  //   // todo
  // }

  // return s
}

export function noopType(_: NoopType): Signature {
  return []
}

export function nullType(u: NullType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function numberType(u: NumberType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function objectType(u: ObjectType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function stringType(u: StringType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}

export function unionType(_: UnionType): Signature {
  // todo
  return []
}

export function unknownType(u: UnknownType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = u.type
  s.push(t)

  return s
}
