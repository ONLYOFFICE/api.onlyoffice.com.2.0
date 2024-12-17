import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  Reference,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a alias type"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 2

t = new KeywordToken()
t.text = "type"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "T"
s.push(t)

t = new TextToken()
t.text = " = "
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
t.text = " | "
s.push(t)

t = new TypeToken()
t.text = "boolean"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new Reference()
t.id = "2"
t.token = new TypeToken()
t.token.text = "T"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
