import type * as Tokenizer from "@onlyoffice/declaration-tokenizer"
import * as tokenizer from "@onlyoffice/declaration-tokenizer"
import {equal as eq} from "uvu/assert"
import {test} from "uvu"
import type * as Library from "./main.ts"
import * as library from "./main.ts"
import * as lt from "./tokenizer.ts"

test("voidType(): creates tokens for the void type", () => {
  const t = voidType()
  const a = lt.voidType(t)
  const e = [voidText()]
  eq(a, e)
})

test("unknownType(): creates tokens for the unknown type", () => {
  const t = unknownType()
  const a = lt.unknownType(t)
  const e = [unknownText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with no subtypes", () => {
  const t = unionType()
  const a = lt.unionType(t)
  eq(a, [])
})

test("unionType(): creates tokens for the union type with one subtype", () => {
  const t = unionType()
  t.types = [anyType()]
  const a = lt.unionType(t)
  const e = [anyText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with multiple subtypes", () => {
  const t = unionType()
  t.types = [anyType(), anyType()]
  const a = lt.unionType(t)
  const e = [anyText(), unionText(), anyText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with one union subtype", () => {
  const u0 = unionType()
  const u1 = unionType()
  u1.types = [anyType()]
  u0.types = [u1]
  const a = lt.unionType(u0)
  const e = [anyText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with the union subtype", () => {
  const u0 = unionType()
  const at = anyType()
  const u1 = unionType()
  u1.types = [anyType(), anyType()]
  u0.types = [at, u1]
  const a = lt.unionType(u0)
  const e = [anyText(), unionText(), anyText(), unionText(), anyText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with one function subtype", () => {
  const ut = unionType()
  const ft = functionType()
  ft.returns = anyReturns()
  ut.types = [ft]
  const a = lt.unionType(ut)
  const e = [leftCurlyText(), rightCurlyText(), colonText(), anyText()]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with the function subtype ahead", () => {
  const ut = unionType()
  const ft = functionType()
  ft.returns = anyReturns()
  const at = anyType()
  ut.types = [ft, at]
  const a = lt.unionType(ut)
  const e = [
    leftCurlyText(),
    leftCurlyText(),
    rightCurlyText(),
    colonText(),
    anyText(),
    rightCurlyText(),
    unionText(),
    anyText()
  ]
  eq(a, e)
})

test("unionType(): creates tokens for the union type with the function subtype behind", () => {
  const ut = unionType()
  const at = anyType()
  const ft = functionType()
  ft.returns = anyReturns()
  ut.types = [at, ft]
  const a = lt.unionType(ut)
  const e = [
    anyText(),
    unionText(),
    leftCurlyText(),
    rightCurlyText(),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("passthroughType(): creates tokens for the passthrough type with an empty value", () => {
  const t = passthroughType("")
  const a = lt.passthroughType(t)
  const e = [textToken("")]
  eq(a, e)
})

test("passthroughType(): creates tokens for the passthrough with a non-empty value", () => {
  const t = passthroughType("v")
  const a = lt.passthroughType(t)
  const e = [textToken("v")]
  eq(a, e)
})

test("objectType(): creates tokens for the object type", () => {
  const t = objectType()
  const a = lt.objectType(t)
  const e = [objectText()]
  eq(a, e)
})

test("literalType(): creates tokens for the literal type with an empty value", () => {
  const t = literalType("")
  const a = lt.literalType(t)
  const e = [textToken("")]
  eq(a, e)
})

test("literalType(): creates tokens for the literal type with a non-empty value", () => {
  const t = literalType("v")
  const a = lt.literalType(t)
  const e = [textToken("v")]
  eq(a, e)
})

test("functionType(): creates tokens for the function type with no parameters, returns", () => {
  const t = functionType()
  const a = lt.functionType(t)
  const e = [leftCurlyText(), rightCurlyText()]
  eq(a, e)
})

test("functionType(): creates tokens for the function type with a parameter with an empty identifier", () => {
  const f = functionType()
  f.parameters = [anyValue("")]
  const a = lt.functionType(f)
  const e = [
    leftCurlyText(),
    textToken(""),
    colonText(),
    anyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("functionType(): creates tokens for the function type with one parameter", () => {
  const f = functionType()
  f.parameters = [anyValue("v")]
  const a = lt.functionType(f)
  const e = [
    leftCurlyText(),
    textToken("v"),
    colonText(),
    anyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("functionType(): creates tokens for the function type with multiple parameters", () => {
  const t = functionType()
  t.parameters = [anyValue("a"), anyValue("b")]
  const a = lt.functionType(t)
  const e = [
    leftCurlyText(),
    textToken("a"),
    colonText(),
    anyText(),
    commaText(),
    textToken("b"),
    colonText(),
    anyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("functionType(): creates tokens for the function type with a return type", () => {
  const t = functionType()
  t.returns = anyReturns()
  const a = lt.functionType(t)
  const e = [
    leftCurlyText(),
    rightCurlyText(),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("arrayType(): creates tokens for the array type with no items", () => {
  const t = arrayType()
  const a = lt.arrayType(t)
  const e = [arrayText()]
  eq(a, e)
})

test("arrayType(): creates tokens for the array type with one item", () => {
  const t = arrayType()
  t.items = [anyType()]
  const a = lt.arrayType(t)
  const e = [anyText(), arrayText()]
  eq(a, e)
})

// todo: The items property of ArrayType must be Type instead of Type[].
// In the current version, there is some ambiguity regarding the behavior when
// the items property is an array of types. Should it be interpreted as a union
// type? If that is the case, would not it be more simple to use UnionType as a
// single item property? Alternatively, should it be considered a tuple? If so,
// would not adding a new TupleType be clearer?
// test("arrayType(): creates tokens for the array type with multiple items", () => {
//   const t = arrayType()
//   t.items = [anyType(), anyType()]
//   const a = lt.arrayType(t)
//   const e = [
//     leftCurlyText(),
//     anyText(),
//     commaText(),
//     anyText(),
//     rightCurlyText(),
//     arrayText()
//   ]
//   eq(a, e)
// })

test("arrayType(): creates tokens for the array type with a union item with one subtype", () => {
  const at = arrayType()
  const ut = unionType()
  ut.types = [anyType()]
  at.items = [ut]
  const a = lt.arrayType(at)
  const e = [anyText(), arrayText()]
  eq(a, e)
})

test("arrayType(): creates tokens for the array type with a union item with multiple subtypes", () => {
  const at = arrayType()
  const ut = unionType()
  ut.types = [anyType(), anyType()]
  at.items = [ut]
  const a = lt.arrayType(at)
  const e = [
    leftCurlyText(),
    anyText(),
    unionText(),
    anyText(),
    rightCurlyText(),
    arrayText()
  ]
  eq(a, e)
})

test("arrayType(): creates tokens for the array type with a function item", () => {
  const t = arrayType()
  t.items = [functionType()]
  const a = lt.arrayType(t)
  const e = [
    leftCurlyText(),
    leftCurlyText(),
    rightCurlyText(),
    rightCurlyText(),
    arrayText()
  ]
  eq(a, e)
})

test("arrayType(): creates tokens for the array type with a array item", () => {
  const t = arrayType()
  t.items = [arrayType()]
  const a = lt.arrayType(t)
  const e = [arrayText(), arrayText()]
  eq(a, e)
})

test("anyType(): creates tokens for the any type", () => {
  const t = anyType()
  const a = lt.anyType(t)
  const e = [anyText()]
  eq(a, e)
})

test("type(): creates tokens for the reference with no id", () => {
  const t = library.reference("")
  const a = lt.type(t)
  const e = [referenceToken("")]
  eq(a, e)
})

test("type(): creates tokens for the reference with an id", () => {
  const t = library.reference("v")
  const a = lt.type(t)
  const e = [referenceToken("v")]
  eq(a, e)
})

test("type(): creates tokens for the any type", () => {
  const t = anyType()
  const a = lt.type(t)
  const e = [anyText()]
  eq(a, e)
})

test("type(): creates tokens for the array type", () => {
  const t = arrayType()
  const a = lt.type(t)
  const e = [arrayText()]
  eq(a, e)
})

test("type(): creates tokens for the function type", () => {
  const t = functionType()
  const a = lt.type(t)
  const e = [leftCurlyText(), rightCurlyText()]
  eq(a, e)
})

test("type(): creates tokens for the literal type", () => {
  const t = literalType("v")
  const a = lt.type(t)
  const e = [textToken("v")]
  eq(a, e)
})

test("type(): creates tokens for the object type", () => {
  const t = objectType()
  const a = lt.type(t)
  const e = [objectText()]
  eq(a, e)
})

test("type(): creates tokens for the passthrough type", () => {
  const t = passthroughType("v")
  const a = lt.type(t)
  const e = [textToken("v")]
  eq(a, e)
})

test("type(): creates tokens for the union type", () => {
  const t = unionType()
  const a = lt.type(t)
  eq(a, [])
})

test("type(): creates tokens for the unknown type", () => {
  const t = unknownType()
  const a = lt.type(t)
  const e = [unknownText()]
  eq(a, e)
})

test("type(): creates tokens for the void type", () => {
  const t = voidType()
  const a = lt.type(t)
  const e = [voidText()]
  eq(a, e)
})

test("type(): creates an empty array for an unsupported type", () => {
  // @ts-expect-error
  const a = lt.type({})
  eq(a, [])
})

test("value(): creates tokens for the value with an empty identifier", () => {
  const v = anyValue("")
  const a = lt.value(v)
  const e = [textToken(""), colonText(), anyText()]
  eq(a, e)
})

test("value(): creates tokens for the value with an identifier", () => {
  const v = anyValue("v")
  const a = lt.value(v)
  const e = [textToken("v"), colonText(), anyText()]
  eq(a, e)
})

test("value(): creates tokens for the value with a default value", () => {
  const v = anyValue("")
  v.default = literalType("v")
  const a = lt.value(v)
  const e = [
    textToken(""),
    colonText(),
    anyText(),
    equalsText(),
    textToken("v")
  ]
  eq(a, e)
})

test("typeDeclaration(): creates tokens for the type declaration with no identifier", () => {
  const t = anyType()
  const d = typeDeclaration(t)
  const a = lt.typeDeclaration(d)
  const e = [
    anyDecorator(),
    spaceText(),
    identifierToken(""),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("typeDeclaration(): creates tokens for the type declaration with an identifier", () => {
  const t = anyType()
  const d = typeDeclaration(t)
  d.identifier = "d"
  const a = lt.typeDeclaration(d)
  const e = [
    anyDecorator(),
    spaceText(),
    identifierToken("d"),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

// todo: The type declaration must have the actual type in the decorator, not
// its identifier.
// test("typeDeclaration(): creates tokens for the type declaration with a reference", () => {
//   const t = library.reference("v")
//   const d = typeDeclaration(t)
//   const a = lt.typeDeclaration(d)
//   const e = [
//     decoratorToken("(v)"),
//     spaceText(),
//     identifierToken(""),
//     colonText(),
//     referenceToken("v")
//   ]
//   eq(a, e)
// })

test("propertyDeclaration(): creates tokens for the property declaration with no identifier", () => {
  const v = anyValue("v")
  const d = propertyDeclaration(v)
  const a = lt.propertyDeclaration(d)
  const e = [
    propertyDecorator(),
    spaceText(),
    referenceToken(""),
    dotText(),
    identifierToken("v"),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("propertyDeclaration(): creates tokens for the property declaration with an identifier", () => {
  const v = anyValue("v")
  const d = propertyDeclaration(v)
  d.identifier = "d"
  const a = lt.propertyDeclaration(d)
  const e = [
    propertyDecorator(),
    spaceText(),
    referenceToken(""),
    dotText(),
    identifierToken("d"),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("propertyDeclaration(): creates tokens for the property declaration with a parent", () => {
  const v = anyValue("v")
  const d = propertyDeclaration(v)
  d.parent = library.reference("p")
  const a = lt.propertyDeclaration(d)
  const e = [
    propertyDecorator(),
    spaceText(),
    referenceToken("p"),
    dotText(),
    identifierToken("v"),
    colonText(),
    anyText()
  ]
  eq(a, e)
})

test("methodDeclaration(): creates tokens for the method declaration with no identifier", () => {
  const f = functionType()
  const d = methodDeclaration(f)
  const a = lt.methodDeclaration(d)
  const e = [
    methodDecorator(),
    spaceText(),
    referenceToken(""),
    textToken("."),
    identifierToken(""),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("methodDeclaration(): creates tokens for the method declaration with an identifier", () => {
  const f = functionType()
  const d = methodDeclaration(f)
  d.identifier = "d"
  const a = lt.methodDeclaration(d)
  const e = [
    methodDecorator(),
    spaceText(),
    referenceToken(""),
    textToken("."),
    identifierToken("d"),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("methodDeclaration(): creates tokens for the method declaration with a parent", () => {
  const f = functionType()
  const d = methodDeclaration(f)
  d.parent = library.reference("p")
  const a = lt.methodDeclaration(d)
  const e = [
    methodDecorator(),
    spaceText(),
    referenceToken("p"),
    textToken("."),
    identifierToken(""),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("eventDeclaration(): creates tokens for the event declaration with no identifier", () => {
  const f = functionType()
  const d = eventDeclaration(f)
  const a = lt.eventDeclaration(d)
  const e = [
    eventDecorator(),
    spaceText(),
    referenceToken(""),
    textToken("."),
    identifierToken(""),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("eventDeclaration(): creates tokens for the event declaration with an identifier", () => {
  const f = functionType()
  const d = eventDeclaration(f)
  d.identifier = "d"
  const a = lt.eventDeclaration(d)
  const e = [
    eventDecorator(),
    spaceText(),
    referenceToken(""),
    textToken("."),
    identifierToken("d"),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("eventDeclaration(): creates tokens for the event declaration with a parent", () => {
  const f = functionType()
  const d = eventDeclaration(f)
  d.parent = library.reference("p")
  const a = lt.eventDeclaration(d)
  const e = [
    eventDecorator(),
    spaceText(),
    referenceToken("p"),
    textToken("."),
    identifierToken(""),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("constructorDeclaration(): creates tokens for the constructor declaration with no identifier", () => {
  const f = functionType()
  const d = constructorDeclaration(f)
  const a = lt.constructorDeclaration(d)
  const e = [
    constructorDecorator(),
    spaceText(),
    identifierToken(""),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("constructorDeclaration(): creates tokens for the constructor declaration with an identifier", () => {
  const f = functionType()
  const d = constructorDeclaration(f)
  d.identifier = "d"
  const a = lt.constructorDeclaration(d)
  const e = [
    constructorDecorator(),
    spaceText(),
    identifierToken("d"),
    leftCurlyText(),
    rightCurlyText()
  ]
  eq(a, e)
})

test("classDeclaration(): creates tokens for the class declaration with no identifier", () => {
  const d = classDeclaration()
  const a = lt.classDeclaration(d)
  const e = [classKeyword(), spaceText(), identifierToken("")]
  eq(a, e)
})

test("classDeclaration(): creates tokens for the class declaration with an identifier", () => {
  const d = classDeclaration()
  d.identifier = "d"
  const a = lt.classDeclaration(d)
  const e = [classKeyword(), spaceText(), identifierToken("d")]
  eq(a, e)
})

test("classDeclaration(): creates tokens for the class declaration with one extends", () => {
  const d = classDeclaration()
  d.extends = [library.reference("v")]
  const a = lt.classDeclaration(d)
  const e = [
    classKeyword(),
    spaceText(),
    identifierToken(""),
    spaceText(),
    keywordToken("extends"),
    spaceText(),
    referenceToken("v")
  ]
  eq(a, e)
})

test("classDeclaration(): creates tokens for the class declaration with multiple extends", () => {
  const d = classDeclaration()
  d.extends = [library.reference("a"), library.reference("b")]
  const a = lt.classDeclaration(d)
  const e = [
    classKeyword(),
    spaceText(),
    identifierToken(""),
    spaceText(),
    keywordToken("extends"),
    spaceText(),
    referenceToken("a"),
    commaText(),
    referenceToken("b")
  ]
  eq(a, e)
})

test("declaration(): creates tokens for the class declaration", () => {
  const d = classDeclaration()
  const [a] = lt.declaration(d)
  const e = classKeyword()
  eq(a, e)
})

test("declaration(): creates tokens for the constructor declaration", () => {
  const f = functionType()
  const d = constructorDeclaration(f)
  const [a] = lt.declaration(d)
  const e = constructorDecorator()
  eq(a, e)
})

test("declaration(): creates tokens for the event declaration", () => {
  const f = functionType()
  const d = eventDeclaration(f)
  const [a] = lt.declaration(d)
  const e = eventDecorator()
  eq(a, e)
})

test("declaration(): creates tokens for the method declaration", () => {
  const f = functionType()
  const d = methodDeclaration(f)
  const [a] = lt.declaration(d)
  const e = methodDecorator()
  eq(a, e)
})

test("declaration(): creates tokens for the property declaration", () => {
  const v = anyValue("")
  const d = propertyDeclaration(v)
  const [a] = lt.declaration(d)
  const e = propertyDecorator()
  eq(a, e)
})

test("declaration(): creates tokens for the type declaration", () => {
  const t = anyType()
  const d = typeDeclaration(t)
  const [a] = lt.declaration(d)
  const e = anyDecorator()
  eq(a, e)
})

test("declaration(): creates an empty array for an unsupported declaration", () => {
  // @ts-expect-error
  const a = lt.declaration({})
  eq(a, [])
})

function classKeyword(): Tokenizer.KeywordToken {
  return keywordToken("class")
}

function constructorDecorator(): Tokenizer.DecoratorToken {
  return decoratorToken("constructor")
}

function eventDecorator(): Tokenizer.DecoratorToken {
  return decoratorToken("(event)")
}

function methodDecorator(): Tokenizer.DecoratorToken {
  return decoratorToken("(method)")
}

function propertyDecorator(): Tokenizer.DecoratorToken {
  return decoratorToken("(property)")
}

function anyDecorator(): Tokenizer.DecoratorToken {
  return decoratorToken("(any)")
}

function dotText(): Tokenizer.TextToken {
  return textToken(".")
}

function spaceText(): Tokenizer.TextToken {
  return textToken(" ")
}

function equalsText(): Tokenizer.TextToken {
  return textToken(" = ")
}

function leftCurlyText(): Tokenizer.TextToken {
  return textToken("(")
}

function rightCurlyText(): Tokenizer.TextToken {
  return textToken(")")
}

function unionText(): Tokenizer.TextToken {
  return textToken(" | ")
}

function arrayText(): Tokenizer.TextToken {
  return textToken("[]")
}

function colonText(): Tokenizer.TextToken {
  return textToken(": ")
}

function commaText(): Tokenizer.TextToken {
  return textToken(", ")
}

function anyText(): Tokenizer.TextToken {
  return textToken("any")
}

function objectText(): Tokenizer.TextToken {
  return textToken("object")
}

function unknownText(): Tokenizer.TextToken {
  return textToken("unknown")
}

function voidText(): Tokenizer.TextToken {
  return textToken("void")
}

function decoratorToken(s: string): Tokenizer.DecoratorToken {
  const n = tokenizer.tokenNode()
  const t = tokenizer.decoratorToken(n)
  t.text = s
  return t
}

function identifierToken(id: string): Tokenizer.IdentifierToken {
  const n = tokenizer.tokenNode()
  const t = tokenizer.identifierToken(n)
  t.text = id
  return t
}

function keywordToken(s: string): Tokenizer.KeywordToken {
  const n = tokenizer.tokenNode()
  const t = tokenizer.keywordToken(n)
  t.text = s
  return t
}

function textToken(s: string): Tokenizer.TextToken {
  const n = tokenizer.tokenNode()
  const t = tokenizer.textToken(n)
  t.text = s
  return t
}

function referenceToken(id: string): Tokenizer.ReferenceToken {
  const n = tokenizer.tokenNode()
  const t = tokenizer.referenceToken(n)
  t.id = id
  return t
}

function classDeclaration(): Library.ClassDeclaration {
  const n = library.declarationNode()
  return library.classDeclaration(n)
}

function constructorDeclaration(t: Library.FunctionType): Library.ConstructorDeclaration {
  const n = library.declarationNode()
  return library.constructDeclaration(t, n)
}

function eventDeclaration(t: Library.FunctionType): Library.EventDeclaration {
  const n = library.declarationNode()
  return library.eventDeclaration(t, n)
}

function methodDeclaration(t: Library.FunctionType): Library.MethodDeclaration {
  const n = library.declarationNode()
  return library.methodDeclaration(t, n)
}

function propertyDeclaration(v: Library.Value): Library.PropertyDeclaration {
  const n = library.declarationNode()
  return library.propertyDeclaration(v, n)
}

function typeDeclaration(t: Library.Type): Library.TypeDeclaration {
  const n = library.declarationNode()
  return library.typeDeclaration(t, n)
}

function anyReturns(): Library.FunctionReturns {
  const t = anyType()
  return library.functionReturns(t)
}

function anyValue(id: string): Library.Value {
  const t = anyType()
  const v = library.value(t)
  v.identifier = id
  return v
}

function anyType(): Library.AnyType {
  const n = library.typeNode()
  return library.anyType(n)
}

function arrayType(): Library.ArrayType {
  const n = library.typeNode()
  return library.arrayType(n)
}

function functionType(): Library.FunctionType {
  const n = library.typeNode()
  return library.functionType(n)
}

function literalType(v: unknown): Library.LiteralType {
  const n = library.typeNode()
  return library.literalType(n, v)
}

function objectType(): Library.ObjectType {
  const n = library.typeNode()
  return library.objectType(n)
}

function passthroughType(v: unknown): Library.PassthroughType {
  const n = library.typeNode()
  return library.passthroughType(n, v)
}

function unionType(): Library.UnionType {
  const n = library.typeNode()
  return library.unionType(n)
}

function unknownType(): Library.UnknownType {
  const n = library.typeNode()
  return library.unknownType(n)
}

function voidType(): Library.VoidType {
  const n = library.typeNode()
  return library.voidType(n)
}

test.run()
