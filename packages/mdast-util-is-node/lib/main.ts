import {
  type Code,
  type Heading,
  type Html,
  type InlineCode,
  type Link,
  type Literal,
  type Node,
  type Paragraph,
  type Parent,
  type Text,
  type ThematicBreak,
} from "mdast"

export function isCodeNode(u: unknown): u is Code {
  return isLiteralNode(u) && u.type === "code"
}

export function isHeadingNode(u: unknown): u is Heading {
  return isParentNode(u) &&
    u.type === "heading" &&
    "depth" in u &&
    typeof u.depth === "number"
}

export function isInlineCodeNode(u: unknown): u is InlineCode {
  return isLiteralNode(u) && u.type === "inlineCode"
}

export function isLinkNode(u: unknown): u is Link {
  return isParentNode(u) && u.type === "link"
}

export function isParagraphNode(u: unknown): u is Paragraph {
  return isParentNode(u) && u.type === "paragraph"
}

export function isThematicBreakNode(u: unknown): u is ThematicBreak {
  return isNode(u) && u.type === "thematicBreak"
}

export function isParentNode(u: unknown): u is Parent {
  return isNode(u) && "children" in u && Array.isArray(u.children)
}

export function isHtmlNode(u: unknown): u is Html {
  return isLiteralNode(u) && u.type === "html"
}

export function isTextNode(u: unknown): u is Text {
  return isLiteralNode(u) && u.type === "text"
}

export function isLiteralNode(u: unknown): u is Literal {
  return isNode(u) && "value" in u && typeof u.value === "string"
}

export function isNode(u: unknown): u is Node {
  return Boolean(
    u &&
    typeof u === "object" &&
    "type" in u &&
    typeof u.type === "string",
  )
}
