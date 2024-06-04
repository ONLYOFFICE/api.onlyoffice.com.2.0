import type {TabContainerElement} from "@github/tab-container-element"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "tab-container": HTMLAttributes<TabContainerElement>
      }
    }
  }
}
