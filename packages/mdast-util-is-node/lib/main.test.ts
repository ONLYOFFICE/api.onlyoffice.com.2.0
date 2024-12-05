import {test} from "uvu"
import {is} from "uvu/assert"
import {
  isCodeNode,
  isHeadingNode,
  isHtmlNode,
  isInlineCodeNode,
  isLiteralNode,
  isNode,
  isParagraphNode,
  isParentNode,
  isTextNode,
} from "./main.ts"

interface Is {
  (u: unknown): boolean
}

const p0: [Is, unknown][] = [
  [isNode, {type: ""}],
  [isLiteralNode, {type: "", value: ""}],
  [isParentNode, {type: "", children: []}],
]

for (const [xi, xn] of p0) {
  test(`${xi.name}(): returns true for the '${JSON.stringify(xn)}'`, () => {
    const a = xi(xn)
    is(a, true)
  })

  test(`${xi.name}(): returns false for the '{}'`, () => {
    const a = xi({})
    is(a, false)
  })
}

const p1: [Is, unknown][] = [
  [isTextNode, {type: "text", value: ""}],
  [isHtmlNode, {type: "html", value: ""}],
  [isParagraphNode, {type: "paragraph", children: []}],
  [isInlineCodeNode, {type: "inlineCode", value: ""}],
  [isHeadingNode, {type: "heading", depth: 1, children: []}],
  [isCodeNode, {type: "code", value: ""}],
]

for (const [xi, xn] of p1) {
  test(`${xi.name}(): returns true for the '${JSON.stringify(xn)}'`, () => {
    const a = xi(xn)
    is(a, true)
  })

  for (const [yi, yn] of p1) {
    if (xi === yi) {
      continue
    }

    test(`${xi.name}(): returns false for the '${JSON.stringify(yn)}'`, () => {
      const a = xi(yn)
      is(a, false)
    })
  }
}

test.run()
