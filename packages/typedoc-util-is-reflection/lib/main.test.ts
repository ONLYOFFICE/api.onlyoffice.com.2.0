import {ReflectionKind} from "typedoc"
import {test} from "uvu"
import {is} from "uvu/assert"
import {
  isAccessorReflection,
  isCallSignatureReflection,
  isClassReflection,
  isConstructorReflection,
  isConstructorSignatureReflection,
  isContainerReflection,
  isDeclarationReflection,
  isDocumentReflection,
  isEnumMemberReflection,
  isEnumReflection,
  isFunctionReflection,
  isGetSignatureReflection,
  isIndexSignatureReflection,
  isInterfaceReflection,
  isMethodReflection,
  isModuleReflection,
  isNamespaceReflection,
  isParameterReflection,
  isProjectReflection,
  isPropertyReflection,
  isReferenceReflection,
  isReflection,
  isSetSignatureReflection,
  isSignatureReflection,
  isTypeAliasReflection,
  isTypeLiteralReflection,
  isTypeParameterReflection,
  isVariableReflection,
} from "./main.ts"

const accessorReflection = {kind: ReflectionKind.Accessor.valueOf(), variant: "declaration"}
const callSignatureReflection = {kind: ReflectionKind.CallSignature.valueOf(), variant: "signature"}
const classReflection = {kind: ReflectionKind.Class.valueOf(), variant: "declaration"}
const constructorReflection = {kind: ReflectionKind.Constructor.valueOf(), variant: "declaration"}
const constructorSignatureReflection = {kind: ReflectionKind.ConstructorSignature.valueOf(), variant: "signature"}
const containerReflection = {kind: -1, children: []}
const declarationReflection = {kind: -1, variant: "declaration"}
const documentReflection = {kind: -1, variant: "document"}
const enumMemberReflection = {kind: ReflectionKind.EnumMember.valueOf(), variant: "declaration"}
const enumReflection = {kind: ReflectionKind.Enum.valueOf(), variant: "declaration"}
const functionReflection = {kind: ReflectionKind.Function.valueOf(), variant: "declaration"}
const getSignatureReflection = {kind: ReflectionKind.GetSignature.valueOf(), variant: "signature"}
const indexSignatureReflection = {kind: ReflectionKind.IndexSignature.valueOf(), variant: "declaration"}
const interfaceReflection = {kind: ReflectionKind.Interface.valueOf(), variant: "declaration"}
const methodReflection = {kind: ReflectionKind.Method.valueOf(), variant: "declaration"}
const moduleReflection = {kind: ReflectionKind.Module.valueOf(), variant: "declaration"}
const namespaceReflection = {kind: ReflectionKind.Namespace.valueOf(), variant: "declaration"}
const parameterReflection = {kind: -1, variant: "param"}
const projectReflection = {kind: -1, variant: "project"}
const propertyReflection = {kind: ReflectionKind.Property.valueOf(), variant: "declaration"}
const referenceReflection = {kind: -1, variant: "reference"}
const setSignatureReflection = {kind: ReflectionKind.SetSignature.valueOf(), variant: "signature"}
const signatureReflection = {kind: -1, variant: "signature"}
const typeAliasReflection = {kind: ReflectionKind.TypeAlias.valueOf(), variant: "declaration"}
const typeLiteralReflection = {kind: ReflectionKind.TypeLiteral.valueOf(), variant: "declaration"}
const typeParameterReflection = {kind: -1, variant: "typeParam"}
const variableReflection = {kind: ReflectionKind.Variable.valueOf(), variant: "declaration"}

const declarations: unknown[] = [
  accessorReflection,
  classReflection,
  constructorReflection,
  enumMemberReflection,
  enumReflection,
  functionReflection,
  indexSignatureReflection,
  interfaceReflection,
  methodReflection,
  moduleReflection,
  namespaceReflection,
  propertyReflection,
  typeAliasReflection,
  typeLiteralReflection,
  variableReflection,
]

const signatures: unknown[] = [
  callSignatureReflection,
  constructorSignatureReflection,
  getSignatureReflection,
  setSignatureReflection,
]

const other: unknown[] = [
  containerReflection,
  documentReflection,
  parameterReflection,
  projectReflection,
  referenceReflection,
  typeParameterReflection,
]

interface Is {
  (u: unknown): boolean
}

each(isReflection, yes, [
  declarationReflection,
  setSignatureReflection,
  ...declarations,
  ...signatures,
  ...other,
])

cross([
  [isDeclarationReflection, declarationReflection],
  [isSignatureReflection, signatureReflection],
])

each(isDeclarationReflection, yes, declarations)
each(isDeclarationReflection, no, [...signatures, ...other])

each(isSignatureReflection, yes, signatures)
each(isSignatureReflection, no, [...declarations, ...other])

cross([
  [isAccessorReflection, accessorReflection],
  [isCallSignatureReflection, callSignatureReflection],
  [isClassReflection, classReflection],
  [isConstructorReflection, constructorReflection],
  [isConstructorSignatureReflection, constructorSignatureReflection],
  [isContainerReflection, containerReflection],
  [isDocumentReflection, documentReflection],
  [isEnumMemberReflection, enumMemberReflection],
  [isEnumReflection, enumReflection],
  [isFunctionReflection, functionReflection],
  [isGetSignatureReflection, getSignatureReflection],
  [isIndexSignatureReflection, indexSignatureReflection],
  [isInterfaceReflection, interfaceReflection],
  [isMethodReflection, methodReflection],
  [isModuleReflection, moduleReflection],
  [isNamespaceReflection, namespaceReflection],
  [isParameterReflection, parameterReflection],
  [isProjectReflection, projectReflection],
  [isPropertyReflection, propertyReflection],
  [isReferenceReflection, referenceReflection],
  [isSetSignatureReflection, setSignatureReflection],
  [isTypeAliasReflection, typeAliasReflection],
  [isTypeLiteralReflection, typeLiteralReflection],
  [isTypeParameterReflection, typeParameterReflection],
  [isVariableReflection, variableReflection],
])

test.run()

function each(i: Is, cb: (i: Is, r: unknown) => void, ls: unknown[]): void {
  for (const r of ls) {
    cb(i, r)
  }
}

function cross(ps: [Is, unknown][]): void {
  for (const [xi, xr] of ps) {
    yes(xi, xr)

    for (const [yi, yr] of ps) {
      if (xi !== yi) {
        no(xi, yr)
      }
    }
  }
}

function yes(i: Is, r: unknown): void {
  test(`${i.name}(): returns true for the '${JSON.stringify(r)}'`, () => {
    const a = i(r)
    is(a, true)
  })
}

function no(i: Is, r: unknown): void {
  test(`${i.name}(): returns false for the '${JSON.stringify(r)}'`, () => {
    const a = i(r)
    is(a, false)
  })
}
