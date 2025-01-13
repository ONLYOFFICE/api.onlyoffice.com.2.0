import {
  isHtmlNode,
  isLiteralNode,
  isParagraphNode,
  isParentNode,
} from "@onlyoffice/mdast-util-is-node"
import {
  type Node,
  type Parent,
  type Root,
  type RootContent,
  type Text,
} from "mdast"
import {toString} from "mdast-util-to-string"
import {split} from "sentence-splitter"
import {English} from "sentence-splitter/lang"

export function firstSentence(n: Node): Root {
  const r: Root = {type: "root", children: []}
  if (!isParentNode(n) || n.children.length === 0) {
    return r
  }

  const [c] = n.children
  if (!isParagraphNode(c) || c.children.length === 0) {
    return r
  }

  const t = toString(c, {includeHtml: false, includeImageAlt: false})
  if (!t) {
    return r
  }

  const e = split(t, {AbbrMarker: {language: English}})
  if (e.length === 0) {
    return r
  }

  append({s: e[0].raw}, r, c)
  return r
}

function append(c: {s: string}, r: Parent, n: unknown): void {
  // This function implements the same logic as 'mdast-util-to-string'.
  // Without type casting (as) it is problematic in here.

  if (isHtmlNode(n)) {
    return
  }

  if (isLiteralNode(n)) {
    const t = clone(n)

    if (c.s.startsWith(t.value)) {
      c.s = c.s.slice(t.value.length)
    } else {
      const i = Math.max(0, c.s.length)
      t.value = t.value.slice(0, i + 1).trimEnd()
      c.s = ""
    }

    if (!c.s && !t.value.endsWith(".")) {
      const d: Text = {type: "text", value: "."}
      r.children.push(t as RootContent, d)
    } else {
      r.children.push(t as RootContent)
    }

    return
  }

  if (isParentNode(n)) {
    const t = clone(n)

    for (const u of n.children) {
      append(c, t, u)
      if (!c.s) {
        break
      }
    }

    if (t.children.length !== 0) {
      r.children.push(t as RootContent)
    }
  }
}

function clone<N extends Node>(n: N): N {
  if (!isParentNode(n)) {
    const c = structuredClone(n)
    delete c.position
    return c
  }
  const a = n.children
  n.children = []
  const c = structuredClone(n)
  n.children = a
  delete c.position
  return c
}
