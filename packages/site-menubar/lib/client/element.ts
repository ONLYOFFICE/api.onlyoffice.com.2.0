// The current menubar relies on css, which is not the optimal solution.
// Creating a dedicated web component that implements the menubar pattern would
// be beneficial.
//
// https://www.w3.org/WAI/ARIA/apg/patterns/menubar/

export class MenubarContainer extends HTMLElement {
  static get tagName(): string {
    return "menubar-container"
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
