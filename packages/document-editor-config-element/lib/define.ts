import {DocumentEditorConfig} from "./element.ts"

declare global {
  interface Window {
    DocumentEditorConfig: typeof DocumentEditorConfig
  }

  interface HTMLElementTagNameMap {
    "document-editor-config": DocumentEditorConfig
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor-config": HTMLAttributes<DocumentEditorConfig>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(DocumentEditorConfig.tagName)) {
    return
  }
  window.DocumentEditorConfig = DocumentEditorConfig
  window.customElements.define(DocumentEditorConfig.tagName, DocumentEditorConfig)
}
