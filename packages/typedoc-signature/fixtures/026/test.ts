import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  type Reference,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a variable with type tuple"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 2

t = new KeywordToken()
t.text = "const"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "v"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "["
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TypeToken()
t.text = "boolean"
s.push(t)

t = new TextToken()
t.text = "]"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new TextToken()
t.text = "["
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = ", "
s.push(t)

t = new TypeToken()
t.text = "boolean"
s.push(t)

t = new TextToken()
t.text = "]"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
