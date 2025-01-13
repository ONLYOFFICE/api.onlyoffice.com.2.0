import {test} from "uvu"
import {is} from "uvu/assert"
import {
  isArrayType,
  isConditionalType,
  isIndexedAccessType,
  isInferredType,
  isIntersectionType,
  isIntrinsicType,
  isLiteralType,
  isMappedType,
  isNamedTupleMemberType,
  isOptionalType,
  isPredicateType,
  isQueryType,
  isReferenceType,
  isReflectionType,
  isRestType,
  isTemplateLiteralType,
  isTupleType,
  isType,
  isTypeOperatorType,
  isUnionType,
  isUnknownType,
} from "./main.ts"

interface Is {
  (u: unknown): boolean
}

const ps: [Is, unknown][] = [
  [isArrayType, {type: "array"}],
  [isConditionalType, {type: "conditional"}],
  [isIndexedAccessType, {type: "indexedAccess"}],
  [isInferredType, {type: "inferred"}],
  [isIntersectionType, {type: "intersection"}],
  [isIntrinsicType, {type: "intrinsic"}],
  [isLiteralType, {type: "literal"}],
  [isMappedType, {type: "mapped"}],
  [isNamedTupleMemberType, {type: "namedTupleMember"}],
  [isOptionalType, {type: "optional"}],
  [isPredicateType, {type: "predicate"}],
  [isQueryType, {type: "query"}],
  [isReferenceType, {type: "reference"}],
  [isReflectionType, {type: "reflection"}],
  [isRestType, {type: "rest"}],
  [isTemplateLiteralType, {type: "templateLiteral"}],
  [isTupleType, {type: "tuple"}],
  [isTypeOperatorType, {type: "typeOperator"}],
  [isUnionType, {type: "union"}],
  [isUnknownType, {type: "unknown"}],
]

for (const [_, xt] of ps) {
  test(`isType(): returns true for the '${JSON.stringify(xt)}'`, () => {
    const a = isType(xt)
    is(a, true)
  })
}

for (const [xi, xt] of ps) {
  test(`${xi.name}(): returns true for the '${JSON.stringify(xt)}'`, () => {
    const a = xi(xt)
    is(a, true)
  })

  for (const [yi, yt] of ps) {
    if (xi === yi) {
      continue
    }

    test(`${xi.name}(): returns false for the '${JSON.stringify(yt)}'`, () => {
      const a = xi(yt)
      is(a, false)
    })
  }
}

test.run()
