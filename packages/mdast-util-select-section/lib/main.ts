import {isHeadingNode, isParentNode} from "@onlyoffice/mdast-util-is-node"
import {type Node, type Root} from "mdast"
import {toString} from "mdast-util-to-string"

export function selectSection(h: string, n: Node): Root {
  const r: Root = {type: "root", children: []}
  if (!h || !isParentNode(n)) {
    return r
  }

  h = h.trim().toLocaleLowerCase()

  let f = false

  for (const c of n.children) {
    if (isHeadingNode(c) && c.depth === 2 && f) {
      break
    }

    if (isHeadingNode(c) && c.depth === 2) {
      const s = toString(c).toLocaleLowerCase()

      if (s === h) {
        f = true
        continue
      }
    }

    if (f) {
      r.children.push(c)
    }
  }

  return r
}
