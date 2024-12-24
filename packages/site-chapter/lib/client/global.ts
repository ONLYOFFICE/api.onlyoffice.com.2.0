import {type ChapterContainer} from "./element.ts"

declare global {
  interface Window {
    ChapterContainer: typeof ChapterContainer
  }

  interface HTMLElementTagNameMap {
    "chapter-container": ChapterContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "chapter-container": HTMLAttributes<ChapterContainer>
      }
    }
  }
}
