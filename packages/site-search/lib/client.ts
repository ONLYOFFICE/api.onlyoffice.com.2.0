import {type TextInputContainer} from "@onlyoffice/ui-text-input/client.js"
import {
  type Pagefind,
  type PagefindFragment,
  type PagefindSearchOptions,
} from "pagefind"

declare global {
  interface Window {
    SearchContainer: typeof SearchContainer
  }

  interface HTMLElementTagNameMap {
    "search-container": SearchContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "search-container": HTMLAttributes<SearchContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(SearchContainer.tagName)) {
    return
  }
  window.SearchContainer = SearchContainer
  window.customElements.define(SearchContainer.tagName, SearchContainer)
}

// https://github.com/primer/react/blob/v36.14.0/packages/react/src/TextInput/TextInput.tsx
// todo: separate input logic into a separate search-container.
// todo: separate keydown logic into a separate keydown-container.
// todo: rename to pagefind-container.

export class SearchContainer extends HTMLElement {
  static get tagName(): string {
    return "search-container"
  }

  get #src(): string {
    return this.getAttribute("src") || "/pagefind/pagefind.js"
  }

  get #searchOptions(): PagefindSearchOptions {
    const s = this.getAttribute("search-options")
    if (!s) {
      return {}
    }
    return JSON.parse(s)
  }

  #pagefind: Pagefind | undefined

  get #query(): string {
    const p = new URLSearchParams(window.location.search)
    const q = p.get("q")
    if (!q) {
      return ""
    }
    return decodeURIComponent(q)
  }

  set #query(q: string) {
    let u = window.location.origin + window.location.pathname

    const p = new URLSearchParams(window.location.search)
    if (!q) {
      if (p.has("q")) {
        p.delete("q")
      }
    } else {
      q = encodeURIComponent(q)
      p.set("q", q)
    }

    const s = p.toString()
    if (s) {
      u += `?${s}`
    }

    window.history.replaceState({}, "", u)
  }

  get #formElement(): HTMLFormElement | null {
    return this.querySelector("form")
  }

  get #sitesElement(): HTMLInputElement | null {
    return this.querySelector('input[name="sites"]')
  }

  get #queryContainer(): TextInputContainer | null {
    return this.querySelector("text-input-container")
  }

  get #queryElement(): HTMLInputElement | null {
    return this.querySelector('input[name="q"]')
  }

  get #clearElement(): HTMLButtonElement | null {
    return this.querySelector('button[value="clear"]')
  }

  get #templateElement(): HTMLTemplateElement | null {
    return this.querySelector("template")
  }

  get #hidableElements(): NodeListOf<HTMLElement> {
    return document.querySelectorAll<HTMLElement>("[data-search-container-hidable]")
  }

  get #outputElement(): HTMLOutputElement | null {
    return document.querySelector("[data-search-container-output]")
  }

  get #counterElement(): HTMLElement | null {
    const o = this.#outputElement
    if (!o) {
      return null
    }
    return o.querySelector("[data-search-container-counter]")
  }

  get #resultsElement(): HTMLElement | null {
    const o = this.#outputElement
    if (!o) {
      return null
    }
    return o.querySelector("[data-search-container-results]")
  }

  async connectedCallback(): Promise<void> {
    await this.#setup()
    this.#listen()
  }

  async disconnectedCallback(): Promise<void> {
    await this.#desetup()
    this.#delisten()
  }

  async #setup(): Promise<void> {
    await this.#setupPagefind()
    this.#setupSites()
    this.#setupQuery()
    await this.#setupOutput()
  }

  async #setupPagefind(): Promise<void> {
    try {
      const p = await imp<Pagefind>(this.#src)
      await p.init()
      this.#pagefind = p
    } catch {
      // todo: dispatch error event
    }
  }

  #setupSites(): void {
    const e = this.#sitesElement
    if (!e) {
      return
    }
    e.setAttribute("value", window.location.host)
  }

  #setupQuery(): void {
    const c = this.#queryContainer
    if (!c) {
      return
    }

    const e = this.#queryElement
    if (!e) {
      return
    }

    const q = this.#query
    c.filled = Boolean(q)
    e.value = q
  }

  async #setupOutput(): Promise<void> {
    const q = this.#query
    if (!q) {
      return
    }

    // todo: temp solution

    const t = this.#templateElement
    if (!t) {
      return
    }

    await this.#searchCallback()
  }

  async #desetup(): Promise<void> {
    const p = this.#pagefind
    if (p) {
      await p.destroy()
    }
  }

  #listen(): void {
    window.addEventListener("keydown", this)
    this.addEventListener("click", this)
    this.addEventListener("input", this)
    this.addEventListener("submit", this)
  }

  #delisten(): void {
    window.removeEventListener("keydown", this)
  }

  handleEvent(e: Event): void {
    if (
      e instanceof MouseEvent &&
      e.type === "click" &&
      e.target &&
      e.target === this.#clearElement
    ) {
      e.preventDefault()
      this.#clear()
      return
    }

    if (
      e instanceof InputEvent &&
      e.type === "input" &&
      e.target instanceof HTMLInputElement &&
      e.target === this.#queryElement
    ) {
      e.preventDefault()
      this.#query = e.target.value
      this.#search()
      return
    }

    if (
      e instanceof KeyboardEvent &&
      e.type === "keydown" &&
      e.currentTarget === window &&
      e.key === "/"
    ) {
      e.preventDefault()

      const q = this.#queryElement
      if (!q) {
        return
      }

      q.focus()

      return
    }

    if (
      e instanceof KeyboardEvent &&
      e.type === "keydown" &&
      e.target &&
      e.target === this.#queryElement &&
      e.key === "Enter"
    ) {
      e.preventDefault()

      // todo: temp solution

      const qs = this.#query
      if (!qs) {
        return
      }

      const te = this.#templateElement
      if (te) {
        return
      }

      // todo: move path to the parameters
      window.location.href = `/search/?q=${encodeURIComponent(qs)}`

      return
    }

    if (
      e instanceof SubmitEvent &&
      e.type === "submit" &&
      e.target === this.#formElement
    ) {
      e.preventDefault()
    }
  }

  #searchId = -1

  #search(): void {
    window.clearTimeout(this.#searchId)
    this.#searchId = window.setTimeout(() => {
      // todo: replace the console with a custom error event
      this.#searchCallback().catch(console.error)
    }, 180)
  }

  async #searchCallback(): Promise<void> {
    const pf = this.#pagefind
    if (!pf) {
      return
    }

    const qs = this.#query
    if (!qs) {
      this.#clear()
      return
    }

    const sr = await pf.search(qs, this.#searchOptions)

    const ce = this.#counterElement
    if (ce) {
      ce.textContent = String(sr.results.length)
    }

    // todo: move the limit to the parameters
    // todo: rewrite with for loop
    const ae = await Promise.all(sr.results.slice(0, 100).map(async (r) => {
      const d = await r.data()
      const f = this.#createFragment(qs, d)
      if (!f) {
        return []
      }
      return f
    }))

    const re = this.#resultsElement
    if (re) {
      re.replaceChildren(...ae.flat())
    }

    const oe = this.#outputElement
    const he = this.#hidableElements
    if (oe && he.length !== 0) {
      for (const e of he) {
        if (!e.hasAttribute("hidden")) {
          e.setAttribute("hidden", "")
        }
      }

      if (oe.hasAttribute("hidden")) {
        oe.removeAttribute("hidden")
      }
    }
  }

  #clear(): void {
    const qe = this.#queryElement
    if (qe) {
      qe.value = ""
    }

    const ce = this.#counterElement
    if (ce) {
      ce.textContent = ""
    }

    const re = this.#resultsElement
    if (re) {
      re.replaceChildren()
    }

    const oe = this.#outputElement
    const he = this.#hidableElements
    if (oe && he.length !== 0) {
      for (const e of he) {
        if (e.hasAttribute("hidden")) {
          e.removeAttribute("hidden")
        }
      }

      if (!oe.hasAttribute("hidden")) {
        oe.setAttribute("hidden", "")
      }
    }

    this.#query = ""
  }

  #createFragment(q: string, d: PagefindFragment): DocumentFragment | undefined {
    const t = this.#templateElement
    if (!t) {
      return undefined
    }

    const f = document.importNode(t.content, true)

    const l = f.querySelector("[data-search-container-link]")
    if (l && l instanceof HTMLAnchorElement) {
      const u = new URL(d.url, "http://localhost/")
      u.hash = `#:~:text=${encodeURIComponent(q)}`
      l.href = u.toString().replace(u.origin, "")
      if (!d.meta || !d.meta.title) {
        l.textContent = d.url
      } else {
        l.textContent = d.meta.title
      }
    }

    const m = f.querySelector("[data-search-container-matches]")
    if (m) {
      m.innerHTML = d.excerpt
        .replaceAll("<", "&lt;")
        .replaceAll("&lt;mark>", "<mark>")
        .replaceAll("&lt;/mark>", "</mark>")
    }

    return f
  }
}

/**
 * {@link https://github.com/vitejs/vite/issues/14850/#issuecomment-1907266103 Vite Reference}
 */
async function imp<T>(p: string): Promise<T> {
  if (import.meta && import.meta.env && import.meta.env.DEV) {
    p += `?${Date.now()}`
  }
  return await import(/* @vite-ignore */p)
}

define()
