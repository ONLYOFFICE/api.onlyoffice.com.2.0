import {isHeadingNode, isParentNode} from "@onlyoffice/mdast-util-is-node"
import {type Node, type Root, type RootContent} from "mdast"
import {toString} from "mdast-util-to-string"

export function extractSection(h: string, n: Node): Root {
  const r: Root = {type: "root", children: []}

  if (!h || !isParentNode(n)) {
    return r
  }

  h = h.trim().toLocaleLowerCase()

  const a: RootContent[] = []

  let f: -1 | 0 | 1 = -1

  for (const c of n.children) {
    if (isHeadingNode(c) && c.depth === 2 && f === 0) {
      f = 1
    }

    if (isHeadingNode(c) && c.depth === 2 && f === -1) {
      const s = toString(c).toLocaleLowerCase()

      if (s === h) {
        f = 0
        continue
      }
    }

    if (f === 0) {
      r.children.push(c)
      continue
    }

    a.push(c)
  }

  n.children = a

  return r
}
