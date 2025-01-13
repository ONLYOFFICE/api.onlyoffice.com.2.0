import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a class with flags on the properties (private, protected, public, static, private static)"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token

e0.id = 2

t = new KeywordToken()
t.text = "class"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "C"
s.push(t)

t = new TextToken()
t.text = " {"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new KeywordToken()
t.text = "constructor"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new KeywordToken()
t.text = "protected"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new ParameterToken()
t.text = "p1"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new KeywordToken()
t.text = "public"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new ParameterToken()
t.text = "p2"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new KeywordToken()
t.text = "static"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new ParameterToken()
t.text = "p3"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

e0.declaration.signature.verbose.push(...s)

collection.push(e0)
