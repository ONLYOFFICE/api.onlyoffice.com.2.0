import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for functions with a returned value type - string"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token

e0.id = 2

t = new KeywordToken()
t.text = "function"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "f"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "("
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

t = new TypeToken()
t.text = "string"
s.push(t)

e0.declaration.returns.signature.concise.push(...s)
s = []

collection.push(e0)
