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

export const name = "computing the signature for a extends class"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 5

t = new KeywordToken()
t.text = "class"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "B"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new KeywordToken()
t.text = "extends"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new Reference()
t.id = "2"
t.token = new TypeToken()
t.token.text = "A"
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
t.text = "}"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new Reference()
t.id = "5"
t.token = new TypeToken()
t.token.text = "B"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
