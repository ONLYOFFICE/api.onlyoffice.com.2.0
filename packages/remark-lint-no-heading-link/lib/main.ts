import {
  isHeadingNode,
  isLinkNode,
  isParentNode,
} from "@onlyoffice/mdast-util-is-node"
import {type RemarkLintRule} from "@onlyoffice/remark-lint"
import {type Node} from "mdast"
import {lintRule} from "unified-lint-rule"
import {type VFile} from "vfile"

export const remarkLintNoHeadingLink: RemarkLintRule<Node> =
  lintRule("@onlyoffice:no-heading-link", rule)

function rule(t: Node, f: VFile): void {
  if (isHeadingNode(t)) {
    check(t, f)
    return
  }

  if (!isParentNode(t)) {
    return
  }

  for (const n of t.children) {
    rule(n, f)
  }
}

function check(n: Node, f: VFile): void {
  if (!isParentNode(n)) {
    return
  }

  for (const c of n.children) {
    if (isLinkNode(c)) {
      f.message("A heading with a link is not permitted.", {ancestors: [c]})
      continue
    }

    check(c, f)
  }
}
