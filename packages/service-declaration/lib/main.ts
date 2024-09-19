export type Declaration = DeclarationMap[keyof DeclarationMap]

export interface DeclarationMap {
  group: GroupDeclaration
  operation: OperationDeclaration
}

export class GroupDeclaration implements DeclarationNode {
  id = ""
  type = "group" as const
  name = ""
  parent = ""
  children: string[] = []
}

export class OperationDeclaration implements DeclarationNode {
  id = ""
  type = "operation" as const
  name = ""
  parent = ""
  deprecated = false
  request = new Request()
  responses: Response[] = []
}

export interface DeclarationNode {
  id: string
  type: string
  name: string
  parent: string
}

export class Request {
  method = ""
  path = ""
  description = ""
  authorizations: Authorization[] = []
  headerParameters = new Entity()
  cookieParameters = new Entity()
  pathParameters = new Entity()
  queryParameters = new Entity()
  bodyParameters = new Entity()
}

export type Authorization = AuthorizationMap[keyof AuthorizationMap]

export interface AuthorizationMap {
  apiKey: ApiKeyAuthorization
}

export class ApiKeyAuthorization implements AuthorizationNode {
  type = "apiKey" as const
  identifier = ""
  description = ""
  "in": "cookie" | "header" | "query" | "" = ""
  scopes: string[] = []
}

export interface AuthorizationNode {
  type: string
  description: string
}

export class Response {
  status = -1
  description = ""
  body = new Entity()
}

export class Property {
  identifier = ""
  required = false
  self: Entity | Reference = new Entity()
}

export class Entity {
  description = ""
  deprecated = false
  type: Type = new NoopType()
  format = ""
  default: Const = new NoopConst()
  example: unknown = ""
}

export type Const = ConstMap[keyof ConstMap]

export interface ConstMap {
  noop: NoopConst
  passthrough: PassthroughConst
}

export class NoopConst implements ConstNode {
  type = "noop" as const
}

export class PassthroughConst implements ConstNode {
  type = "passthrough" as const
  value: unknown = ""
}

export interface ConstNode {
  type: string
}

export type Type = TypeMap[keyof TypeMap]

export interface TypeMap {
  array: ArrayType
  boolean: BooleanType
  enum: EnumType
  integer: IntegerType
  literal: LiteralType
  noop: NoopType
  null: NullType
  number: NumberType
  object: ObjectType
  string: StringType
  union: UnionType
  unknown: UnknownType
}

export class ArrayType implements TypeNode {
  type = "array" as const
  items: Entity | Reference = new Entity()
}

export class BooleanType implements TypeNode {
  type = "boolean" as const
}

export class EnumType implements TypeNode {
  type = "enum" as const
  cases: Entity[] = []
}

export class IntegerType implements TypeNode {
  type = "integer" as const
}

export class LiteralType implements TypeNode {
  type = "literal" as const
  base: Type = new NoopType()
  "const": Const = new NoopConst()
}

export class NoopType implements TypeNode {
  type = "noop" as const
}

export class NullType implements TypeNode {
  type = "null" as const
}

export class NumberType implements TypeNode {
  type = "number" as const
}

export class ObjectType implements TypeNode {
  type = "object" as const
  properties: Property[] = []
}

export class StringType implements TypeNode {
  type = "string" as const
}

export class UnionType implements TypeNode {
  type = "union" as const
  types: Type[] = []
}

export class UnknownType implements TypeNode {
  type = "unknown" as const
}

export interface TypeNode {
  type: string
}

export type Reference = ReferenceMap[keyof ReferenceMap]

export interface ReferenceMap {
  circular: CircularReference
}

export class CircularReference implements ReferenceNode {
  type = "circular" as const
}

export interface ReferenceNode {
  type: string
}
