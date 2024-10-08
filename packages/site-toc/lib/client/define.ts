import {TocContainer} from "./element.ts"

declare global {
  interface Window {
    TocContainer: typeof TocContainer
  }

  interface HTMLElementTagNameMap {
    "toc-container": TocContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "toc-container": HTMLAttributes<TocContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(TocContainer.tagName)) {
    return
  }
  window.TocContainer = TocContainer
  window.customElements.define(TocContainer.tagName, TocContainer)
}
