declare global {
  interface Window {
    TextInputContainer: typeof TextInputContainer
  }

  interface HTMLElementTagNameMap {
    "text-input-container": TextInputContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "text-input-container": HTMLAttributes<TextInputContainer>
      }
    }
  }
}

function define(): void {
  if (window.customElements.get(TextInputContainer.tagName)) {
    return
  }

  window.TextInputContainer = TextInputContainer
  window.customElements.define(TextInputContainer.tagName, TextInputContainer)
}

export class TextInputContainer extends HTMLElement {
  static get tagName(): string {
    return "text-input-container"
  }

  get focused(): boolean {
    return this.#hasState("focused")
  }

  set focused(s: boolean) {
    this.#changeState("focused", s)
  }

  get filled(): boolean {
    return this.#hasState("filled")
  }

  set filled(s: boolean) {
    this.#changeState("filled", s)
  }

  get controlElement(): HTMLElement | null {
    const c = this.controlContainer
    if (!c) {
      return null
    }
    return c.querySelector("input")
  }

  get controlContainer(): HTMLElement | null {
    return this.querySelector("[data-text-input-control-container]")
  }

  connectedCallback(): void {
    this.#attach()
    this.#setup()
    this.#listen()
    // this.#observe()
  }

  static formAssociated = true
  #internals: ElementInternals | null = null

  #attach(): void {
    if (this.attachInternals) {
      this.#internals = this.attachInternals()
    }
  }

  #setup(): void {
    this.#setupControl()
    this.#setupState()
  }

  #setupControl(): void {
    const f = filler.bind(this)

    const c = this.controlElement
    if (!c) {
      return
    }

    const v = Object.getOwnPropertyDescriptor(HTMLInputElement.prototype, "value")
    if (!v) {
      return
    }

    // It is irrelevant since the context of the set method is bound later.
    // eslint-disable-next-line @typescript-eslint/unbound-method
    const s = v.set
    if (!s) {
      return
    }

    Object.defineProperty(c, "value", {
      ...v,
      set(v) {
        f(v)
        s.call(this, v)
      },
    })

    function filler(this: TextInputContainer, v: unknown): void {
      if (!v) {
        this.filled = false
        return
      }
      this.filled = true
    }
  }

  #setupState(): void {
    if (this.#internals && CSS.supports("selector(:state(_))")) {
      this.#hasState = this.#hasModernState.bind(this)
      this.#changeState = this.#changeModernState.bind(this)
      return
    }
    this.#hasState = this.#hasFallbackState.bind(this)
    this.#changeState = this.#changeFallbackState.bind(this)
  }

  #listen(): void {
    this.addEventListener("focusin", this)
    this.addEventListener("focusout", this)
    this.addEventListener("input", this)
  }

  // // eslint-disable-next-line no-unused-private-class-members
  // #observer: MutationObserver | null = null

  // #observe(): void {
  //   const o = new MutationObserver(this.#observerCallback.bind(this))
  //   o.observe(this, {attributes: true, characterData: true, childList: true, subtree: true})
  //   this.#observer = o
  // }

  // #observerCallback(ms: MutationRecord[], o: MutationObserver): void {}

  handleEvent(e: Event): void {
    if (
      e.type === "focusin" &&
      e.target &&
      e.target === this.controlElement
    ) {
      e.preventDefault()
      this.focused = true
      return
    }

    if (
      e.type === "focusout" &&
      e.target &&
      e.target === this.controlElement
    ) {
      e.preventDefault()
      this.focused = false
      return
    }

    if (
      e.type === "input" &&
      e.target instanceof HTMLInputElement &&
      e.target === this.controlElement
    ) {
      e.preventDefault()
      if (!e.target.value) {
        this.filled = false
      } else {
        this.filled = true
      }
    }
  }

  #hasState: (k: string) => boolean = () => {
    return false
  }

  #hasFallbackState(k: string): boolean {
    const s = this.getAttribute(`state-${k}`)
    if (s === null) {
      return false
    }
    return true
  }

  #hasModernState(k: string): boolean {
    const t = this.#internals
    if (!t) {
      return false
    }
    return t.states.has(k)
  }

  #changeState: (k: string, v: boolean) => void = () => {}

  #changeFallbackState(k: string, v: boolean): void {
    if (!v) {
      this.removeAttribute(`state-${k}`)
      return
    }
    this.setAttribute(`state-${k}`, "")
  }

  #changeModernState(k: string, v: boolean): void {
    const t = this.#internals
    if (!t) {
      return
    }
    if (!v) {
      t.states.delete(k)
      return
    }
    t.states.add(k)
  }
}

define()
