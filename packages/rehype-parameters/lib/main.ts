import {
  Glossary,
  GlossaryDetails,
  GlossaryTerm,
} from "@onlyoffice/glossary-hastscript"
import {
  isCodeElement,
  isDdElement,
  isDlElement,
  isDtElement,
  isPElement,
} from "@onlyoffice/hast-util-is-element"
import {isNewlineText, isText} from "@onlyoffice/hast-util-is-text"
import {
  type Children,
  type Component,
  Spacer as S,
  h,
  render,
} from "@onlyoffice/hastscript"
import {BadgeGroup} from "@onlyoffice/ui-badge-group-hastscript"
import {Badge, BadgeCaption} from "@onlyoffice/ui-badge-hastscript"
import {type Element, type Root} from "hast"
import {CONTINUE, visit} from "unist-util-visit"

export interface RehypeParametersTransform {
  (tree: Root): void
}

export function rehypeParameters(): RehypeParametersTransform {
  return function transform(t) {
    visit(t, "element", (n, i, p) => {
      if (
        !p ||
        i === undefined ||
        n.tagName !== "parameters"
      ) {
        return
      }

      for (const c of n.children) {
        if (!isDlElement(c)) {
          continue
        }

        const r = convertDl(c)
        p.children[i] = render(r)

        return [CONTINUE, i]
      }
    })
  }
}

function convertDl(e: Element): Component {
  const t: Children = []

  for (const c of e.children) {
    if (isDtElement(c)) {
      const r = convertDt(c)
      t.push(r, "\n")
      continue
    }

    if (isDdElement(c)) {
      const r = convertDd(c)
      t.push(r, "\n")
      continue
    }
  }

  if (t.length !== 0) {
    const c = t[t.length - 1]
    if (typeof c === "string" && c === "\n") {
      t.pop()
    }
  }

  return h(Glossary, [
    h(S, t),
  ])
}

function convertDt(e: Element): Component {
  const t0: Component[] = []
  const t1: Component[] = []
  const t2: Component[] = []

  let p = false
  let s = false

  for (const x of e.children) {
    if (p && s) {
      break
    }

    if (isPElement(x) && !p) {
      for (const y of x.children) {
        if (!isText(y)) {
          continue
        }

        const a = split(y.value)
        if (a.length === 0) {
          break
        }

        const [n] = a
        if (n) {
          const c = h(Badge, {variant: "calm"}, [n])
          t0.push(c)
        }

        for (let i = 1; i < a.length; i += 1) {
          const s = a[i]

          if (s === "required") {
            const c = h(Badge, {variant: "critical"}, ["required"])
            t2.push(c)
            continue
          }

          for (const b of ["format", "default", "example"]) {
            const p = `${b}: `
            if (!s.startsWith(p)) {
              continue
            }

            const c = h(Badge, {variant: "neutral"}, [
              h(BadgeCaption, [p]),
              s.slice(p.length),
            ])
            t2.push(c)
            break
          }
        }

        break
      }

      p = true
      continue
    }

    if (isCodeElement(x) && !s) {
      const c = h(Badge, {variant: "transparent"}, [x])
      t1.push(c)

      s = true
      continue
    }
  }

  const t = [...t0, ...t1, ...t2]

  return h(GlossaryTerm, [
    t.length !== 0 && h(S, [
      h(BadgeGroup, [
        h(S, t),
      ]),
    ]),
  ])
}

function convertDd(e: Element): Component {
  const t = [...e.children]
  if (t.length !== 0) {
    const [c] = t
    if (isNewlineText(c)) {
      t.shift()
    }
  }

  return h(GlossaryDetails, t)
}

function split(s: string): string[] {
  const r = []

  let t = ""
  let w = true
  let e = false

  for (const c of s) {
    if (c === "\\" && !e) {
      e = true
      continue
    }

    if (c === "," && !e) {
      r.push(t)
      t = ""
      w = true
      continue
    }

    if (w && c === " ") {
      continue
    }

    t += c
    w = false
    e = false
  }

  if (t) {
    t = t.trimEnd()
    r.push(t)
  }

  return r
}
