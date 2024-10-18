import {MenubarContainer} from "./element.ts"

declare global {
  interface Window {
    MenubarContainer: typeof MenubarContainer
  }

  interface HTMLElementTagNameMap {
    "menubar-container": MenubarContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "menubar-container": HTMLAttributes<MenubarContainer>
      }
    }
  }
}

export function define(): void {
  if (window.customElements.get(MenubarContainer.tagName)) {
    return
  }
  window.MenubarContainer = MenubarContainer
  window.customElements.define(MenubarContainer.tagName, MenubarContainer)
}
