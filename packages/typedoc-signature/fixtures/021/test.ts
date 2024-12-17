import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a 'let' variable"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token

e0.id = 2

t = new KeywordToken()
t.text = "let"
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

t = new TypeToken()
t.text = "number"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
