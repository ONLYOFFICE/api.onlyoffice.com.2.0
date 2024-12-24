import {DocumentEditorPlayground} from "./element.ts"
import {DocumentEditorPlaygroundErrorEvent} from "./events.ts"

export function define(): void {
  if (window.customElements.get(DocumentEditorPlayground.tagName)) {
    return
  }
  window.DocumentEditorPlayground = DocumentEditorPlayground
  window.customElements.define(DocumentEditorPlayground.tagName, DocumentEditorPlayground)
  window.DocumentEditorPlaygroundErrorEvent = DocumentEditorPlaygroundErrorEvent
}
