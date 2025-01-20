import {type TabListContainer} from "./element.ts"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        [TabListContainer.tagName]: HTMLAttributes<TabListContainer>
      }
    }
  }

  interface Window {
    TabListContainer: typeof TabListContainer
  }

  interface HTMLElementTagNameMap {
    [TabListContainer.tagName]: TabListContainer
  }
}
