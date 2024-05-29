import type {Client} from "@onlyoffice/server-client"

declare global {
  interface Window {
    SitePlayground: typeof SitePlayground
  }

  interface HTMLElementTagNameMap {
    "site-playground": SitePlayground
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "site-playground": HTMLAttributes<SitePlayground>
      }
    }
  }
}

function main(): void {
  if (window.customElements.get(SitePlayground.tagName)) {
    return
  }
  window.SitePlayground = SitePlayground
  window.customElements.define(SitePlayground.tagName, SitePlayground)
}

export class SitePlayground extends HTMLElement {
  static get tagName(): string {
    return "site-playground"
  }

  #client: Client | undefined

  get client(): Client | undefined {
    return this.#client
  }

  set client(value: Client | undefined) {
    this.#client = value
  }

  async connectedCallback(): Promise<void> {
    if (!this.#client) {
      return
    }

    const dep = this.querySelector("document-editor-playground")
    if (!dep) {
      return
    }

    try {
      const [cfg] = await this.#client.documentEditor.assign(dep.config)
      dep.play(cfg)
    } catch (e) {
      console.error(e)
    }
  }
}

main()
