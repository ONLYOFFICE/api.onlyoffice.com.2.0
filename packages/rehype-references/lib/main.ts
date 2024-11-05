import {
  Glossary,
  GlossaryDetails,
  GlossaryName,
  GlossaryTerm,
} from "@onlyoffice/glossary-hastscript"
import {
  isAElement,
  // isCodeElement,
  isDdElement,
  isDlElement,
  isDtElement,
  // isPElement,
} from "@onlyoffice/hast-util-is-element"
// import {isNewlineText} from "@onlyoffice/hast-util-is-text"
import {
  type Children,
  type Component,
  // Fragment as F,
  Spacer as S,
  h,
  render,
} from "@onlyoffice/hastscript"
import {type Element, type Root} from "hast"
import {CONTINUE, visit} from "unist-util-visit"

export interface RehypeReferencesTransform {
  (tree: Root): void
}

export function rehypeReferences(): RehypeReferencesTransform {
  return function transform(t) {
    visit(t, "element", (n, i, p) => {
      if (
        !p ||
        i === undefined ||
        n.tagName !== "references"
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

  let p = false
  // let s = false

  for (const x of e.children) {
    if (p) {
      break
    }

    // if (p && s) {
    //   break
    // }

    if (isAElement(x) && !p) {
      const c = h(GlossaryName, [x])
      t0.push(c)
      p = true
      continue
    }

    // if (isPElement(x) && !p) {
    //   const c = h(GlossaryName, x.children)
    //   t0.push(c)
    //   p = true
    //   continue
    // }

    // if (isCodeElement(x) && !s) {
    //   const c = h(F, [x])
    //   t1.push(c)
    //   s = true
    //   continue
    // }
  }

  const t = [...t0, ...t1]

  return h(GlossaryTerm, [
    t.length !== 0 && h(S, t),
  ])
}

function convertDd(e: Element): Component {
  // const t = [...e.children]
  // if (t.length !== 0) {
  //   const [c] = t
  //   if (isNewlineText(c)) {
  //     t.shift()
  //   }
  // }

  return h(GlossaryDetails, e.children)
}
