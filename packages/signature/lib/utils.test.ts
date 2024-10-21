import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  KeywordToken,
  NoopToken,
  Reference,
  type Signature,
  TextToken,
  type Token,
} from "./main.ts"
import {normalize} from "./utils.ts"

test("normalize: merges adjacent tokens", () => {
  let a: Signature = []
  let t: Token

  t = new KeywordToken()
  t.text = "a"
  a.push(t)

  t = new TextToken()
  t.text = "b"
  a.push(t)

  t = new TextToken()
  t.text = "c"
  a.push(t)

  t = new KeywordToken()
  t.text = "d"
  a.push(t)

  a = normalize(a)

  const e: Signature = []

  t = new KeywordToken()
  t.text = "a"
  e.push(t)

  t = new TextToken()
  t.text = "bc"
  e.push(t)

  t = new KeywordToken()
  t.text = "d"
  e.push(t)

  eq(a, e)
})

test("normalize: removes noop tokens", () => {
  let a: Signature = []
  let t: Token

  t = new KeywordToken()
  t.text = "a"
  a.push(t)

  t = new NoopToken()
  a.push(t)

  t = new TextToken()
  t.text = "b"
  a.push(t)

  a = normalize(a)

  const e: Signature = []

  t = new KeywordToken()
  t.text = "a"
  e.push(t)

  t = new TextToken()
  t.text = "b"
  e.push(t)

  eq(a, e)
})

test("normalize: removes references with noop tokens", () => {
  let a: Signature = []
  let t: Token

  t = new KeywordToken()
  t.text = "a"
  a.push(t)

  const r = new Reference()
  r.token = new NoopToken()
  a.push(r)

  t = new TextToken()
  t.text = "b"
  a.push(t)

  a = normalize(a)

  const e: Signature = []

  t = new KeywordToken()
  t.text = "a"
  e.push(t)

  t = new TextToken()
  t.text = "b"
  e.push(t)

  eq(a, e)
})

test.run()
