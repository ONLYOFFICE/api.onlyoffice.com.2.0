import {
  isElement,
  isH1Element,
  isH2Element,
  isH3Element,
  isH4Element,
  isH5Element,
  isH6Element,
} from "@onlyoffice/hast-util-is-element"
import {type Doctype, type Root, type RootContent} from "hast"
import {h} from "hastscript"

export interface RehypeSectionTransform {
  (tree: Root): void
}

export function rehypeSection(): RehypeSectionTransform {
  return function transform(t) {
    const w = h("div")

    let c = h("section")
    w.children.push(c)

    for (const n of t.children) {
      if (isDoctype(n)) {
        throw new Error("The root element contains a doctype where it is not expected")
      }

      if (
        isH1Element(n) ||
        isH2Element(n) ||
        isH3Element(n) ||
        isH4Element(n) ||
        isH5Element(n) ||
        isH6Element(n)
      ) {
        c = h("section")

        if ("id" in n.properties && typeof n.properties.id === "string") {
          c.properties["aria-labelledby"] = n.properties.id
        }

        w.children.push(c)
      }

      c.children.push(n)
    }

    const [s] = w.children
    if (isElement(s) && s.children.length === 0) {
      w.children.shift()
    }

    return {...t, children: w.children}
  }
}

function isDoctype(u: RootContent): u is Doctype {
  return u.type === "doctype"
}
