import {ComboboxContainer} from "./element.ts"
import type {
  ComboboxContainerChangeEventListener,
  GlobalComboboxContainerChangeHandler
} from "./events.ts"
import {ComboboxContainerChangeEvent} from "./events.ts"

declare global {
  interface Window {
    ComboboxContainer: typeof ComboboxContainer
    ComboboxContainerChangeEvent: typeof ComboboxContainerChangeEvent
  }

  interface HTMLElementTagNameMap {
    "combobox-container": ComboboxContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "combobox-container": HTMLAttributes<ComboboxContainer>
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    comboboxcontainerchange: ComboboxContainerChangeEventListener
  }

  interface GlobalEventHandlers {
    oncomboboxcontainerchange: GlobalComboboxContainerChangeHandler | null
  }
}

export function define(): void {
  if (window.customElements.get(ComboboxContainer.tagName)) {
    return
  }
  window.ComboboxContainer = ComboboxContainer
  window.customElements.define(ComboboxContainer.tagName, ComboboxContainer)
  window.ComboboxContainerChangeEvent = ComboboxContainerChangeEvent
}
