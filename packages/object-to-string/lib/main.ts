export function toString(o: unknown, d: number = 2): string {
  return un(o, 1)

  function un(o: unknown, l: number): string {
    if (Array.isArray(o)) {
      return ar(o, l)
    }
    if (typeof o === "object" && o !== null) {
      return ob(o, l)
    }
    if (typeof o === "string") {
      return st(o)
    }
    return String(o)
  }

  function ar(a: unknown[], l: number): string {
    if (a.length === 0) {
      return "[]"
    }

    let s = "[\n"

    for (const e of a) {
      s += " ".repeat(d * l)
      s += un(e, l + 1)
      s += ",\n"
    }

    s = s.slice(0, -2)
    s += "\n"
    s += " ".repeat(d * (l - 1))
    s += "]"

    return s
  }

  function ob(o: object, l: number): string {
    let p = ""

    for (const k in o) {
      const r = o as Record<string, unknown>
      const s = " ".repeat(d * l)
      const v = un(r[k], l + 1)
      p += `${s}${k}: ${v},\n`
    }

    if (p.length === 0) {
      return "{}"
    }

    let s = "{\n"
    s += p.slice(0, -2)
    s += "\n"
    s += " ".repeat(d * (l - 1))
    s += "}"

    return s
  }

  function st(s: string): string {
    if (!s.includes('"')) {
      return `"${s}"`
    }
    if (!s.includes("'")) {
      return `'${s}'`
    }
    return `\`${s}\``
  }
}
