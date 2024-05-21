import {spawn} from "node:child_process"
import type {Writable} from "node:stream"

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L186 JSDoc Reference}
 */
export interface Doclet {
  augments?: string[]
  description?: string
  examples?: string[]
  fires?: string[]
  inherits?: string
  kind?: DocletKind
  longname?: string
  memberof?: string
  meta?: DocletMeta
  name?: string
  nullable?: boolean
  optional?: boolean
  params?: DocletParam[]
  properties?: DocletParam[]
  returns?: DocletParam[]
  scope?: DocletScope
  summary?: string
  type?: DocletType
  undocumented?: boolean
}

export function doclet(): Doclet {
  return {
    augments: undefined,
    description: undefined,
    examples: undefined,
    fires: undefined,
    inherits: undefined,
    kind: undefined,
    longname: undefined,
    memberof: undefined,
    meta: undefined,
    name: undefined,
    nullable: undefined,
    optional: undefined,
    params: undefined,
    properties: undefined,
    returns: undefined,
    scope: undefined,
    summary: undefined,
    type: undefined
  }
}

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L328 JSDoc Reference}
 */
export type DocletKind =
  "class" |
  "constant" |
  "event" |
  "external" |
  "file" |
  "function" |
  "interface" |
  "member" |
  "mixin" |
  "module" |
  "namespace" |
  "package" |
  "param" |
  "typedef"

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L437 JSDoc Reference}
 */
export type DocletScope =
  "global" |
  "inner" |
  "instance" |
  "static"

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L25 JSDoc Reference}
 */
export interface DocletMeta {
  columnno?: number
  file?: string // custom
  lineno?: number
}

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L155 JSDoc Reference}
 */
export interface DocletParam {
  defaultvalue?: unknown
  description?: string
  name?: string
  nullable?: boolean
  optional?: boolean
  type?: DocletType
}

/**
 * {@link https://github.com/jsdoc/jsdoc/blob/4.0.2/lib/jsdoc/schema.js/#L89 JSDoc Reference}
 */
export interface DocletType {
  parsedType?: Catharsis
}

/**
 * {@link https://github.com/hegemonic/catharsis/blob/0.9.0/lib/schema.js/ Catharsis Reference}
 */
export interface Catharsis {
  type?: CatharsisType
  params?: Catharsis[]
  name?: string
  expression?: Catharsis
  applications?: Catharsis[]
  elements?: Catharsis[]
  optional?: boolean
  nullable?: boolean
}

/**
 * {@link https://github.com/hegemonic/catharsis/blob/0.9.0/lib/types.js/ Catharsis Reference}
 */
export type CatharsisType =
  "AllLiteral" |
  "FieldType" |
  "FunctionType" |
  "NameExpression" |
  "NullLiteral" |
  "RecordType" |
  "TypeApplication" |
  "TypeUnion" |
  "UndefinedLiteral" |
  "UnknownLiteral"

export function jsdoc(w: Writable, opts: string[]): Promise<void> {
  return new Promise((res, rej) => {
    const s = spawn("pnpm", ["exec", "--", "jsdoc", ...opts])
    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
    s.on("close", res)
    s.on("error", rej)
  })
}
