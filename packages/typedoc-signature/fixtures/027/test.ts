import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  Reference,
  type Signature,
  StringToken,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a template literal type"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 3

t = new KeywordToken()
t.text = "type"
s.push(t)

t = new TextToken()
t.text = " "
s.push(t)

t = new EntityToken()
t.text = "t1"
s.push(t)

t = new TextToken()
t.text = " = "
s.push(t)

t = new StringToken()
t.text = "`"
s.push(t)

t = new StringToken()
t.text = "s0 "
s.push(t)

t = new TextToken()
t.text = "${"
s.push(t)

t = new Reference()
t.id = "2"
t.token = new TypeToken()
t.token.text = "t0"
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

t = new StringToken()
t.text = " s1"
s.push(t)

t = new StringToken()
t.text = "`"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "  "
s.push(t)

t = new Reference()
t.id = "3"
t.token = new TypeToken()
t.token.text = "t1"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

collection.push(e0)
