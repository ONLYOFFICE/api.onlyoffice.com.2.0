import Color from "color"
import {getProperty} from "dot-prop"
import yaml from "yaml"

export interface InputColors {
  [k: string]: InputTheme
}

export class Colors {
  [k: string]: Theme

  static fromJson(data: string): Colors {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Colors {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ic: InputColors): Colors {
    const c = new Colors()
    c.regular = Theme.fromInput(ic.regular)
    return c
  }

  static toStyles(c: Colors): string {
    let s = ""
    for (const k in c) {
      const t = c[k]
      s += Theme.toStyles(k, t)
      s += "\n\n"
    }
    // Keeps a single empty line at the end.
    s = s.slice(0, -1)
    return s
  }
}

export interface InputTheme {
  [k: string]: InputVariant
}

export class Theme {
  [k: string]: Variant

  static fromJson(data: string): Theme {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Theme {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(it: InputTheme): Theme {
    const t = new Theme()
    for (const k in it) {
      t[k] = Variant.fromInput(it[k])
    }
    return t
  }

  static toStyles(k: string, t: Theme): string {
    let s = ""
    for (const vk in t) {
      const v = Variant.toStyles(vk, t[vk])
      s += `[data-${vk}-theme="${k}"][data-theme-preference="${vk}"] {\n`
      s += indent(v, 2, " ")
      s += "}\n\n"
      s += `@media (prefers-color-scheme: ${vk}) {\n`
      s += `  [data-${vk}-theme="${k}"][data-theme-preference="auto"] {\n`
      s += indent(v, 4, " ")
      s += "  }\n"
      s += "}\n\n"
    }
    s = s.slice(0, -2)
    return s
  }
}

export interface InputVariant {
  [k: string]: InputComponent
}

export class Variant {
  [k: string]: Component

  static fromJson(data: string): Variant {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(iv: InputVariant): Variant {
    const v = new Variant()
    for (const k in iv) {
      v[k] = Component.fromInput(iv[k])
    }
    return v
  }

  static toStyles(k: string, v: Variant): string {
    let s = ""
    s += `color-scheme: ${k};\n\n`
    for (const k in v) {
      const c = v[k]
      s += Component.toStyles(v, k, c)
      s += "\n"
    }
    s = s.slice(0, -1)
    return s
  }
}

export interface InputComponent {
  [k: string]: string | string[] | InputComponent
}

export class Component {
  [k: string]: string | string[] | Component

  static fromJson(data: string): Component {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Component {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ic: InputComponent): Component {
    const c = new Component()
    for (const k in ic) {
      const v = ic[k]
      if (Array.isArray(v)) {
        c[k] = v
        continue
      }
      if (typeof v === "object") {
        c[k] = Component.fromInput(v)
        continue
      }
      c[k] = ic[k]
    }
    return c
  }

  static toStyles(v: Variant, k: string, c: Component): string {
    let s = ""
    for (const ck in c) {
      const cv = c[ck]
      if (Array.isArray(cv)) {
        for (const [i, p] of cv.entries()) {
          const h = value(v, p)
          s += `--color-${k}-${ck}-${i}: ${h};\n`
        }
        continue
      }
      if (cv instanceof Component) {
        s += Component.toStyles(v, `${k}-${ck}`, cv)
        continue
      }
      const h = value(v, cv)
      s += `--color-${k}-${ck}: ${h};\n`
    }
    return s

    function value(v: Variant, s: string): string {
      try {
        const h = Color(s)
        return h.hsl().toString()
      } catch {
        const p = getProperty(v, s)
        if (!p) {
          throw new Error(`Property '${s}' not found in variant`)
        }
        const n = s.replaceAll(/\.|\[/g, "-").replaceAll("]", "")
        return `var(--color-${n})`
      }
    }
  }
}

function indent(s: string, n: number, c: string): string {
  const a = s.split("\n")
  const b: string[] = []
  for (let l of a) {
    if (l.length !== 0) {
      const p = c.repeat(n)
      l = p + l
    }
    b.push(l)
  }
  return b.join("\n")
}
