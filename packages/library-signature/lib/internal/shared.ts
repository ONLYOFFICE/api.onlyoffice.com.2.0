// todo
/* eslint-disable unicorn/no-empty-file */

// import * as Library from "@onlyoffice/library-declaration"
// import {
//   KeywordToken,
//   Reference,
//   type Signature,
//   StringToken,
//   TextToken,
//   type Token,
//   TypeToken,
// } from "@onlyoffice/signature"

// export function classKeyword(): KeywordToken {
//   const t = new KeywordToken()
//   t.text = "class"
//   return t
// }

// export function dotText(): TextToken {
//   const t = new TextToken()
//   t.text = "."
//   return t
// }

// export function spaceText(): TextToken {
//   const t = new TextToken()
//   t.text = " "
//   return t
// }

// export function equalsText(): TextToken {
//   const t = new TextToken()
//   t.text = " = "
//   return t
// }

// export function leftCurlyText(): TextToken {
//   const t = new TextToken()
//   t.text = "("
//   return t
// }

// export function rightCurlyText(): TextToken {
//   const t = new TextToken()
//   t.text = ")"
//   return t
// }

// export function unionText(): TextToken {
//   const t = new TextToken()
//   t.text = " | "
//   return t
// }

// export function arrayText(): TextToken {
//   const t = new TextToken()
//   t.text = "[]"
//   return t
// }

// export function colonText(): TextToken {
//   const t = new TextToken()
//   t.text = ": "
//   return t
// }

// export function commaText(): TextToken {
//   const t = new TextToken()
//   t.text = ", "
//   return t
// }

// export function anyText(): TextToken {
//   const t = new TextToken()
//   t.text = "any"
//   return t
// }

// export function objectText(): TextToken {
//   const t = new TextToken()
//   t.text = "object"
//   return t
// }

// export function unknownText(): TextToken {
//   const t = new TextToken()
//   t.text = "unknown"
//   return t
// }

// export function voidText(): TextToken {
//   const t = new TextToken()
//   t.text = "void"
//   return t
// }

// export function classDeclaration(): Library.ClassDeclaration {
//   const n = Library.declarationNode()
//   return Library.classDeclaration(n)
// }

// export function constructorDeclaration(t: Library.FunctionType): Library.ConstructorDeclaration {
//   const n = Library.declarationNode()
//   return Library.constructDeclaration(t, n)
// }

// export function eventDeclaration(t: Library.FunctionType): Library.EventDeclaration {
//   const n = Library.declarationNode()
//   return Library.eventDeclaration(t, n)
// }

// export function methodDeclaration(t: Library.FunctionType): Library.MethodDeclaration {
//   const n = Library.declarationNode()
//   return Library.methodDeclaration(t, n)
// }

// export function propertyDeclaration(v: Library.Value): Library.PropertyDeclaration {
//   const n = Library.declarationNode()
//   return Library.propertyDeclaration(v, n)
// }

// export function typeDeclaration(t: Library.Type): Library.TypeDeclaration {
//   const n = Library.declarationNode()
//   return Library.typeDeclaration(t, n)
// }

// export function anyReturns(): Library.FunctionReturns {
//   const t = anyType()
//   return Library.functionReturns(t)
// }

// export function anyValue(id: string): Library.Value {
//   const t = anyType()
//   const v = Library.value(t)
//   v.identifier = id
//   return v
// }

// export function anyType(): Library.AnyType {
//   const n = Library.typeNode()
//   return Library.anyType(n)
// }

// export function arrayType(): Library.ArrayType {
//   const n = Library.typeNode()
//   return Library.arrayType(n)
// }

// export function functionType(): Library.FunctionType {
//   const n = Library.typeNode()
//   return Library.functionType(n)
// }

// export function literalType(v: unknown): Library.LiteralType {
//   const n = Library.typeNode()
//   return Library.literalType(n, v)
// }

// export function objectType(): Library.ObjectType {
//   const n = Library.typeNode()
//   return Library.objectType(n)
// }

// export function passthroughType(v: unknown): Library.PassthroughType {
//   const n = Library.typeNode()
//   return Library.passthroughType(n, v)
// }

// export function unionType(): Library.UnionType {
//   const n = Library.typeNode()
//   return Library.unionType(n)
// }

// export function unknownType(): Library.UnknownType {
//   const n = Library.typeNode()
//   return Library.unknownType(n)
// }

// export function voidType(): Library.VoidType {
//   const n = Library.typeNode()
//   return Library.voidType(n)
// }
