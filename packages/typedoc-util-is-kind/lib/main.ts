import {ReflectionKind} from "typedoc"

export function isProjectKind(k: unknown): k is ReflectionKind.Project {
  return isKind(k) && k === ReflectionKind.Project.valueOf()
}

export function isModuleKind(k: unknown): k is ReflectionKind.Module {
  return isKind(k) && k === ReflectionKind.Module.valueOf()
}

export function isNamespaceKind(k: unknown): k is ReflectionKind.Namespace {
  return isKind(k) && k === ReflectionKind.Namespace.valueOf()
}

export function isEnumKind(k: unknown): k is ReflectionKind.Enum {
  return isKind(k) && k === ReflectionKind.Enum.valueOf()
}

export function isEnumMemberKind(k: unknown): k is ReflectionKind.EnumMember {
  return isKind(k) && k === ReflectionKind.EnumMember.valueOf()
}

export function isVariableKind(k: unknown): k is ReflectionKind.Variable {
  return isKind(k) && k === ReflectionKind.Variable.valueOf()
}

export function isFunctionKind(k: unknown): k is ReflectionKind.Function {
  return isKind(k) && k === ReflectionKind.Function.valueOf()
}

export function isClassKind(k: unknown): k is ReflectionKind.Class {
  return isKind(k) && k === ReflectionKind.Class.valueOf()
}

export function isInterfaceKind(k: unknown): k is ReflectionKind.Interface {
  return isKind(k) && k === ReflectionKind.Interface.valueOf()
}

export function isConstructorKind(k: unknown): k is ReflectionKind.Constructor {
  return isKind(k) && k === ReflectionKind.Constructor.valueOf()
}

export function isPropertyKind(k: unknown): k is ReflectionKind.Property {
  return isKind(k) && k === ReflectionKind.Property.valueOf()
}

export function isMethodKind(k: unknown): k is ReflectionKind.Method {
  return isKind(k) && k === ReflectionKind.Method.valueOf()
}

export function isCallSignatureKind(k: unknown): k is ReflectionKind.CallSignature {
  return isKind(k) && k === ReflectionKind.CallSignature.valueOf()
}

export function isIndexSignatureKind(k: unknown): k is ReflectionKind.IndexSignature {
  return isKind(k) && k === ReflectionKind.IndexSignature.valueOf()
}

export function isConstructorSignatureKind(k: unknown): k is ReflectionKind.ConstructorSignature {
  return isKind(k) && k === ReflectionKind.ConstructorSignature.valueOf()
}

export function isParameterKind(k: unknown): k is ReflectionKind.Parameter {
  return isKind(k) && k === ReflectionKind.Parameter.valueOf()
}

export function isTypeLiteralKind(k: unknown): k is ReflectionKind.TypeLiteral {
  return isKind(k) && k === ReflectionKind.TypeLiteral.valueOf()
}

export function isTypeParameterKind(k: unknown): k is ReflectionKind.TypeParameter {
  return isKind(k) && k === ReflectionKind.TypeParameter.valueOf()
}

export function isAccessorKind(k: unknown): k is ReflectionKind.Accessor {
  return isKind(k) && k === ReflectionKind.Accessor.valueOf()
}

export function isGetSignatureKind(k: unknown): k is ReflectionKind.GetSignature {
  return isKind(k) && k === ReflectionKind.GetSignature.valueOf()
}

export function isSetSignatureKind(k: unknown): k is ReflectionKind.SetSignature {
  return isKind(k) && k === ReflectionKind.SetSignature.valueOf()
}

export function isTypeAliasKind(k: unknown): k is ReflectionKind.TypeAlias {
  return isKind(k) && k === ReflectionKind.TypeAlias.valueOf()
}

export function isReferenceKind(k: unknown): k is ReflectionKind.Reference {
  return isKind(k) && k === ReflectionKind.Reference.valueOf()
}

export function isDocumentKind(k: unknown): k is ReflectionKind.Document {
  return isKind(k) && k === ReflectionKind.Document.valueOf()
}

export function isKind(k: unknown): k is number {
  return typeof k === "number"
}
