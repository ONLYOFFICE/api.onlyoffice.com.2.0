// todo: add double quotes for string literals.
// todo: fix the array type.
// todo: add new lines for the long types.

import type * as Tokenizer from "@onlyoffice/declaration-tokenizer"
import * as tokenizer from "@onlyoffice/declaration-tokenizer"
import type * as Library from "./main.ts"

export function declaration(d: Library.Declaration): Tokenizer.Token[] {
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

export function classDeclaration(d: Library.ClassDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = keywordToken()
  t.text = "class"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  if (d.extends) {
    t = textToken()
    t.text = " "
    a.push(t)

    t = keywordToken()
    t.text = "extends"
    a.push(t)

    t = textToken()
    t.text = " "
    a.push(t)

    for (const e of d.extends) {
      t = referenceToken()
      t.id = e.id
      a.push(t)

      t = textToken()
      t.text = ", "
      a.push(t)
    }

    a.pop()
  }

  return a
}

export function constructorDeclaration(d: Library.ConstructorDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = decoratorToken()
  t.text = "constructor"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  return a
}

export function eventDeclaration(d: Library.EventDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = decoratorToken()
  t.text = "(event)"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = referenceToken()
  t.id = d.parent?.id || ""
  a.push(t)

  t = textToken()
  t.text = "."
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  return a
}

export function methodDeclaration(d: Library.MethodDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = decoratorToken()
  t.text = "(method)"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = referenceToken()
  t.id = d.parent?.id || ""
  a.push(t)

  t = textToken()
  t.text = "."
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  const b = functionType(d.type)
  a.push(...b)

  return a
}

export function propertyDeclaration(d: Library.PropertyDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = decoratorToken()
  t.text = "(property)"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = referenceToken()
  t.id = d.parent?.id || ""
  a.push(t)

  t = textToken()
  t.text = "."
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  const b = value(d)
  b.shift()
  a.push(...b)

  return a
}

export function typeDeclaration(d: Library.TypeDeclaration): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let t: Tokenizer.Token

  t = decoratorToken()
  t.text += "("
  if ("id" in d.type) {
    t.text += d.type.id
  } else {
    t.text += d.type.type
  }
  t.text += ")"
  a.push(t)

  t = textToken()
  t.text = " "
  a.push(t)

  t = identifierToken()
  t.text = d.identifier
  a.push(t)

  t = textToken()
  t.text = ": "
  a.push(t)

  const b = type(d.type)
  a.push(...b)

  return a
}

export function value(v: Library.Value): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let u: Tokenizer.Token

  u = textToken()
  u.text = v.identifier
  a.push(u)

  u = textToken()
  u.text = ": "
  a.push(u)

  const b = type(v.type)
  if ("type" in v.type && v.type.type === "function" && v.type.returns) {
    u = textToken()
    u.text = "("
    b.unshift(u)

    u = textToken()
    u.text = ")"
    b.push(u)
  }
  a.push(...b)

  if (v.default) {
    u = textToken()
    u.text = " = "
    a.push(u)

    u = textToken()
    u.text = String(v.default.value)
    a.push(u)
  }

  return a
}

export function type(t: Library.Type): Tokenizer.Token[] {
  if ("id" in t) {
    const u = referenceToken()
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

export function anyType(t: Library.AnyType): Tokenizer.Token[] {
  return literalType({type: "literal", value: t.type})
}

export function arrayType(t: Library.ArrayType): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let u: Tokenizer.Token

  if (t.items) {
    let l = false
    for (const e of t.items) {
      const b = type(e)
      a.push(...b)

      if (b.length > 1) {
        l = true
      }

      const u = textToken()
      u.text = ", "
      a.push(u)
    }

    a.pop()

    if (t.items.length > 1 || l) {
      u = textToken()
      u.text = "("
      a.unshift(u)

      u = textToken()
      u.text = ")"
      a.push(u)
    }
  }

  u = textToken()
  u.text = "[]"
  a.push(u)

  return a
}

export function functionType(t: Library.FunctionType): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let u: Tokenizer.Token

  u = textToken()
  u.text = "("
  a.push(u)

  if (t.parameters) {
    for (const e of t.parameters) {
      const b = value(e)
      a.push(...b)

      const u = textToken()
      u.text = ", "
      a.push(u)
    }

    a.pop()
  }

  u = textToken()
  u.text = ")"
  a.push(u)

  if (t.returns) {
    u = textToken()
    u.text = ": "
    a.push(u)

    const b = type(t.returns.type)
    if ("type" in t.returns.type && t.returns.type.type === "function" && t.returns.type.returns) {
      u = textToken()
      u.text = "("
      b.unshift(u)

      u = textToken()
      u.text = ")"
      b.push(u)
    }
    a.push(...b)
  }

  return a
}

export function literalType(t: Library.LiteralType): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  const u = textToken()
  u.text = String(t.value)
  a.push(u)

  return a
}

export function objectType(t: Library.ObjectType): Tokenizer.Token[] {
  return literalType({type: "literal", value: t.type})
}

export function passthroughType(t: Library.PassthroughType): Tokenizer.Token[] {
  return literalType({type: "literal", value: t.value})
}

export function unionType(t: Library.UnionType): Tokenizer.Token[] {
  const a: Tokenizer.Token[] = []

  let u: Tokenizer.Token

  for (const [i, e] of t.types.entries()) {
    const b = type(e)
    if ("type" in e && e.type === "function" && e.returns && i+1 !== t.types.length) {
      u = textToken()
      u.text = ")"
      b.push(u)

      u = textToken()
      u.text = "("
      b.unshift(u)
    }
    a.push(...b)

    u = textToken()
    u.text = " | "
    a.push(u)
  }

  a.pop()

  return a
}

export function unknownType(t: Library.UnknownType): Tokenizer.Token[] {
  return literalType({type: "literal", value: t.type})
}

export function voidType(t: Library.VoidType): Tokenizer.Token[] {
  return literalType({type: "literal", value: t.type})
}

function decoratorToken(): Tokenizer.DecoratorToken {
  const t = tokenizer.tokenNode()
  return tokenizer.decoratorToken(t)
}

function identifierToken(): Tokenizer.IdentifierToken {
  const t = tokenizer.tokenNode()
  return tokenizer.identifierToken(t)
}

function keywordToken(): Tokenizer.KeywordToken {
  const t = tokenizer.tokenNode()
  return tokenizer.keywordToken(t)
}

function textToken(): Tokenizer.TextToken {
  const t = tokenizer.tokenNode()
  return tokenizer.textToken(t)
}

function referenceToken(): Tokenizer.ReferenceToken {
  const t = tokenizer.tokenNode()
  return tokenizer.referenceToken(t)
}
