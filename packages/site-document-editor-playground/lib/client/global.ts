import {type DocumentEditorPlayground} from "./element.ts"
import {
  type DocumentEditorPlaygroundErrorEvent,
  type DocumentEditorPlaygroundErrorListener,
  type GlobalDocumentEditorPlaygroundErrorHandler,
} from "./events.ts"

declare global {
  interface Window {
    DocumentEditorPlayground: typeof DocumentEditorPlayground
    DocumentEditorPlaygroundErrorEvent: typeof DocumentEditorPlaygroundErrorEvent
  }

  interface HTMLElementTagNameMap {
    "document-editor-playground": DocumentEditorPlayground
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor-playground": HTMLAttributes<DocumentEditorPlayground>
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    documenteditorplaygrounderror: DocumentEditorPlaygroundErrorListener
  }

  interface GlobalEventHandlers {
    ondocumenteditorplaygrounderror: GlobalDocumentEditorPlaygroundErrorHandler | null
  }
}
