import {type TransformCallback} from "unified"
import {type Label, type Severity} from "unified-lint-rule"
import {type Node} from "unist"
import {type VFile} from "vfile"

export interface RemarkLintRule<
  Tree extends Node = Node,
  Option = unknown,
> {
  (
    config?:
      Label |
      Severity |
      Option |
      [
        level: Label | Severity,
        option?: Option | undefined,
      ] |
      undefined
  ):
    (
      (
        tree: Tree,
        file: VFile,
        next: TransformCallback<Tree>,
      ) => undefined
    ) |
    undefined

  readonly name: string
}
