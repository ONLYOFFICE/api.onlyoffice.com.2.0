import {NoopToken, Reference, type Signature, TextToken, type Token} from "@onlyoffice/signature"
import {IndentToken, NewlineToken} from "./tokens.ts"

export class Formatter {
  i = " "
  l = 100
  n = "\n"

  preprocess(s: Signature): Signature {
    let l = 0
    let f = false // has a formatted signature in the child elements

    for (const t of s) {
      if (t instanceof NewlineToken || t instanceof IndentToken) {
        if (t.processed) {
          f = true
          break
        }
        t.processed = true
      } else {
        let ct: Token
        if (t instanceof Reference) {
          ct = t.token
        } else {
          ct = t
        }
        if (!(ct instanceof Reference || ct instanceof NoopToken)) {
          l += ct.text.length
        }
      }
    }

    // if the length is less than 100 and there are no newlines in the signature of the child elements
    // remove indents and newlines
    if (l < this.l && !f) {
      const ts: Signature = []

      for (const t of s) {
        if (!(t instanceof NewlineToken || t instanceof IndentToken)) {
          ts.push(t)
        }
      }

      return ts
    }
    return s
  }

  format(s: Signature): Signature {
    const ts: Signature = []
    let t: Token

    for (const e of s) {
      if (e instanceof NewlineToken || e instanceof IndentToken) {
        t = new TextToken()
        if (e instanceof NewlineToken) {
          t.text = this.n
        }
        if (e instanceof IndentToken) {
          t.text = this.i.repeat(e.indent)
        }
        ts.push(t)
      } else {
        ts.push(e)
      }
    }

    return ts
  }
}
