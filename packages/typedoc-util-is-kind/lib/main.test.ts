import {ReflectionKind} from "typedoc"
import {test} from "uvu"
import {is} from "uvu/assert"
import {
  isAccessorKind,
  isCallSignatureKind,
  isClassKind,
  isConstructorKind,
  isConstructorSignatureKind,
  isDocumentKind,
  isEnumKind,
  isEnumMemberKind,
  isFunctionKind,
  isGetSignatureKind,
  isIndexSignatureKind,
  isInterfaceKind,
  isKind,
  isMethodKind,
  isModuleKind,
  isNamespaceKind,
  isParameterKind,
  isProjectKind,
  isPropertyKind,
  isReferenceKind,
  isSetSignatureKind,
  isTypeAliasKind,
  isTypeLiteralKind,
  isTypeParameterKind,
  isVariableKind,
} from "./main.ts"

interface Is {
  (u: unknown): boolean
}

const ps: [Is, unknown][] = [
  [isAccessorKind, ReflectionKind.Accessor.valueOf()],
  [isCallSignatureKind, ReflectionKind.CallSignature.valueOf()],
  [isClassKind, ReflectionKind.Class.valueOf()],
  [isConstructorKind, ReflectionKind.Constructor.valueOf()],
  [isConstructorSignatureKind, ReflectionKind.ConstructorSignature.valueOf()],
  [isDocumentKind, ReflectionKind.Document.valueOf()],
  [isEnumKind, ReflectionKind.Enum.valueOf()],
  [isEnumMemberKind, ReflectionKind.EnumMember.valueOf()],
  [isFunctionKind, ReflectionKind.Function.valueOf()],
  [isGetSignatureKind, ReflectionKind.GetSignature.valueOf()],
  [isIndexSignatureKind, ReflectionKind.IndexSignature.valueOf()],
  [isInterfaceKind, ReflectionKind.Interface.valueOf()],
  [isMethodKind, ReflectionKind.Method.valueOf()],
  [isModuleKind, ReflectionKind.Module.valueOf()],
  [isNamespaceKind, ReflectionKind.Namespace.valueOf()],
  [isParameterKind, ReflectionKind.Parameter.valueOf()],
  [isProjectKind, ReflectionKind.Project.valueOf()],
  [isPropertyKind, ReflectionKind.Property.valueOf()],
  [isReferenceKind, ReflectionKind.Reference.valueOf()],
  [isSetSignatureKind, ReflectionKind.SetSignature.valueOf()],
  [isTypeAliasKind, ReflectionKind.TypeAlias.valueOf()],
  [isTypeLiteralKind, ReflectionKind.TypeLiteral.valueOf()],
  [isTypeParameterKind, ReflectionKind.TypeParameter.valueOf()],
  [isVariableKind, ReflectionKind.Variable.valueOf()],
]

for (const [_, xt] of ps) {
  test(`isKind(): returns true for the '${JSON.stringify(xt)}'`, () => {
    const a = isKind(xt)
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
