import {ArticleContainer} from "./element.ts"

declare global {
  interface Window {
    ArticleContainer: typeof ArticleContainer
  }

  interface HTMLElementTagNameMap {
    "article-container": ArticleContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "article-container": HTMLAttributes<ArticleContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(ArticleContainer.tagName)) {
    return
  }
  window.ArticleContainer = ArticleContainer
  window.customElements.define(ArticleContainer.tagName, ArticleContainer)
}
