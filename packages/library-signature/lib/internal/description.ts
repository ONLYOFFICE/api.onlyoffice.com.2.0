import type * as Library from "@onlyoffice/library-declaration"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  Reference,
  type Signature,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export function declaration(d: Library.Declaration): Signature {
  switch (d.kind) {
  case "class":
    return classDeclaration(d)
  case "constructor":
    return constructorDeclaration(d)
  case "event":
    return eventDeclaration(d)
  case "method":
    return methodDeclaration(d)
  case "property":
    return propertyDeclaration(d)
  case "type":
    return typeDeclaration(d)
  default:
    return []
  }
}

export function classDeclaration(d: Library.ClassDeclaration): Signature {
  const a: Signature = []

  let t: Token

  t = new KeywordToken()
  t.text = "class"
  a.push(t)

  t = new TextToken()
  t.text = " "
  a.push(t)

  t = new EntityToken()
  t.text = d.identifier
  a.push(t)

  if (d.extends) {
    t = new TextToken()
    t.text = " "
    a.push(t)

    t = new KeywordToken()
    t.text = "extends"
    a.push(t)

    t = new TextToken()
    t.text = " "
    a.push(t)

    for (const e of d.extends) {
      const r = new Reference()
      r.id = e.id
      a.push(r)

      t = new TextToken()
      t.text = ", "
      a.push(t)
    }

    a.pop()
  }

  return a
}

export function constructorDeclaration(d: Library.ConstructorDeclaration): Signature {
  const a: Signature = []

  const t = new EntityToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  return a
}

export function eventDeclaration(d: Library.EventDeclaration): Signature {
  const a: Signature = []

  let t: Token

  t = new KeywordToken()
  t.text = "function"
  a.push(t)

  t = new TextToken()
  t.text = " "
  a.push(t)

  t = new EntityToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  return a
}

export function methodDeclaration(d: Library.MethodDeclaration): Signature {
  const a: Signature = []

  let t: Token

  t = new KeywordToken()
  t.text = "function"
  a.push(t)

  t = new TextToken()
  t.text = " "
  a.push(t)

  t = new EntityToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  const f = new Formatter()
  return f.format(a)
}

export function propertyDeclaration(d: Library.PropertyDeclaration): Signature {
  const a: Signature = []

  const b = value(d)
  a.push(...b)

  return a
}

export function typeDeclaration(d: Library.TypeDeclaration): Signature {
  const a: Signature = []

  let t: Token

  t = new KeywordToken()
  if ("id" in d.type) {
    t.text += d.type.id
  } else {
    t.text += d.type.type
  }
  a.push(t)

  t = new TextToken()
  t.text = " "
  a.push(t)

  t = new EntityToken()
  t.text = d.identifier
  a.push(t)

  const b = type(d.type)
  a.push(...b)

  return a
}

export function value(v: Library.Value): Signature {
  const a: Signature = []

  let u: Token

  u = new ParameterToken()
  u.text = v.identifier
  a.push(u)

  u = new TextToken()
  u.text = ": "
  a.push(u)

  const b = type(v.type)
  a.push(...b)

  if (v.default) {
    u = new TextToken()
    u.text = " = "
    a.push(u)

    u = new TextToken()
    u.text = String(v.default.value)
    a.push(u)
  }

  return a
}

export function type(t: Library.Type): Signature {
  if ("id" in t) {
    const u = new Reference()
    u.id = t.id
    return [u]
  }

  switch (t.type) {
  case "any":
    return anyType(t)
  case "array":
    return arrayType(t)
  case "function":
    return functionType(t)
  case "literal":
    return literalType(t)
  case "object":
    return objectType(t)
  case "passthrough":
    return passthroughType(t)
  case "union":
    return unionType(t)
  case "unknown":
    return unknownType(t)
  case "void":
    return voidType(t)
  default:
    return []
  }
}

export function anyType(t: Library.AnyType): Signature {
  return literalType({type: "literal", value: t.type})
}

export function arrayType(t: Library.ArrayType): Signature {
  const a: Signature = []

  let u: Token

  if (t.items) {
    for (const e of t.items) {
      const b = type(e)
      a.push(...b)

      const u = new TextToken()
      u.text = ", "
      a.push(u)
    }

    a.pop()

    if (t.items.length > 1 || "type" in t.items[0] && t.items[0].type === "union") {
      u = new TextToken()
      u.text = "("
      a.unshift(u)

      u = new TextToken()
      u.text = ")"
      a.push(u)
    }
  }

  u = new TextToken()
  u.text = "[]"
  a.push(u)

  return a
}

export function functionType(t: Library.FunctionType): Signature {
  const a: Signature = []

  let u: Token

  u = new TextToken()
  u.text = "("
  a.push(u)

  if (t.parameters) {
    for (const e of t.parameters) {
      const b = value(e)
      a.push(...b)

      const u = new TextToken()
      u.text = ", "
      a.push(u)
    }

    a.pop()
  }

  u = new TextToken()
  u.text = ")"
  a.push(u)

  if (t.returns) {
    u = new TextToken()
    u.text = ": "
    a.push(u)

    const b = type(t.returns.type)
    a.push(...b)
  }

  return a
}

export function literalType(t: Library.LiteralType): Signature {
  const a: Signature = []

  if (typeof t.value === "string") {
    const u = new TypeToken()
    u.text = String(t.value)
    a.push(u)
  } else {
    const u = new StringToken()
    u.text = `"${t.value}"`
    a.push(u)
  }

  return a
}

export function objectType(t: Library.ObjectType): Signature {
  return literalType({type: "literal", value: t.type})
}

export function passthroughType(t: Library.PassthroughType): Signature {
  return literalType({type: "literal", value: t.value})
}

export function unionType(t: Library.UnionType): Signature {
  const a: Signature = []

  let u: Token

  for (const e of t.types) {
    const b = type(e)
    a.push(...b)

    u = new TextToken()
    u.text = " | "
    a.push(u)
  }

  a.pop()

  return a
}

export function unknownType(t: Library.UnknownType): Signature {
  return literalType({type: "literal", value: t.type})
}

export function voidType(t: Library.VoidType): Signature {
  return literalType({type: "literal", value: t.type})
}

export class Formatter {
  indent = 2
  limit = 100
  newline = "\n"

  format(a: Signature): Signature {
    const f = [...a]

    let l = 0
    for (const e of f) {
      if (e.text) {
        l += e.text.length
      }
    }

    if (l < this.limit) {
      return f
    }

    let s = 0
    let e = 0
    let o = 0
    let im = false

    for (const [i, t] of f.entries()) {
      if (t.text === "(" && !im) {
        im = true
        s = i
      }

      if (im) {
        if (t.text === "(") {
          o += 1
        }

        if (t.text === ")") {
          o -= 1
        }

        if (o === 0) {
          e = i
          break
        }
      }
    }

    let b = new TextToken()
    b.text = this.newline

    let t = new TextToken()
    t.text = " ".repeat(this.indent)

    f.splice(s + 1, 0, b, t)
    e += 2

    for (let i = s; i <= e; i += 1) {
      if (f[i].text === ", ") {
        b = new TextToken()
        b.text = "\n"
        t = new TextToken()
        t.text = " ".repeat(this.indent)
        f.splice(i + 1, 0, b, t)
        e += 2
      }
    }

    const c = new TextToken()
    c.text = ", "
    b = new TextToken()
    b.text = "\n"
    f.splice(e, 0, c, b)

    return f
  }
}
