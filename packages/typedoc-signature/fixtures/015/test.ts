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

export const name = "computing the signature for a interface"
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
t.text = ""
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new Reference()
t.id = "2"
t.token = new TypeToken()
t.token.text = "I"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
