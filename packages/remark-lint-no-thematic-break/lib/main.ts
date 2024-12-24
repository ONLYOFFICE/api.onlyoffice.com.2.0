import {isParentNode, isThematicBreakNode} from "@onlyoffice/mdast-util-is-node"
import {type RemarkLintRule} from "@onlyoffice/remark-lint"
import {type Node} from "mdast"
import {lintRule} from "unified-lint-rule"
import {type VFile} from "vfile"

export const remarkLintNoThematicBreak: RemarkLintRule<Node> =
  lintRule("@onlyoffice:no-thematic-break", rule)

function rule(t: Node, f: VFile): void {
  if (isThematicBreakNode(t)) {
    f.message("A thematic break is not permitted.", {ancestors: [t]})
    return
  }

  if (!isParentNode(t)) {
    return
  }

  for (const c of t.children) {
    rule(c, f)
  }
}
