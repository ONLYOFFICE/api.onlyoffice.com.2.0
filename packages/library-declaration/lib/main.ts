// todo: kind: constant, enum, interface, variable, initializer, alias, etc.
// todo?: instanceMethod over method with scope: instance, etc.
// todo: is it modification or composition?
// export interface OptionalType extends TypeNode {
//   type: "optional"
//   children: Type[]
// }
// todo: use generic type instead of Record
// export interface RecordType extends TypeNode {
//   type: "record"
//   children: Type[]
// }

import type {Example} from "@onlyoffice/declaration-code-example"
import type {Reference} from "@onlyoffice/declaration-reference"
import type {Token} from "@onlyoffice/declaration-tokenizer"

export type {Example} from "@onlyoffice/declaration-code-example"
export type {Reference} from "@onlyoffice/declaration-reference"
export {reference} from "@onlyoffice/declaration-reference"
export type {Token} from "@onlyoffice/declaration-tokenizer"

export type Declaration = DeclarationMap[keyof DeclarationMap]

export interface DeclarationMap {
  class: ClassDeclaration
  constructor: ConstructorDeclaration
  event: EventDeclaration
  method: MethodDeclaration
  property: PropertyDeclaration
  type: TypeDeclaration
}

export interface ClassDeclaration extends DeclarationNode {
  kind: "class"
  constructors?: Reference[]
  events?: Reference[]
  extends?: Reference[]
  extendsBy?: Reference[]
  instanceMethods?: Reference[]
  instanceProperties?: Reference[]
  typeMethods?: Reference[]
  typeProperties?: Reference[]
}

export function classDeclaration(d: DeclarationNode): ClassDeclaration {
  return {
    ...d,
    kind: "class",
    constructors: undefined,
    events: undefined,
    extends: undefined,
    extendsBy: undefined,
    instanceMethods: undefined,
    instanceProperties: undefined,
    typeMethods: undefined,
    typeProperties: undefined
  }
}

export interface ConstructorDeclaration extends DeclarationNode {
  kind: "constructor"
  type: FunctionType
}

export function constructDeclaration(f: FunctionType, d: DeclarationNode): ConstructorDeclaration {
  return {
    ...d,
    kind: "constructor",
    type: f
  }
}

export interface EventDeclaration extends DeclarationNode {
  kind: "event"
  type: FunctionType
}

export function eventDeclaration(f: FunctionType, d: DeclarationNode): EventDeclaration {
  return {
    ...d,
    kind: "event",
    type: f
  }
}

export interface MethodDeclaration extends DeclarationNode {
  kind: "method"
  scope: "instance" | "type"
  type: FunctionType
}

export function methodDeclaration(f: FunctionType, d: DeclarationNode): MethodDeclaration {
  return {
    ...d,
    kind: "method",
    scope: "instance",
    type: f
  }
}

export interface PropertyDeclaration extends DeclarationNode {
  kind: "property"
  scope: "instance" | "type"
  type: Type
}

export function propertyDeclaration(v: Value, d: DeclarationNode): PropertyDeclaration {
  return {
    ...d,
    kind: "property",
    scope: "instance",
    ...v
  }
}

export interface TypeDeclaration extends DeclarationNode {
  kind: "type"
  type: Type
}

export function typeDeclaration(t: Type, d: DeclarationNode): TypeDeclaration {
  return {
    ...d,
    kind: "type",
    type: t
  }
}

export interface DeclarationNode {
  id: string
  kind: string
  title: string
  summary?: string
  description?: string
  // since?: string
  // deprecated?: string
  parent?: Reference
  identifier: string
  signature?: Token[]
  examples?: Example[]
  overloads?: Reference[]
  overloadsBy?: Reference[]
  tryIt?: string
}

export function declarationNode(): DeclarationNode {
  return {
    id: "",
    kind: "",
    title: "",
    summary: undefined,
    description: undefined,
    parent: undefined,
    identifier: "",
    signature: undefined,
    examples: undefined,
    overloads: undefined,
    overloadsBy: undefined,
    tryIt: undefined
  }
}

export interface Value {
  identifier: string
  signature?: Token[]
  description?: string
  default?: LiteralType
  type: Type
}

export function value(t: Type): Value {
  return {
    identifier: "",
    signature: undefined,
    description: undefined,
    default: undefined,
    type: t
  }
}

export type Type = TypeMap[keyof TypeMap] | Reference

export interface TypeMap {
  any: AnyType
  array: ArrayType
  function: FunctionType
  literal: LiteralType
  object: ObjectType
  passthrough: PassthroughType
  union: UnionType
  unknown: UnknownType
  void: VoidType
}

export interface AnyType extends TypeNode {
  type: "any"
}

export function anyType(t: TypeNode): AnyType {
  return {...t, type: "any"}
}

export interface ArrayType extends TypeNode {
  type: "array"
  items?: Type[]
}

export function arrayType(t: TypeNode): ArrayType {
  return {...t, type: "array", items: undefined}
}

export interface FunctionType extends TypeNode {
  type: "function"
  parameters?: Value[]
  returns?: FunctionReturns
}

export function functionType(t: TypeNode): FunctionType {
  return {...t, type: "function", parameters: undefined, returns: undefined}
}

export interface FunctionReturns {
  signature?: Token[]
  description?: string
  type: Type
}

export function functionReturns(t: Type): FunctionReturns {
  return {signature: undefined, description: undefined, type: t}
}

export interface LiteralType extends TypeNode {
  type: "literal"
  value: unknown
}

export function literalType(t: TypeNode, value: unknown): LiteralType {
  return {...t, type: "literal", value}
}

export interface ObjectType extends TypeNode {
  type: "object"
  properties?: Value[]
  methods?: FunctionType[]
}

export function objectType(t: TypeNode): ObjectType {
  return {...t, type: "object", properties: undefined, methods: undefined}
}

export interface PassthroughType extends TypeNode {
  type: "passthrough"
  value: unknown
}

export function passthroughType(t: TypeNode, value: unknown): PassthroughType {
  return {...t, type: "passthrough", value}
}

export interface UnionType extends TypeNode {
  type: "union"
  types: Type[]
}

export function unionType(t: TypeNode): UnionType {
  return {...t, type: "union", types: []}
}

export interface UnknownType extends TypeNode {
  type: "unknown"
}

export function unknownType(t: TypeNode): UnknownType {
  return {...t, type: "unknown"}
}

export interface VoidType extends TypeNode {
  type: "void"
}

export function voidType(t: TypeNode): VoidType {
  return {...t, type: "void"}
}

export interface TypeNode {
  type: string
}

export function typeNode(): TypeNode {
  return {type: ""}
}
