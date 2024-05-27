import type * as Raw from "./raw.ts"
import type * as Well from "./well.ts"
import * as well from "./well.ts"

export function config(r: Raw.Config): Well.Config {
  let de: Well.DocumentEditor
  if (!r.documentEditor) {
    de = well.documentEditor()
  } else {
    de = documentEditor(r.documentEditor)
  }
  return well.config(de)
}

export function documentEditor(r: Raw.DocumentEditor): Well.DocumentEditor {
  const de = well.documentEditor()
  if (r.config) {
    for (const rp of r.config) {
      const p = property(rp)
      de.config.push(p)
    }
  }
  return de
}

export function property(r: Raw.Property): Well.Property {
  const t = propertyType(r)
  const p = well.property(t)
  p.path = r.path
  p.href = r.href
  if (r.format) {
    p.format = r.format
  }
  if (r.default !== undefined) {
    p.default = r.default
  }
  return p
}

function propertyType(r: Raw.Property): Well.Type {
  if (r.cases) {
    const n = well.typeNode()
    const cs: Well.Type[] = []
    for (const c of r.cases) {
      const n = well.typeNode()
      const b = type(r)
      const t = well.literalType(n, b, c)
      cs.push(t)
    }
    return well.enumType(n, cs)
  }
  return type(r)

  function type(r: Raw.Property): Well.Type {
    const n = well.typeNode()
    switch (r.type) {
    case "boolean":
      return well.booleanType(n)
    case "function":
      return well.functionType(n)
    case "number":
      return well.numberType(n)
    case "string":
      return well.stringType(n)
    default:
      throw new Error(`Unknown type: ${r.type}`)
    }
  }
}
