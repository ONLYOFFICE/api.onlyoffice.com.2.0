import {ChapterContainer} from "./element.ts"

export function define(): void {
  if (window.customElements.get(ChapterContainer.tagName)) {
    return
  }
  window.ChapterContainer = ChapterContainer
  window.customElements.define(ChapterContainer.tagName, ChapterContainer)
}
