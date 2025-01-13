/**
 * {@link https://github.com/craftzdog/remark-strip-html/tree/v1.0.2/ remark-strip-html Reference}
 */
declare module "remark-strip-html" {
  import {type Node} from "mdast"

  /**
   * {@link https://github.com/craftzdog/remark-strip-html/blob/v1.0.2/index.js/#L3 remark-strip-html Reference}
   */
  export default function strip(): typeof one

  /**
   * {@link https://github.com/craftzdog/remark-strip-html/blob/v1.0.2/index.js#/L15 remark-strip-html Reference}
   */
  function one(node: Node): Node
}
