import {
  DeclarationEntity,
  Fragment,
} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name = "computing the signature for a function with generics"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
const f0 = new Fragment()
let s: Signature = []
let t: Token

e0.id = 2

f0.name = "v"

t = new TypeToken()
t.text = "Type"
s.push(t)

f0.signature.concise.push(...s)
s = []

e0.declaration.parameters.push(f0)

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
t.text = "<"
s.push(t)

t = new TypeToken()
t.text = "Type"
s.push(t)

t = new TextToken()
t.text = ">"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new ParameterToken()
t.text = "v"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "Type"
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "Type"
s.push(t)

e0.declaration.signature.verbose.push(...s)
s = []

t = new TextToken()
t.text = "<"
s.push(t)

t = new TypeToken()
t.text = "Type"
s.push(t)

t = new TextToken()
t.text = ">"
s.push(t)

t = new TextToken()
t.text = "("
s.push(t)

t = new TextToken()
t.text = "v"
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "Type"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

t = new TypeToken()
t.text = "Type"
s.push(t)

e0.declaration.returns.signature.concise.push(...s)
s = []

collection.push(e0)
