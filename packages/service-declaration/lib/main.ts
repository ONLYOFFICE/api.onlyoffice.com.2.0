import type {Example} from "@onlyoffice/declaration-code-example"
import type {Reference} from "@onlyoffice/declaration-reference"

export type {Example} from "@onlyoffice/declaration-code-example"
export type {Reference} from "@onlyoffice/declaration-reference"
export {reference} from "@onlyoffice/declaration-reference"

// todo?:
// content-type, accept
// Successful Response
// Successful Examples
// Unauthorized Response

// todo: use enum interface instead of cases modifier
// export interface EnumType extends TypeNode {
//   type: "enum"
//   cases?: Literal[]
// }

// export interface LiteralType extends TypeNode {
//   type: "literal"
//   type: Type
//   value: unknown
// }

// todo: simplify value, see library-dec

export type Declaration = DeclarationMap[keyof DeclarationMap]

export interface DeclarationMap {
  group: GroupDeclaration
  request: RequestDeclaration
}

export interface GroupDeclaration extends DeclarationNode {
  kind: "group"
  // requests: string[]
}

export interface RequestDeclaration extends DeclarationNode {
  id: string
  kind: "request"
  endpoint: string
  headerParameters?: Property[]
  cookieParameters?: Property[]
  pathParameters?: Property[]
  queryParameters?: Property[]
  bodyParameters?: Value
  examples?: Example[]
  responses?: Response[]
}

export function requestDeclaration(d: DeclarationNode): RequestDeclaration {
  return {
    ...d,
    id: "",
    kind: "request",
    endpoint: "",
    headerParameters: undefined,
    cookieParameters: undefined,
    pathParameters: undefined,
    queryParameters: undefined,
    bodyParameters: undefined,
    examples: undefined,
    responses: undefined
  }
}

export interface DeclarationNode {
  kind: string
  slug: string
  title: string
  description?: string
}

export function declarationNode(): DeclarationNode {
  return {
    kind: "",
    slug: "",
    title: "",
    description: undefined
  }
}

export type Component = Response | Type

export type Response = InlineResponse | ResponseReference

export interface InlineResponse extends ResponseNode {
  description?: string
  // headers?: Property[]
  body?: Value
  examples?: Example[]
}

export interface ResponseReference extends ResponseNode, Reference {}

export interface ResponseNode {
  status: number
}

// export interface Response {
//   status: number
//   description?: string
//   // headers?: Property[]
//   body?: Value
//   examples?: Example[]
// }

export type Property = PropertyMap[keyof PropertyMap] | PropertyReference

export interface PropertyMap {
  array: ArrayProperty
  boolean: BooleanProperty
  integer: IntegerProperty
  number: NumberProperty
  object: ObjectProperty
  // reference: ReferenceProperty
  string: StringProperty
  unknown: UnknownProperty
}

export interface ArrayProperty extends PropertyNode, ArrayValue {}

export interface BooleanProperty extends PropertyNode, BooleanValue {}

export interface IntegerProperty extends PropertyNode, IntegerValue {}

export interface NumberProperty extends PropertyNode, NumberValue {}

export interface ObjectProperty extends PropertyNode, ObjectValue {}

export interface StringProperty extends PropertyNode, StringValue {}

export interface UnknownProperty extends PropertyNode, UnknownValue {}

export interface PropertyReference extends PropertyNode, ValueReference {}

export interface PropertyNode {
  identifier: string
}

export type Value = ValueMap[keyof ValueMap] | ValueReference

export interface ValueMap {
  array: ArrayValue
  boolean: BooleanValue
  integer: IntegerValue
  number: NumberValue
  object: ObjectValue
  string: StringValue
  unknown: UnknownValue
}

export interface ArrayValue extends ValueNode, ArrayType {}

export interface BooleanValue extends ValueNode, BooleanType {
  default?: boolean
}

export interface IntegerValue extends ValueNode, IntegerType {
  default?: number
}

export interface NumberValue extends ValueNode, NumberType {
  default?: number
}

export interface ObjectValue extends ValueNode, ObjectType {}

export interface StringValue extends ValueNode, StringType {
  default?: string
}

export interface UnknownValue extends ValueNode, UnknownType {}

export interface ValueReference extends ValueNode, Reference {}

export interface ValueNode {
  description?: string
  default?: unknown
  required?: true
}

export type Type = TypeMap[keyof TypeMap] | Reference

export interface TypeMap {
  array: ArrayType
  boolean: BooleanType
  integer: IntegerType
  number: NumberType
  object: ObjectType
  string: StringType
  unknown: UnknownType
}

export interface ArrayType extends TypeNode {
  type: "array"
  items?: Type
}

export function arrayType(t: TypeNode): ArrayType {
  return {...t, type: "array", items: undefined}
}

export interface BooleanType extends TypeNode {
  type: "boolean"
}

export function booleanType(t: TypeNode): BooleanType {
  return {...t, type: "boolean"}
}

export interface IntegerType extends TypeNode {
  type: "integer"
}

export function integerType(t: TypeNode): IntegerType {
  return {...t, type: "integer"}
}

export interface NumberType extends TypeNode {
  type: "number"
}

export function numberType(t: TypeNode): NumberType {
  return {...t, type: "number"}
}

export interface ObjectType extends TypeNode {
  type: "object"
  properties?: Property[]
}

export function objectType(t: TypeNode): ObjectType {
  return {...t, type: "object", properties: undefined}
}

export interface StringType extends TypeNode {
  type: "string"
}

export function stringType(t: TypeNode): StringType {
  return {...t, type: "string"}
}

export interface UnknownType extends TypeNode {
  type: "unknown"
}

export function unknownType(t: TypeNode): UnknownType {
  return {...t, type: "unknown"}
}

export interface TypeNode {
  type: string
  format?: string
  cases?: unknown[]
}

export function typeNode(): TypeNode {
  return {type: "", format: undefined, cases: undefined}
}
