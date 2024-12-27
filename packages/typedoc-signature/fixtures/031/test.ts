import {
  DeclarationEntity,
  Fragment,
} from "@onlyoffice/library-declaration/next.js"
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

export const name = "computing the signature for a generics in method"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
const e1 = new DeclarationEntity()
const f0 = new Fragment()
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
t.text = "m"
s.push(t)

t = new TextToken()
t.text = "<"
s.push(t)

t = new TypeToken()
t.text = "T"
s.push(t)

t = new TextToken()
t.text = ">"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new ParameterToken()
t.text = "p"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "T"
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "void"
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

e1.id = 4

f0.name = "p"

t = new TypeToken()
t.text = "T"
s.push(t)

f0.signature.concise.push(...s)
s = []

e1.declaration.parameters.push(f0)

t = new EntityToken()
t.text = "m"
s.push(t)

t = new TextToken()
t.text = "<"
s.push(t)

t = new TypeToken()
t.text = "T"
s.push(t)

t = new TextToken()
t.text = ">"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new ParameterToken()
t.text = "p"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "T"
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "void"
s.push(t)

e1.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "("
s.push(t)

t = new TextToken()
t.text = "p"
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "void"
s.push(t)

e1.declaration.signature.concise.push(...s)
s = []

t = new TypeToken()
t.text = "void"
s.push(t)

e1.declaration.returns.signature.concise.push(...s)
s = []

collection.push(e1)
