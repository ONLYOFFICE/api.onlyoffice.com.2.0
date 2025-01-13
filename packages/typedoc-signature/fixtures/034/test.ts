import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  Reference,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a interface with two index signatures"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 2

t = new KeywordToken()
t.text = "interface"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "I"
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
t.text = "p0"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "{"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new ParameterToken()
t.text = "p00"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "{"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "      "
s.push(t)

t = new TextToken()
t.text = "["
s.push(t)

t = new ParameterToken()
t.text = "key"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = "]"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new ParameterToken()
t.text = "p01"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "{"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "      "
s.push(t)

t = new TextToken()
t.text = "["
s.push(t)

t = new ParameterToken()
t.text = "key"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "]"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new TextToken()
t.text = "}"
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
