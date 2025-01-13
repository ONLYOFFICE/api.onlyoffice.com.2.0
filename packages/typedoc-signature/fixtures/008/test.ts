import {DeclarationEntity} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  ParameterToken,
  type Signature,
  TextToken,
  type Token,
  TypeToken,
} from "@onlyoffice/signature"

export const name =
  "computing the signature for functions with a returned value type - object"
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
t.text = "r0"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "  "
s.push(t)

t = new ParameterToken()
t.text = "r1"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "number"
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
t.text = "("
s.push(t)

t = new TextToken()
t.text = ")"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "{"
s.push(t)

t = new ParameterToken()
t.text = "r0"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "; "
s.push(t)

t = new ParameterToken()
t.text = "r1"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

e0.declaration.signature.concise.push(...s)
s = []

t = new TextToken()
t.text = "{"
s.push(t)

t = new ParameterToken()
t.text = "r0"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "string"
s.push(t)

t = new TextToken()
t.text = "; "
s.push(t)

t = new ParameterToken()
t.text = "r1"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TypeToken()
t.text = "number"
s.push(t)

t = new TextToken()
t.text = "}"
s.push(t)

e0.declaration.returns.signature.concise.push(...s)
s = []

collection.push(e0)
