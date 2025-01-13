import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  type Signature,
  TextToken,
  type Token,
} from "@onlyoffice/signature"

export const name = "computing the signature for class"
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
t.text = "}"
s.push(t)

e0.declaration.signature.verbose.push(...s)

collection.push(e0)
