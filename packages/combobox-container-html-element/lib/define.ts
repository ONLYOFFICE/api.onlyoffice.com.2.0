import {
  ComboboxContainer,
} from "./element.ts"
import {
  ComboboxContainerChangeEvent,
  ComboboxContainerChangedEvent,
} from "./events.ts"

export function define(): void {
  if (window.customElements.get(ComboboxContainer.tagName)) {
    return
  }

  window.ComboboxContainer = ComboboxContainer
  window.customElements.define(ComboboxContainer.tagName, ComboboxContainer)

  window.ComboboxContainerChangeEvent = ComboboxContainerChangeEvent
  window.ComboboxContainerChangedEvent = ComboboxContainerChangedEvent
}
