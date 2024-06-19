import {getProperty} from "dot-prop"
import yaml from "yaml"

export interface Tree {
  [k: string]: number | string | Tree
}

export type InputSizes = Tree

export class Sizes implements Tree {
  [k: string]: number | string | Tree

  static fromJson(d: string): Sizes {
    const o = JSON.parse(d)
    return this.fromInput(o)
  }

  static fromYaml(d: string): Sizes {
    let o = yaml.parse(d)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(r: InputSizes): Sizes {
    const s = new Sizes()
    loop(s, r)
    return s

    function loop(a: Tree, b: Tree): void {
      for (const k in b) {
        const v = b[k]
        if (typeof v === "number" || typeof v === "string") {
          a[k] = v
          continue
        }
        const t: Tree = {}
        a[k] = t
        loop(t, v)
      }
    }
  }

  static toStyles(r: Sizes): string {
    let s = ":root {\n"
    s += loop(r, r)
    s += "}\n"
    return s

    function loop(a: Tree, b: Tree, h = "size"): string {
      let s = ""
      for (const k in b) {
        const p = `${h}-${k}`
        const v = b[k]
        if (typeof v === "number") {
          s += `  --${p}: ${v};\n`
          continue
        }
        if (typeof v === "string") {
          if (!getProperty(a, v)) {
            throw new Error(`Property '${v}' not found`)
          }
          const n = v.replaceAll(".", "-")
          s += `  --${p}: var(--size-${n});\n`
          continue
        }
        s += loop(a, v, `${p}`)
      }
      return s
    }
  }
}
