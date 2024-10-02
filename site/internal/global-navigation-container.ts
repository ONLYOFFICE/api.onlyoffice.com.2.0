declare global {
  interface Window {
    GlobalNavigationContainer: typeof GlobalNavigationContainer
  }

  interface HTMLElementTagNameMap {
    "global-navigation-container": GlobalNavigationContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "global-navigation-container": HTMLAttributes<GlobalNavigationContainer>
      }
    }
  }
}

function define(): void {
  if (window.customElements.get(GlobalNavigationContainer.tagName)) {
    return
  }
  window.GlobalNavigationContainer = GlobalNavigationContainer
  window.customElements.define(GlobalNavigationContainer.tagName, GlobalNavigationContainer)
}

class GlobalNavigationContainer extends HTMLElement {
  static get tagName(): string {
    return "global-navigation-container"
  }

  get #expanded(): boolean {
    return this.hasAttribute("expanded")
  }

  set #expanded(v: boolean) {
    if (v) {
      this.setAttribute("expanded", "")
    } else {
      this.removeAttribute("expanded")
    }
  }

  get #button(): HTMLButtonElement | null {
    return this.querySelector("button")
  }

  connectedCallback(): void {
    this.addEventListener("click", this)
  }

  disconnectedCallback(): void {
    this.removeEventListener("click", this)
  }

  handleEvent(e: Event): void {
    if (e.type === "click" && e.target === this.#button) {
      this.#expanded = !this.#expanded
    }
  }
}

define()
