import { DeclarationEntity } from "@onlyoffice/library-declaration/next.js"
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

export const name = "computing the signature for an interface with a parameter with a string length of more than 100 characters and whose types are Reference"
export const collection: DeclarationEntity[] = []

const e0 = new DeclarationEntity()
let s: Signature = []
let t: Token | Reference

e0.id = 5

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
t.text = "p0"
s.push(t)

t = new TextToken()
t.text = ": "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "3"
t.token = new TypeToken()
t.token.text = "FirstInterface"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "8"
t.token = new TypeToken()
t.token.text = "SecondInterface"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "10"
t.token = new TypeToken()
t.token.text = "ThirdInterface"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "4"
t.token = new TypeToken()
t.token.text = "FourthInterface"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "2"
t.token = new TypeToken()
t.token.text = "FifthInterface"
s.push(t)

t = new TextToken()
t.text = " | "
s.push(t)

t = new TextToken()
t.text = "\n"
s.push(t)

t = new TextToken()
t.text = "    "
s.push(t)

t = new Reference()
t.id = "9"
t.token = new TypeToken()
t.token.text = "SixthInterface"
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

collection.push(e0)
