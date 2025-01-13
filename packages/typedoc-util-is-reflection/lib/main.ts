import {
  isAccessorKind,
  isCallSignatureKind,
  isClassKind,
  isConstructorKind,
  isConstructorSignatureKind,
  isEnumKind,
  isEnumMemberKind,
  isFunctionKind,
  isGetSignatureKind,
  isIndexSignatureKind,
  isInterfaceKind,
  isMethodKind,
  isModuleKind,
  isNamespaceKind,
  isPropertyKind,
  isSetSignatureKind,
  isTypeAliasKind,
  isTypeLiteralKind,
  isVariableKind,
} from "@onlyoffice/typedoc-util-is-kind"
import {type JSONOutput as J, type ReflectionKind as K} from "typedoc"

type R<R, K> = R & {kind: K}

export function isModuleReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Module> {
  return isDeclarationReflection(r) && isModuleKind(r.kind)
}

export function isNamespaceReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Namespace> {
  return isDeclarationReflection(r) && isNamespaceKind(r.kind)
}

export function isEnumReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Enum> {
  return isDeclarationReflection(r) && isEnumKind(r.kind)
}

export function isEnumMemberReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.EnumMember> {
  return isDeclarationReflection(r) && isEnumMemberKind(r.kind)
}

export function isVariableReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Variable> {
  return isDeclarationReflection(r) && isVariableKind(r.kind)
}

export function isFunctionReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Function> {
  return isDeclarationReflection(r) && isFunctionKind(r.kind)
}

export function isClassReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Class> {
  return isDeclarationReflection(r) && isClassKind(r.kind)
}

export function isInterfaceReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Interface> {
  return isDeclarationReflection(r) && isInterfaceKind(r.kind)
}

export function isConstructorReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Constructor> {
  return isDeclarationReflection(r) && isConstructorKind(r.kind)
}

export function isPropertyReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Property> {
  return isDeclarationReflection(r) && isPropertyKind(r.kind)
}

export function isMethodReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Method> {
  return isDeclarationReflection(r) && isMethodKind(r.kind)
}

export function isCallSignatureReflection(
  r: unknown,
): r is R<J.SignatureReflection, K.CallSignature> {
  return isSignatureReflection(r) && isCallSignatureKind(r.kind)
}

export function isIndexSignatureReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.IndexSignature> {
  return isDeclarationReflection(r) && isIndexSignatureKind(r.kind)
}

export function isConstructorSignatureReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.ConstructorSignature> {
  return isSignatureReflection(r) && isConstructorSignatureKind(r.kind)
}

export function isTypeLiteralReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.TypeLiteral> {
  return isDeclarationReflection(r) && isTypeLiteralKind(r.kind)
}

export function isAccessorReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.Accessor> {
  return isDeclarationReflection(r) && isAccessorKind(r.kind)
}

export function isGetSignatureReflection(
  r: unknown,
): r is R<J.SignatureReflection, K.GetSignature> {
  return isSignatureReflection(r) && isGetSignatureKind(r.kind)
}

export function isSetSignatureReflection(
  r: unknown,
): r is R<J.SignatureReflection, K.SetSignature> {
  return isSignatureReflection(r) && isSetSignatureKind(r.kind)
}

export function isTypeAliasReflection(
  r: unknown,
): r is R<J.DeclarationReflection, K.TypeAlias> {
  return isDeclarationReflection(r) && isTypeAliasKind(r.kind)
}

export function isDeclarationReflection(
  r: unknown,
): r is J.DeclarationReflection {
  return isReflection(r) && r.variant === "declaration"
}

export function isDocumentReflection(
  r: unknown,
): r is J.DocumentReflection {
  return isReflection(r) && r.variant === "document"
}

export function isParameterReflection(
  r: unknown,
): r is J.ParameterReflection {
  return isReflection(r) && r.variant === "param"
}

export function isProjectReflection(
  r: unknown,
): r is J.ProjectReflection {
  return isReflection(r) && r.variant === "project"
}

export function isReferenceReflection(
  r: unknown,
): r is J.ReferenceReflection {
  return isReflection(r) && r.variant === "reference"
}

export function isSignatureReflection(
  r: unknown,
): r is J.SignatureReflection {
  return isReflection(r) && r.variant === "signature"
}

export function isTypeParameterReflection(
  r: unknown,
): r is J.TypeParameterReflection {
  return isReflection(r) && r.variant === "typeParam"
}

export function isContainerReflection(
  r: unknown,
): r is J.ContainerReflection {
  return isReflection(r) && "children" in r
}

export function isReflection(r: unknown): r is J.Reflection {
  return isObject(r) && "kind" in r && typeof r.kind === "number"
}

function isObject(o: unknown): o is object {
  return typeof o === "object" && o !== null && !Array.isArray(o)
}
