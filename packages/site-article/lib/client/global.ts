import {type ArticleContainer} from "./element.ts"

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
