export interface Config {
  documentEditor: DocumentEditor
}

export function config(de: DocumentEditor): Config {
  return {
    documentEditor: de
  }
}

export interface DocumentEditor {
  documentServerURL: string
  config: Property[]
}

export function documentEditor(): DocumentEditor {
  return {
    documentServerURL: "",
    config: []
  }
}

export interface Property {
  path: string
  href: string
  type: Type
  format?: Format
  default?: boolean | number | string
}

export function property(t: Type): Property {
  return {
    path: "",
    href: "",
    type: t,
    format: undefined,
    default: undefined
  }
}

export type Format = FormatMap[keyof FormatMap]

export interface FormatMap {
  percent: "percent"
}

export type Type = TypeMap[keyof TypeMap]

export interface TypeMap {
  boolean: BooleanType
  enum: EnumType
  function: FunctionType
  literal: LiteralType
  number: NumberType
  string: StringType
}

export interface BooleanType extends TypeNode {
  type: "boolean"
}

export function booleanType(t: TypeNode): BooleanType {
  return {
    ...t,
    type: "boolean"
  }
}

export interface FunctionType extends TypeNode {
  type: "function"
}

export function functionType(t: TypeNode): FunctionType {
  return {
    ...t,
    type: "function"
  }
}

export interface EnumType extends TypeNode {
  type: "enum"
  cases: Type[]
}

export function enumType(t: TypeNode, c: Type[]): EnumType {
  return {
    ...t,
    type: "enum",
    cases: c
  }
}

export interface LiteralType extends TypeNode {
  type: "literal"
  base: Type
  const: boolean | number | string
}

export function literalType(t: TypeNode, b: Type, c: boolean | number | string): LiteralType {
  return {
    ...t,
    type: "literal",
    base: b,
    const: c
  }
}

export interface NumberType extends TypeNode {
  type: "number"
}

export function numberType(t: TypeNode): NumberType {
  return {
    ...t,
    type: "number"
  }
}

export interface StringType extends TypeNode {
  type: "string"
}

export function stringType(t: TypeNode): StringType {
  return {
    ...t,
    type: "string"
  }
}

export interface TypeNode {
  type: string
}

export function typeNode(): TypeNode {
  return {
    type: ""
  }
}
