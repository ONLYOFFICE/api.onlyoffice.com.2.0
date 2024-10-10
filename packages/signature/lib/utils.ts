import {NoopToken, Reference, type Signature, type Token} from "./main.ts"

export function normalize(s: Signature): Signature {
  const r: Signature = []

  let c: Token | undefined

  for (const t of s) {
    if (t instanceof Reference) {
      r.push(t)
      continue
    }

    if (t instanceof NoopToken) {
      continue
    }

    if (c && c.type === t.type) {
      c.text += t.text
      continue
    }

    if (c) {
      r.push(c)
    }

    c = t
  }

  if (c) {
    r.push(c)
  }

  return r
}
