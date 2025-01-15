import {type TocContainer} from "./element.ts"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        [TocContainer.tagName]: HTMLAttributes<TocContainer>
      }
    }
  }

  interface Window {
    TocContainer: typeof TocContainer
  }

  interface HTMLElementTagNameMap {
    [TocContainer.tagName]: TocContainer
  }
}
