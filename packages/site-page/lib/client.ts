import {type ChapterContainer} from "@onlyoffice/site-chapter/client.js"

declare global {
  interface Window {
    PageContainer: typeof PageContainer
  }

  interface HTMLElementTagNameMap {
    "page-container": PageContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "page-container": HTMLAttributes<PageContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(PageContainer.tagName)) {
    return
  }
  window.PageContainer = PageContainer
  window.customElements.define(PageContainer.tagName, PageContainer)
}

export class PageContainer extends HTMLElement {
  static get tagName(): string {
    return "page-container"
  }

  get #chapterNavigationToggler(): HTMLElement | null {
    return this.querySelector("[data-page-container-chapter-navigation-toggler]")
  }

  get #chapterContainer(): ChapterContainer | null {
    return this.querySelector("chapter-container")
  }

  connectedCallback(): void {
    this.#listen()
  }

  #listen(): void {
    this.addEventListener("click", this)
  }

  handleEvent(e: Event): void {
    if (
      e.type === "click" &&
      e.target &&
      e.target === this.#chapterNavigationToggler
    ) {
      const c = this.#chapterContainer
      if (!c) {
        return
      }
      c.toggleNavigationVisible()
    }
  }
}

define()
