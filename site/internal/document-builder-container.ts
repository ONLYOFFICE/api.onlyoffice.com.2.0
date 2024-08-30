import {type Client} from "@onlyoffice/server-client"

declare global {
  interface Window {
    DocumentBuilderContainer: typeof DocumentBuilderContainer
  }

  interface HTMLElementTagNameMap {
    "document-builder-container": DocumentBuilderContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-builder-container": HTMLAttributes<DocumentBuilderContainer>
      }
    }
  }
}

function define(): void {
  if (window.customElements.get(DocumentBuilderContainer.tagName)) {
    return
  }
  window.DocumentBuilderContainer = DocumentBuilderContainer
  window.customElements.define(DocumentBuilderContainer.tagName, DocumentBuilderContainer)
}

export class DocumentBuilderContainer extends HTMLElement {
  static get tagName(): string {
    return "document-builder-container"
  }

  client: Client | undefined

  async play(): Promise<void> {
    const cl = this.client
    if (!cl) {
      return
    }

    const te = this.querySelector("template")
    if (!te) {
      return
    }

    const tc = document.importNode(te.content, true)
    const db = tc.querySelector("document-builder")
    if (!db) {
      return
    }

    if (!db.config) {
      return
    }

    [db.config] = await cl.documentEditor.sign({empty: true}, db.config)
    this.insertBefore(db, this.firstChild)
  }
}

define()
