import {NoopToken, Reference, type Signature, type Token} from "./main.ts"

export function normalize(s: Signature): Signature {
  const r: Signature = []

  let c: Token | undefined

  for (const t of s) {
    if (
      t instanceof NoopToken ||
      t instanceof Reference && t.token instanceof NoopToken
    ) {
      continue
    }

    if (c && !(t instanceof Reference) && c.type === t.type) {
      c.text += t.text
      continue
    }

    if (c) {
      r.push(c)
    }

    if (t instanceof Reference) {
      r.push(t)
      c = undefined
      continue
    }

    c = t
  }

  if (c) {
    r.push(c)
  }

  return r
}
