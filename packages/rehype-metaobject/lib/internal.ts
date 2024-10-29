import JSON5 from "json5"

export function metaobject(s: string): object {
  // It is problematic to use the unknown type here.
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  const r: Record<string, any> = {}

  let i = 0

  while (i < s.length) {
    let t = r

    while (i < s.length && s[i] === " ") {
      i += 1
    }

    const j = i

    while (i < s.length && s[i] !== "=" && s[i] !== " ") {
      i += 1
    }

    const k = s.slice(j, i)

    let v: unknown = ""

    const a = k.split(".")

    for (const [j, p] of a.entries()) {
      if (j !== a.length - 1) {
        let o = t[p]
        if (!o) {
          o = {}
          t[p] = o
        }
        t = o
        continue
      }

      if (s[i] === "=") {
        i += 1

        const j = i

        if (i >= s.length || s[i] === " ") {
          // do nothing
        } else if (s[i] === "{" || s[i] === "[") {
          const o = s[i]

          let c = ""
          if (o === "{") {
            c = "}"
          } else {
            c = "]"
          }

          let n = 1

          i += 1

          while (n > 0 && i < s.length) {
            if (s[i] === o) {
              n += 1
            } else if (s[i] === c) {
              n -= 1
            }
            i += 1
          }
        } else {
          while (i < s.length && s[i] !== " ") {
            i += 1
          }
        }

        if (j !== i) {
          const r = s.slice(j, i)
          v = JSON5.parse(r)
        }
      }

      t[p] = v
    }
  }

  return r
}
