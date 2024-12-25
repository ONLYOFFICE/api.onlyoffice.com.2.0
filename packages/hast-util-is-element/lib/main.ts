// This package is a simplified version of the [hast-util-is-element] package.
//
// hast-util-is-element: https://github.com/syntax-tree/hast-util-is-element/

import type * as E from "@onlyoffice/hastscript/elements.js"
import {type Element} from "hast"

export function isAElement(u: unknown): u is E.AElement {
  return isElement(u) && u.tagName === "a"
}

export function isButtonElement(u: unknown): u is E.ButtonElement {
  return isElement(u) && u.tagName === "button"
}

export function isCodeElement(u: unknown): u is E.CodeElement {
  return isElement(u) && u.tagName === "code"
}

export function isDdElement(u: unknown): u is E.DdElement {
  return isElement(u) && u.tagName === "dd"
}

export function isDivElement(u: unknown): u is E.DivElement {
  return isElement(u) && u.tagName === "div"
}

export function isDlElement(u: unknown): u is E.DlElement {
  return isElement(u) && u.tagName === "dl"
}

export function isDtElement(u: unknown): u is E.DtElement {
  return isElement(u) && u.tagName === "dt"
}

export function isFooterElement(u: unknown): u is E.FooterElement {
  return isElement(u) && u.tagName === "footer"
}

export function isH2Element(u: unknown): u is E.H2Element {
  return isElement(u) && u.tagName === "h2"
}

export function isHeaderElement(u: unknown): u is E.HeaderElement {
  return isElement(u) && u.tagName === "header"
}

export function isLiElement(u: unknown): u is E.LiElement {
  return isElement(u) && u.tagName === "li"
}

export function isNavElement(u: unknown): u is E.NavElement {
  return isElement(u) && u.tagName === "nav"
}

export function isPElement(u: unknown): u is E.PElement {
  return isElement(u) && u.tagName === "p"
}

export function isPreElement(u: unknown): u is E.PreElement {
  return isElement(u) && u.tagName === "pre"
}

export function isSpanElement(u: unknown): u is E.SpanElement {
  return isElement(u) && u.tagName === "span"
}

export function isTemplateElement(u: unknown): u is E.TemplateElement {
  return isElement(u) && u.tagName === "template"
}

export function isUlElement(u: unknown): u is E.UlElement {
  return isElement(u) && u.tagName === "ul"
}

export function isElement(u: unknown): u is Element {
  return Boolean(
    u &&
    typeof u === "object" &&
    "type" in u &&
    u.type === "element" &&
    "tagName" in u &&
    typeof u.tagName === "string",
  )
}
