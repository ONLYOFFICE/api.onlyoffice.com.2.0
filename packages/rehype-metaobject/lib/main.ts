import {type Metaobject, type Root} from "hast"
import {visit} from "unist-util-visit"
import {parse} from "./internal.ts"

declare module "hast" {
  interface Properties {
    metaobject?: Metaobject
  }

  interface Metaobject {}
}

export interface RehypeMetaobjectTransform {
  (tree: Root): void
}

export function rehypeMetaobject(): RehypeMetaobjectTransform {
  return function transform(t) {
    visit(t, "element", (n) => {
      const p = n.properties
      if (n.tagName === "code" && p.metastring) {
        p.metaobject = parse(p.metastring) as Metaobject
      }
    })
  }
}
