import {
  isH1Element,
  isH2Element,
  isH3Element,
  isH4Element,
  isH5Element,
  isH6Element,
} from "@onlyoffice/hast-util-is-element"
import {type Root} from "hast"
import {toText} from "hast-util-to-text"
import {visit} from "unist-util-visit"
import {type VFile} from "vfile"

declare module "vfile" {
  interface DataMap {
    toc: TocHeading[]
  }
}

export class TocHeading {
  level = 0
  id = ""
  text = ""
}

export interface RehypeTocTransform {
  (tree: Root, file: VFile): void
}

export function rehypeToc(): RehypeTocTransform {
  return function transform(t, f) {
    visit(t, "element", (n) => {
      if (
        !isH1Element(n) &&
        !isH2Element(n) &&
        !isH3Element(n) &&
        !isH4Element(n) &&
        !isH5Element(n) &&
        !isH6Element(n)
      ) {
        return
      }

      const h = new TocHeading()

      h.level = Number.parseInt(n.tagName.slice(1))

      if ("id" in n.properties && typeof n.properties.id === "string") {
        h.id = n.properties.id
      }

      h.text = toText(n)

      if (!f.data.toc) {
        f.data.toc = []
      }

      f.data.toc.push(h)
    })
  }
}
