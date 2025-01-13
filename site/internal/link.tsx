import path from "node:path"
import {URL} from "node:url"
import {rootDir} from "@onlyoffice/eleventy-env"
import * as pate from "@onlyoffice/node-path"
import {cutPrefix, cutSuffix} from "@onlyoffice/strings"
import {type Root} from "hast"
import {type JSX, h} from "preact"
import {type HTMLAttributes} from "preact/compat"
import {visit} from "unist-util-visit"
import {type VFile} from "vfile"
import {Sitemap} from "./sitemap.ts"

export interface LinkProperties extends HTMLAttributes<HTMLAnchorElement> {
  file?: string
}

export function Link(p: LinkProperties): JSX.Element {
  p = {...p}
  if (!p.file) {
    p.file = ""
  }

  if (p.href === undefined) {
    throw new Error("The 'href' attribute is required, but missing.")
  }
  if (typeof p.href !== "string") {
    throw new TypeError("The 'href' attribute must be a string.")
  }

  p.href = resolveLink(p.file, p.href)

  return <a {...p} />
}

export interface RehypeLinkTransform {
  (tree: Root, file: VFile): void
}

export function rehypeLink(): RehypeLinkTransform {
  return function transform(t, f) {
    visit(t, "element", (n) => {
      if (n.tagName !== "a") {
        return
      }

      const p = n.properties

      if (p.href === undefined) {
        throw new Error("The 'href' attribute is required, but missing.")
      }
      if (typeof p.href !== "string") {
        throw new TypeError("The 'href' attribute must be a string.")
      }

      n.properties.href = resolveLink(f.path, p.href)
    })
  }
}

export function resolveLink(a: string, b: string): string {
  const s = Sitemap.shared

  if (URL.canParse(b)) {
    return b
  }

  const h = pate.hash(b)
  if (h === b) {
    return b
  }

  let p = b

  if (!path.isAbsolute(b)) {
    if (!a) {
      throw new Error("The 'a' is required when the 'b' is relative.")
    }
    p = path.dirname(a)
    p = pate.resolve(p, b)
    ;[p] = cutPrefix(p, rootDir())
    ;[p] = cutSuffix(p, h)
  }

  p = decodeURIComponent(`.${p}`)

  const e = s.findPageByPath(p)

  return `${e.canonicalUrl}${h}`
}
