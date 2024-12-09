import {
  isCodeNode,
  isInlineCodeNode,
  isLiteralNode,
  isParentNode,
} from "@onlyoffice/mdast-util-is-node"
import {type RemarkLintRule} from "@onlyoffice/remark-lint"
import {type Node} from "mdast"
import {lintRule} from "unified-lint-rule"
import {type Position} from "unist"
import {type MessageOptions, type VFile} from "vfile"

export interface RemarkLintNoUnicodeOptions {
  hints?: RemarkLintNoUnicodeHint[]
  codes?: string[]
}

export type RemarkLintNoUnicodeHint = [string, string, string, string]

export const remarkLintNoUnicode: RemarkLintRule<Node, RemarkLintNoUnicodeOptions> =
  lintRule("@onlyoffice:no-unicode", rule)

interface Options {
  hints: Hints
  codes: string[]
}

type Hints = Record<string, string>

function rule(t: Node, f: VFile, o: RemarkLintNoUnicodeOptions): void {
  const r = options(o)
  check(t, f, r)
}

function options(o: RemarkLintNoUnicodeOptions): Options {
  const r: Options = {
    hints: {},
    codes: [],
  }

  if (o.hints) {
    for (const [au, an, bu, bn] of o.hints) {
      r.hints[au] = concrete(au, an, bu, bn)
    }
  }

  if (o.codes) {
    r.codes = o.codes
  }

  return r
}

function check(t: Node, f: VFile, o: Options): void {
  if (isCodeNode(t) || isInlineCodeNode(t)) {
    return
  }

  if (isParentNode(t)) {
    for (const c of t.children) {
      check(c, f, o)
    }
    return
  }

  if (!isLiteralNode(t)) {
    return
  }

  for (let i = 0; i < t.value.length; i += 1) {
    const c = t.value[i]

    const u = unicode(c)
    if (!u) {
      continue
    }

    if (o.codes.includes(u)) {
      continue
    }

    const r = reason(o.hints, u)

    const p: MessageOptions = {ancestors: [t]}
    if (t.position) {
      p.place = place(t.position, t.value, i)
    }

    f.message(r, p)
  }
}

function unicode(s: string): string {
  const p = s.codePointAt(0)
  if (p === undefined) {
    return ""
  }

  const u = p.toString(16).toUpperCase()

  switch (u.length) {
  case 1:
    return `000${u}`
  case 2:
    return `00${u}`
  case 3:
    return `0${u}`
  default:
    return u
  }
}

function character(u: string): string {
  const n = Number.parseInt(u, 16)
  return String.fromCodePoint(n)
}

function reason(h: Hints, u: string): string {
  let m = h[u]

  if (!m) {
    m = abstract(u)
  }

  return m
}

function place(p: Position, a: string, i: number): Position {
  let l = p.start.line
  let c = p.start.column

  for (let j = 0; j <= i; j += 1) {
    const s = a[j]

    if (s === "\n") {
      c = 0
      l += 1
    }

    c += 1
  }

  return {
    start: {
      line: l,
      column: c - 1,
    },
    end: {
      line: l,
      column: c,
    },
  }
}

function abstract(u: string): string {
  return `Character "${character(u)}" (U+${u}) is not allowed. Refer to "${ref(u)}" for information regarding this character.`
}

function concrete(au: string, an: string, bu: string, bn: string): string {
  return `${an} character "${character(au)}" (U+${au}) is not allowed. Consider replacing it with ${article(bn)} ${bn} character "${character(bu)}" (U+${bu}). Refer to "${ref(au)}" and "${ref(bu)}" for information regarding these characters.`
}

function article(s: string): string {
  s = s.toLowerCase()
  s = s.charAt(0)

  const v = ["a", "e", "i", "o", "u"]
  if (v.includes(s)) {
    return "an"
  }

  return "a"
}

function ref(u: string): string {
  return `https://symbl.cc/en/${u}/`
}
