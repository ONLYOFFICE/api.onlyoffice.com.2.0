import {type Component, h, render} from "@onlyoffice/hastscript"
import {test} from "uvu"
import {is} from "uvu/assert"
import {
  isAElement,
  isButtonElement,
  isCodeElement,
  isDdElement,
  isDivElement,
  isDlElement,
  isDtElement,
  isFooterElement,
  isH1Element,
  isH2Element,
  isH3Element,
  isH4Element,
  isH5Element,
  isH6Element,
  isHeaderElement,
  isLiElement,
  isNavElement,
  isPElement,
  isPreElement,
  isSpanElement,
  isTemplateElement,
  isUlElement,
} from "./main.ts"

interface Is {
  (u: unknown): boolean
}

const pairs: [Is, Component][] = [
  [isAElement, h("a")],
  [isButtonElement, h("button")],
  [isCodeElement, h("code")],
  [isDdElement, h("dd")],
  [isDivElement, h("div")],
  [isDlElement, h("dl")],
  [isDtElement, h("dt")],
  [isFooterElement, h("footer")],
  [isH1Element, h("h1")],
  [isH2Element, h("h2")],
  [isH3Element, h("h3")],
  [isH4Element, h("h4")],
  [isH5Element, h("h5")],
  [isH6Element, h("h6")],
  [isHeaderElement, h("header")],
  [isLiElement, h("li")],
  [isNavElement, h("nav")],
  [isPElement, h("p")],
  [isPreElement, h("pre")],
  [isSpanElement, h("span")],
  [isTemplateElement, h("template")],
  [isUlElement, h("ul")],
]

for (const [xi, xe] of pairs) {
  test(`${xi.name}(): returns true for the '${xe.source}' source`, () => {
    const r = render(xe)
    const a = xi(r)
    is(a, true)
  })

  for (const [yi, ye] of pairs) {
    if (xi === yi) {
      continue
    }

    test(`${xi.name}(): returns false for the '${ye.source}' source`, () => {
      const r = render(ye)
      const a = xi(r)
      is(a, false)
    })
  }
}

test.run()
