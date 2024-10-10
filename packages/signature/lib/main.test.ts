import {test} from "uvu"
import {equal as eq, is} from "uvu/assert"
import {
  EntityToken,
  KeywordToken,
  NoopToken,
  ParameterToken,
  Reference,
  StringToken,
  TextToken,
  TypeToken,
} from "./main.ts"

test("Reference: initializes an empty instance", () => {
  const r = new Reference()
  const k = Object.keys(r)
  eq(k, ["id", "token"])
  is(r.id, "")
  eq(r.token, new NoopToken())
})

test("TypeToken: initializes an empty instance", () => {
  const t = new TypeToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "type")
  is(t.text, "")
})

test("TextToken: initializes an empty instance", () => {
  const t = new TextToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "text")
  is(t.text, "")
})

test("StringToken: initializes an empty instance", () => {
  const t = new StringToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "string")
  is(t.text, "")
})

test("ParameterToken: initializes an empty instance", () => {
  const t = new ParameterToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "parameter")
  is(t.text, "")
})

test("NoopToken: initializes an empty instance", () => {
  const t = new NoopToken()
  const k = Object.keys(t)
  eq(k, ["type"])
  is(t.type, "noop")
})

test("KeywordToken: initializes an empty instance", () => {
  const t = new KeywordToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "keyword")
  is(t.text, "")
})

test("EntityToken: initializes an empty instance", () => {
  const t = new EntityToken()
  const k = Object.keys(t)
  eq(k, ["type", "text"])
  is(t.type, "entity")
  is(t.text, "")
})

test.run()
