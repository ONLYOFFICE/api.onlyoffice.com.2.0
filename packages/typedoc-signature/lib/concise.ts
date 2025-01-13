import {type Fragment} from "@onlyoffice/library-declaration/next.js"
import {
  ParameterToken,
  Reference,
  type Signature,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"
import {
  isCallSignatureReflection,
  isEnumMemberReflection,
  isParameterReflection,
  isPropertyReflection,
  isSignatureReflection,
  isVariableReflection,
} from "@onlyoffice/typedoc-util-is-reflection"
import {
  isArrayType,
  isIntersectionType,
  isIntrinsicType,
  isLiteralType,
  isReferenceType,
  isReflectionType,
  isTemplateLiteralType,
  isTupleType,
  isUnionType,
} from "@onlyoffice/typedoc-util-is-type"
import {type JSONOutput as J} from "typedoc"
import {type Context} from "./context.ts"

export function constructorDeclaration(r: J.Reflection): Signature {
  const s: Signature = []

  if (!isSignatureReflection(r)) {
    return s
  }

  const b = parameters(r)
  s.push(...b)

  return s
}

export function enumMemberReflection(ctx: Context, r: J.Reflection): Signature {
  const s: Signature = []

  if (!isEnumMemberReflection(r)) {
    return s
  }

  const t = new TextToken()
  t.text = ": "
  s.push(t)

  if (r.type) {
    const b = type(ctx, r.type)
    s.push(...b)
  }

  return s
}

export function functionsDeclaration(ctx: Context, f: J.Reflection): Signature {
  const s: Signature = []

  if (!isCallSignatureReflection(f)) {
    return s
  }

  let t: Token

  if (f.type) {
    const rp = genericParameters(f.type)
    if (rp.length !== 0) {
      t = new TextToken()
      t.text = "<"
      s.push(t)

      s.push(...rp)

      t = new TextToken()
      t.text = ">"
      s.push(t)
    }
  }

  const b = parameters(f)
  s.push(...b)

  if (f.type) {
    t = new TextToken()
    t.text = ": "
    s.push(t)

    const b = type(ctx, f.type)
    s.push(...b)
  }

  return s
}

export function methodDeclaration(ctx: Context, m: J.Reflection): Signature {
  const s: Signature = []

  if (!isSignatureReflection(m)) {
    return s
  }

  let t: Token

  if (m.type) {
    const rp = genericParameters(m.type)
    if (rp.length !== 0) {
      t = new TextToken()
      t.text = "<"
      s.push(t)

      s.push(...rp)

      t = new TextToken()
      t.text = ">"
      s.push(t)
    }
  }

  const b = parameters(m)
  s.push(...b)

  if (m.type) {
    t = new TextToken()
    t.text = ": "
    s.push(t)

    const b = type(ctx, m.type)
    s.push(...b)
  }

  return s
}

export function propertyReflection(ctx: Context, r: J.Reflection): Signature {
  const s: Signature = []

  if (!isPropertyReflection(r)) {
    return s
  }

  const t = new TextToken()
  t.text = ": "
  if (r.flags.isOptional) {
    t.text = `?${t.text}`
  }
  s.push(t)

  if (r.type) {
    const b = type(ctx, r.type)
    s.push(...b)
  }

  return s
}

export function variableDeclaration(ctx: Context, r: J.Reflection): Signature {
  const s: Signature = []

  if (!isVariableReflection(r)) {
    return s
  }

  const t = new TextToken()
  t.text = "  "
  s.push(t)

  if (r.type) {
    const b = type(ctx, r.type)
    s.push(...b)
  }

  return s
}

export function parameters(r: J.SignatureReflection): Signature {
  const s: Signature = []
  let t: Token

  t = new TextToken()
  t.text = "("
  s.push(t)

  if (r.parameters && r.parameters.length !== 0) {
    for (const f of r.parameters) {
      if (f.type) {
        const b = value(f)
        s.push(...b)

        t = new TextToken()
        t.text = ", "
        s.push(t)
      }
    }

    s.pop()
  }

  t = new TextToken()
  t.text = ")"
  s.push(t)

  return s
}

export function value(p: J.Reflection): Signature {
  const s: Signature = []

  const t = new TextToken()
  t.text = p.name
  s.push(t)

  return s
}

export function type(ctx: Context, t: J.SomeType): Signature {
  if (isArrayType(t)) {
    return arrayType(ctx, t)
  }
  if (isIntersectionType(t)) {
    console.error("IntersectionType not supported")
  }
  if (isIntrinsicType(t)) {
    return intrinsicType(t)
  }
  if (isLiteralType(t)) {
    return literalType(t)
  }
  if (isReferenceType(t)) {
    return referenceType(ctx, t)
  }
  if (isReflectionType(t)) {
    return reflectionType(ctx, t)
  }
  if (isTemplateLiteralType(t)) {
    return templateLiteralType(ctx, t)
  }
  if (isTupleType(t)) {
    return tupleType(ctx, t)
  }
  if (isUnionType(t)) {
    return unionType(ctx, t)
  }
  return []
}

export function arrayType(ctx: Context, a: J.ArrayType): Signature {
  const s: Signature = []
  let t: Token

  if (isUnionType(a.elementType)) {
    t = new TextToken()
    t.text = "("
    s.push(t)
  }

  const b = type(ctx, a.elementType)
  s.push(...b)

  if (isUnionType(a.elementType)) {
    const t = new TextToken()
    t.text = ")"
    s.push(t)
  }

  t = new TextToken()
  t.text = "[]"
  s.push(t)

  return s
}

export function intrinsicType(i: J.IntrinsicType): Signature {
  const s: Signature = []

  const t = new TypeToken()
  t.text = i.name
  s.push(t)

  return s
}

export function literalType(l: J.LiteralType): Signature {
  const s: Signature = []

  if (typeof l.value === "string") {
    const t = new StringToken()
    t.text = `"${l.value}"`
    s.push(t)
  } else {
    const t = new TypeToken()
    t.text = String(l.value)
    s.push(t)
  }

  return s
}

export function referenceType(ctx: Context, r: J.ReferenceType): Signature {
  const s: Signature = []
  let t: Token

  if (typeof r.target === "number") {
    s.push(reference(ctx, r.target, r.name))
  } else {
    t = new TypeToken()
    t.text = r.name
    s.push(t)
  }

  if (r.typeArguments) {
    t = new TextToken()
    t.text = "<"
    s.push(t)

    for (const a of r.typeArguments) {
      const b = type(ctx, a)
      s.push(...b)

      t = new TextToken()
      t.text = ", "
      s.push(t)
    }
    s.pop()

    t = new TextToken()
    t.text = ">"
    s.push(t)
  }

  return s
}

export function reflectionType(ctx: Context, r: J.ReflectionType): Signature {
  const s: Signature = []
  let t: Token

  if (r.declaration.signatures) {
    for (const c of r.declaration.signatures) {
      const b = parameters(c)
      s.push(...b)

      if (c.type) {
        t = new TextToken()
        t.text = " => "
        s.push(t)

        const b = type(ctx, c.type)
        s.push(...b)
      }
    }
  } else if (r.declaration.children) {
    t = new TextToken()
    t.text = "{"
    s.push(t)

    for (const c of r.declaration.children) {
      if (c.type) {
        t = new ParameterToken()
        t.text = c.name
        s.push(t)

        t = new TextToken()
        if (c.flags.isOptional) {
          t.text += "?"
        }
        t.text += ": "
        s.push(t)

        const b = type(ctx, c.type)
        s.push(...b)

        t = new TextToken()
        t.text = "; "
        s.push(t)
      }
    }
    s.pop()

    t = new TextToken()
    t.text = "}"
    s.push(t)
  } else if (r.declaration.indexSignatures) {
    t = new TextToken()
    t.text = "{"
    s.push(t)

    for (const is of r.declaration.indexSignatures) {
      t = new TextToken()
      t.text = "["
      s.push(t)

      if (is.parameters && is.parameters.length !== 0) {
        for (const f of is.parameters) {
          if (f.type) {
            t = new ParameterToken()
            t.text = f.name
            s.push(t)

            t = new TextToken()
            t.text = ", "
            s.push(t)
          }
        }
        s.pop()
      }

      t = new TextToken()
      t.text = "]"
      s.push(t)

      if (is.type) {
        t = new TextToken()
        t.text = ": "
        s.push(t)

        const b = type(ctx, is.type)
        s.push(...b)
      }
    }

    t = new TextToken()
    t.text = "}"
    s.push(t)
  }

  return s
}

export function templateLiteralType(ctx: Context, tt: J.TemplateLiteralType): Signature {
  const s: Signature = []
  let t: Token

  t = new StringToken()
  t.text = "`"
  s.push(t)

  if (tt.head) {
    t = new StringToken()
    t.text = tt.head
    s.push(t)
  }

  for (const tl of tt.tail) {
    for (const e of tl) {
      if (typeof e !== "string") {
        t = new TextToken()
        t.text = "${"
        s.push(t)

        const b = type(ctx, e)
        s.push(...b)

        t = new TextToken()
        t.text = "}"
        s.push(t)
      } else {
        t = new StringToken()
        t.text = String(e)
        s.push(t)
      }
    }
  }
  t = new StringToken()
  t.text = "`"
  s.push(t)

  return s
}

export function tupleType(ctx: Context, tt: J.TupleType): Signature {
  const s: Signature = []
  let t: Token

  if (!tt.elements) {
    return s
  }

  t = new TextToken()
  t.text = "["
  s.push(t)

  for (const e of tt.elements) {
    const b = type(ctx, e)
    s.push(...b)

    t = new TextToken()
    t.text = ", "
    s.push(t)
  }
  s.pop()

  t = new TextToken()
  t.text = "]"
  s.push(t)

  return s
}

export function unionType(ctx: Context, u: J.UnionType): Signature {
  const s: Signature = []
  let t: Token

  if (!u.types) {
    return s
  }

  for (const ts of u.types) {
    if (isReflectionType(ts.type)) {
      t = new TextToken()
      t.text = "("
      s.push(t)
    }

    const b = type(ctx, ts)
    s.push(...b)

    if (isReflectionType(ts.type)) {
      t = new TextToken()
      t.text = ")"
      s.push(t)
    }

    t = new TextToken()
    t.text = " | "
    s.push(t)
  }
  s.pop()

  return s
}

export function fragments(ctx: Context, f: Fragment[]): void {
  for (const e of f) {
    const ft = ctx.t.trailOf(e)
    if (ft) {
      const t = ctx.t.reflectionOf(ft)
      if (!t) {
        console.error(`Reflection for fragment ${e.name} not found`)
        continue
      }
      if (!isParameterReflection(t)) {
        return
      }
      if (t.type) {
        const b = type(ctx, t.type)
        e.signature.concise.push(...b)
      }
    } else {
      console.error(`Trail for fragment ${e.name} not found`)
    }
  }
}

export function returns(ctx: Context, r?: J.SomeType): Signature {
  const s: Signature = []

  if (r && r.type) {
    const b = type(ctx, r)
    s.push(...b)
  } else {
    const t = new TypeToken()
    t.text = "unknown"
    s.push(t)
  }

  return s
}

function reference(ctx: Context, t: number, n: string): Token | Reference {
  let r: Token | Reference
  const id = ctx.t.idOf(t)

  if (id) {
    r = new Reference()
    r.id = String(id)
    r.token = new TypeToken()
    r.token.text = n
  } else {
    console.error(`Reflection id not found for ${n} typedoc reference id = ${t}`)
    r = new TypeToken()
    r.text = n
  }

  return r
}

function genericParameters(st: J.SomeType): Signature {
  const s: Signature = []
  let t: Token

  if (isReferenceType(st) && st.refersToTypeParameter) {
    t = new TypeToken()
    t.text = st.name
    s.push(t)
  }
  if (isUnionType(st) && st.types) {
    for (const tp of st.types) {
      if (isReferenceType(st) || isUnionType(st)) {
        const p = genericParameters(tp)
        if (p.length !== 0) {
          s.push(...p)

          t = new TextToken()
          t.text = ", "
          s.push(t)
        }
      }
    }
    s.pop()
  }
  if (isArrayType(st) && isReferenceType(st.elementType) && st.elementType.refersToTypeParameter) {
    t = new TypeToken()
    t.text = st.elementType.name
    s.push(t)

    t = new TextToken()
    t.text = "[]"
    s.push(t)
  }

  return s
}
