import {TabContainerChangeEvent} from "@github/tab-container-element"

export class TabListContainer extends HTMLElement {
  static get tagName(): "tab-list-container" {
    return "tab-list-container"
  }

  //
  // Elements
  //

  get #tabElements(): NodeListOf<HTMLElement> {
    return this.querySelectorAll('[role="tab"]')
  }

  get #controllableElements(): NodeListOf<HTMLElement> {
    const t = this.#tabElements
    if (t.length === 0) {
      return noopNodeListOf()
    }

    let q = ""

    for (const e of t) {
      const a = e.getAttribute("aria-controls")
      if (!a) {
        continue
      }

      for (const id of a.split(" ")) {
        q += `#${id}, `
      }
    }

    if (q.length !== 0) {
      q = q.slice(0, -2)
    }

    return this.querySelectorAll(q)
  }

  //
  // Lifecycle
  //

  connectedCallback(): void {
    this.#listen()
  }

  disconnectedCallback(): void {
    this.#unlisten()
  }

  #listen(): void {
    this.addEventListener("tab-container-changed", this)
  }

  #unlisten(): void {
    this.removeEventListener("tab-container-changed", this)
  }

  handleEvent(e: Event): void {
    if (e instanceof TabContainerChangeEvent) {
      this.#toggle(e)
    }
  }

  //
  // Methods
  //

  #toggle(e: TabContainerChangeEvent): void {
    if (!e.tab) {
      return
    }

    const c = e.tab.getAttribute("aria-controls")
    if (!c) {
      return
    }

    const cs = c.split(" ")

    for (const e of this.#controllableElements) {
      if (cs.includes(e.id)) {
        e.hidden = false
      } else {
        e.hidden = true
      }
    }
  }
}

function noopNodeListOf<T extends Node>(): NodeListOf<T> {
  const n = document.createDocumentFragment().querySelectorAll("")
  return n as unknown as NodeListOf<T>
}
