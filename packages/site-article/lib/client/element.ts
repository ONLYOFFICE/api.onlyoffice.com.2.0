import {calc} from "@onlyoffice/css-calc"
import {type TocContainer} from "@onlyoffice/site-toc/client.js"

export class ArticleContainer extends HTMLElement {
  static get tagName(): string {
    return "article-container"
  }

  get #sidebarMargin(): string {
    const r = this.#rootElement
    if (!r) {
      return ""
    }

    const s = getComputedStyle(r)

    const v = s.getPropertyValue("--article-sidebar-inset-block-start")
    if (!v) {
      return ""
    }

    return `-${calc(v)}px 0px 0px 0px`
  }

  get #rootElement(): Element | null {
    return this.children[0]
  }

  get #tocElement(): TocContainer | null {
    return this.querySelector("toc-container")
  }

  connectedCallback(): void {
    this.#setup()
  }

  #setup(): void {
    this.#setupToc()
  }

  #setupToc(): void {
    const m = this.#sidebarMargin
    if (!m) {
      return
    }

    const t = this.#tocElement
    if (!t) {
      return
    }

    t.rootMargin = m
  }
}
