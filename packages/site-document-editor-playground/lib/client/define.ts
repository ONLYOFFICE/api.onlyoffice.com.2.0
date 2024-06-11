import {SiteDocumentEditorPlayground} from "./element.ts"
import type {
  GlobalSiteDocumentEditorPlaygroundErrorHandler,
  SiteDocumentEditorPlaygroundErrorListener
} from "./events.ts"
import {SiteDocumentEditorPlaygroundErrorEvent} from "./events.ts"

declare global {
  interface Window {
    SiteDocumentEditorPlayground: typeof SiteDocumentEditorPlayground
    SiteDocumentEditorPlaygroundErrorEvent: typeof SiteDocumentEditorPlaygroundErrorEvent
  }

  interface HTMLElementTagNameMap {
    "site-document-editor-playground": SiteDocumentEditorPlayground
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "site-document-editor-playground": HTMLAttributes<SiteDocumentEditorPlayground>
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    sitedocumenteditorplaygrounderror: SiteDocumentEditorPlaygroundErrorListener
  }

  interface GlobalEventHandlers {
    onsitedocumenteditorplaygrounderror: GlobalSiteDocumentEditorPlaygroundErrorHandler | null
  }
}

export function define(): void {
  if (window.customElements.get(SiteDocumentEditorPlayground.tagName)) {
    return
  }
  window.SiteDocumentEditorPlayground = SiteDocumentEditorPlayground
  window.customElements.define(SiteDocumentEditorPlayground.tagName, SiteDocumentEditorPlayground)
  window.SiteDocumentEditorPlaygroundErrorEvent = SiteDocumentEditorPlaygroundErrorEvent
}
