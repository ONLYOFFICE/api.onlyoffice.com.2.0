import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  type Signature,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a enum"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token

e0.id = 2

t = new KeywordToken()
t.text = "enum"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "E"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new TextToken()
t.text = "{"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "A"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new TypeToken()
t.text = "0"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "B"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new StringToken()
t.text = '"b"'
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "C"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new TypeToken()
t.text = "0"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "E"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "F"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = ""
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

e0.declaration.signature.verbose.push(...s)

collection.push(e0)
