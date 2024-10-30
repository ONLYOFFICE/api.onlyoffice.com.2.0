import {type Root} from "hast"
import {visit} from "unist-util-visit"

export interface RehypeCleanTransform {
  (tree: Root): void
}

export function rehypeClean(): RehypeCleanTransform {
  return function transform(t) {
    visit(t, "element", (n) => {
      if (n.tagName !== "code") {
        return
      }

      const p = n.properties

      if (p.className && Array.isArray(p.className)) {
        const a: (string | number)[] = []
        for (const c of p.className) {
          if (typeof c === "string" && c.startsWith("language-")) {
            continue
          }
          a.push(c)
        }
        if (a.length === 0) {
          delete p.className
        } else {
          p.className = a
        }
      }

      if (p.metastring) {
        delete p.metastring
      }

      if (p.metaobject) {
        delete p.metaobject
      }
    })
  }
}
