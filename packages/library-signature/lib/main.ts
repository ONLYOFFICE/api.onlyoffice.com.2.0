import {type Declaration, type Type} from "@onlyoffice/library-declaration"
import {type Signature} from "@onlyoffice/signature"
import {normalize} from "@onlyoffice/signature/utils.ts"
import * as description from "./internal/description.ts"
import * as summary from "./internal/summary.ts"

export interface ComputeCallback {
  (this: void, s: Signature): void
}

export function computeDeclaration(d: Declaration, cb: ComputeCallback): void {
  if ("type" in d) {
    computeType(d.type, cb)
  }

  let s = description.declaration(d)
  s = normalize(s)
  cb(s)

  if (s.length !== 0) {
    d.signature = s
  }

  s = summary.declaration(d)
  s = normalize(s)
  cb(s)

  if (s.length !== 0) {
    let o = d.summary
    if (!o) {
      o = {}
      d.summary = o
    }
    o.signature = s
  }
}

export function computeType(u: Type, cb: ComputeCallback): void {
  if ("id" in u) {
    return
  }

  if (u.type === "function") {
    if (u.parameters) {
      for (const p of u.parameters) {
        let s = description.type(p.type)
        s = normalize(s)
        cb(s)

        if (s.length !== 0) {
          p.signature = s
        }
      }
    }

    if (u.returns) {
      let s = description.type(u.returns.type)
      s = normalize(s)
      cb(s)

      if (s.length !== 0) {
        u.returns.signature = s
      }
    }
  }
}
