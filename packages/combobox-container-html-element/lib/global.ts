/* eslint @stylistic/max-len: ["error", {code: 140}] */

import {
  type ComboboxContainer,
} from "./element.ts"
import {
  type ComboboxContainerChangeEvent,
  type ComboboxContainerChangedEvent,
  type GlobalComboboxContainerChangeEventHandler,
  type GlobalComboboxContainerChangedEventHandler,
} from "./events.ts"
import {
  type ComboboxContainerAttributeMap,
} from "./types.ts"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        [ComboboxContainer.tagName]: HTMLAttributes<ComboboxContainer> & Partial<ComboboxContainerAttributeMap>
      }
    }
  }

  interface Window {
    ComboboxContainer: typeof ComboboxContainer
    ComboboxContainerChangeEvent: typeof ComboboxContainerChangeEvent
    ComboboxContainerChangedEvent: typeof ComboboxContainerChangedEvent
  }

  interface HTMLElementTagNameMap {
    [ComboboxContainer.tagName]: ComboboxContainer
  }

  interface GlobalEventHandlersEventMap {
    [ComboboxContainerChangeEvent.type]: ComboboxContainerChangeEvent
    [ComboboxContainerChangedEvent.type]: ComboboxContainerChangedEvent
  }

  interface GlobalEventHandlers {
    [ComboboxContainerChangeEvent.handlerName]: GlobalComboboxContainerChangeEventHandler | null
    [ComboboxContainerChangedEvent.handlerName]: GlobalComboboxContainerChangedEventHandler | null
  }
}
