import {type JSONOutput as J} from "typedoc"

export function isArrayType(t: unknown): t is J.ArrayType {
  return isType(t) && t.type === "array"
}

export function isConditionalType(t: unknown): t is J.ConditionalType {
  return isType(t) && t.type === "conditional"
}

export function isIndexedAccessType(t: unknown): t is J.IndexedAccessType {
  return isType(t) && t.type === "indexedAccess"
}

export function isInferredType(t: unknown): t is J.InferredType {
  return isType(t) && t.type === "inferred"
}

export function isIntersectionType(t: unknown): t is J.IntersectionType {
  return isType(t) && t.type === "intersection"
}

export function isIntrinsicType(t: unknown): t is J.IntrinsicType {
  return isType(t) && t.type === "intrinsic"
}

export function isLiteralType(t: unknown): t is J.LiteralType {
  return isType(t) && t.type === "literal"
}

export function isMappedType(t: unknown): t is J.MappedType {
  return isType(t) && t.type === "mapped"
}

export function isOptionalType(t: unknown): t is J.OptionalType {
  return isType(t) && t.type === "optional"
}

export function isPredicateType(t: unknown): t is J.PredicateType {
  return isType(t) && t.type === "predicate"
}

export function isQueryType(t: unknown): t is J.QueryType {
  return isType(t) && t.type === "query"
}

export function isReferenceType(t: unknown): t is J.ReferenceType {
  return isType(t) && t.type === "reference"
}

export function isReflectionType(t: unknown): t is J.ReflectionType {
  return isType(t) && t.type === "reflection"
}

export function isRestType(t: unknown): t is J.RestType {
  return isType(t) && t.type === "rest"
}

export function isTemplateLiteralType(t: unknown): t is J.TemplateLiteralType {
  return isType(t) && t.type === "templateLiteral"
}

export function isTupleType(t: unknown): t is J.TupleType {
  return isType(t) && t.type === "tuple"
}

export function isNamedTupleMemberType(t: unknown): t is J.NamedTupleMemberType {
  return isType(t) && t.type === "namedTupleMember"
}

export function isTypeOperatorType(t: unknown): t is J.TypeOperatorType {
  return isType(t) && t.type === "typeOperator"
}

export function isUnionType(t: unknown): t is J.UnionType {
  return isType(t) && t.type === "union"
}

export function isUnknownType(t: unknown): t is J.UnknownType {
  return isType(t) && t.type === "unknown"
}

export function isType(t: unknown): t is J.SomeType {
  return isObject(t) && "type" in t && typeof t.type === "string"
}

function isObject(o: unknown): o is object {
  return typeof o === "object" && o !== null && !Array.isArray(o)
}
