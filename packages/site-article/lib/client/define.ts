import {ArticleContainer} from "./element.ts"

export function define(): void {
  if (window.customElements.get(ArticleContainer.tagName)) {
    return
  }
  window.ArticleContainer = ArticleContainer
  window.customElements.define(ArticleContainer.tagName, ArticleContainer)
}
