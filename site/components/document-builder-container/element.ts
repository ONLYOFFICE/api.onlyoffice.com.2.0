import type {DocumentEditorConfig} from "@onlyoffice/document-editor-html-element"

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
        "document-builder-container": Partial<Omit<DocumentBuilderContainer, keyof HTMLElement>> & JSXBase["span"]
      }
    }

    type JSXBase = JSX.IntrinsicElements extends {span: unknown}
      ? JSX.IntrinsicElements
      : Record<string, Record<string, unknown>>
  }
}

function main(): void {
  if (window.customElements.get(DocumentBuilderContainer.tag)) {
    return
  }
  window.DocumentBuilderContainer = DocumentBuilderContainer
  window.customElements.define(DocumentBuilderContainer.tag, DocumentBuilderContainer)
}

export class DocumentBuilderContainer extends HTMLElement {
  static get tag(): string {
    return "document-builder-container"
  }

  async connectedCallback(): Promise<void> {
    const ce = this.querySelector("code")
    if (!(ce && ce.textContent)) {
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

    const cu = new URL("/config", "http://0.0.0.0:4000/")
    cu.searchParams.set("fileType", db.config.document.fileType)

    const cr = await fetch(cu)
    const cs = await cr.json() as DocumentEditorConfig
    cs.editorConfig = {
      customization: {
        compactHeader: true,
        compactToolbar: true,
        hideRightMenu: true,
        hideRulers: true,
        integrationMode: "embed",
        toolbarHideFileName: true,
        toolbarNoTabs: true
      }
    }

    db.documentServerUrl = "http://0.0.0.0:3000/"
    db.config = cs
    db.setAttribute("command", ce.textContent)

    db.addEventListener("documenteditorappready", () => {
      console.log("Document Editor is ready")
    })
    db.addEventListener("documentbuilderready", () => {
      console.log("Document Builder is ready")
    })
    db.addEventListener("documenteditorerror", (e) => {
      console.error(`Document Editor: ${e.message}`)
    })
    db.addEventListener("documentbuildererror", (e) => {
      console.error(`Document Builder: ${e.message}`)
    })
    db.addEventListener("error", (e) => {
      console.error(`Unknown error: ${e.message}`)
    })

    this.insertBefore(tc, this.firstChild)
  }
}

main()
