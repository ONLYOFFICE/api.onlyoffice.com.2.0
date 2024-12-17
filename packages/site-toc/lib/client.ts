declare global {
  interface Window {
    TocContainer: typeof TocContainer
  }

  interface HTMLElementTagNameMap {
    "toc-container": TocContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "toc-container": HTMLAttributes<TocContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(TocContainer.tagName)) {
    return
  }
  window.TocContainer = TocContainer
  window.customElements.define(TocContainer.tagName, TocContainer)
}

// The Table of Contents (TOC) element is inspired by the Mozilla Developer
// Network (MDN) [Yari Table of Contents component].
//
// [Yari Table of Contents component]: https://github.com/mdn/yari/blob/b10b2ae0c1460ba98ef1bd1d3c1b4c1551fd424b/client/src/document/organisms/toc/index.tsx#L23

export class TocContainer extends HTMLElement {
  static get tagName(): string {
    return "toc-container"
  }

  rootMargin = "-0px 0px 0px 0px"

  get #targetPairs(): Map<Element, string> {
    const m = new Map<Element, string>()

    const s = this.#sourceElements
    if (s.length === 0) {
      return m
    }

    const t = this.#targetElements
    if (t.length === 0) {
      return m
    }

    let c = ""
    for (const e of t) {
      if (e.id) {
        for (const a of s) {
          if (a.hash === `#${e.id}`) {
            c = e.id
            break
          }
        }
      }
      m.set(e, c)
    }

    return m
  }

  get #targetElements(): NodeListOf<Element> {
    const r = this.#rootElement

    const q = this.#targetQuery
    if (!q) {
      return emptyNodeListOf()
    }

    return r.querySelectorAll(q)
  }

  get #targetQuery(): string {
    const s = this.#sourceElements
    if (s.length === 0) {
      return ""
    }

    let q = "h1, h1 ~ *, "
    for (const e of s) {
      const id = e.hash.slice(1)
      q += `h2[id="${id}"], h2[id="${id}"] ~ *, `
    }
    q = q.slice(0, -2)

    return q
  }

  get #rootElement(): HTMLElement {
    const m = document.querySelector("main")
    if (!m) {
      return document.documentElement
    }
    return m
  }

  get #sourceElements(): NodeListOf<HTMLAnchorElement> {
    return this.querySelectorAll('a[href^="#"]')
  }

  connectedCallback(): void {
    this.#observe()
  }

  disconnectedCallback(): void {
    this.#deobserve()
  }

  #observe(): void {
    const c = this.#observerCallback.bind(this)
    const o = new FirstVisibilityObserver(c, {
      rootMargin: this.rootMargin,
      threshold: [0, 1],
    })

    const t = this.#targetElements
    for (const e of t) {
      o.observe(e)
    }

    this.#observer = o
  }

  #deobserve(): void {
    const o = this.#observer
    if (o) {
      o.disconnect()
    }
  }

  #observer: FirstVisibilityObserver | null = null

  #observerCallback(e: Element): void {
    const s = this.#sourceElements
    if (s.length === 0) {
      return
    }

    const p = this.#targetPairs
    if (p.size === 0) {
      return
    }

    const id = p.get(e)
    if (!id) {
      for (const a of s) {
        a.removeAttribute("aria-current")
      }
      return
    }

    for (const a of s) {
      if (a.hash === `#${id}`) {
        a.setAttribute("aria-current", "page")
      } else {
        a.removeAttribute("aria-current")
      }
    }
  }
}

interface FirstVisibilityObserverCallback {
  (element: Element): void
}

class FirstVisibilityObserver {
  #m: Map<Element, boolean>
  #o: IntersectionObserver
  #c: FirstVisibilityObserverCallback

  constructor(cb: FirstVisibilityObserverCallback, op?: IntersectionObserverInit) {
    const c = this.#cb.bind(this)
    this.#m = new Map()
    this.#o = new IntersectionObserver(c, op)
    this.#c = cb
  }

  observe(e: Element): void {
    this.#m.set(e, false)
    this.#o.observe(e)
  }

  disconnect(): void {
    this.#m = new Map()
    this.#o.disconnect()
  }

  #cb(es: IntersectionObserverEntry[]): void {
    for (const e of es) {
      this.#m.set(e.target, e.isIntersecting)
    }

    for (const [e, v] of this.#m.entries()) {
      if (v) {
        this.#c(e)
        break
      }
    }
  }
}

function emptyNodeListOf<T extends Node>(): NodeListOf<T> {
  const n = document.createDocumentFragment().querySelectorAll("")
  return n as unknown as NodeListOf<T>
}

define()
