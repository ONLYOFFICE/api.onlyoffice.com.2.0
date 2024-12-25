/* eslint @stylistic/max-len: ["error", {code: 140}] */

import {
  type RadiogroupContainer,
} from "./element.ts"
import {
  type GlobalRadiogroupContainerChangeEventHandler,
  type GlobalRadiogroupContainerChangedEventHandler,
  type RadiogroupContainerChangeEvent,
  type RadiogroupContainerChangedEvent,
} from "./events.ts"
import {
  type RadiogroupContainerAttributeMap,
} from "./types.ts"

declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        [RadiogroupContainer.tagName]: HTMLAttributes<RadiogroupContainer> & Partial<RadiogroupContainerAttributeMap>
      }
    }
  }

  interface Window {
    RadiogroupContainer: typeof RadiogroupContainer
    RadiogroupContainerChangeEvent: typeof RadiogroupContainerChangeEvent
    RadiogroupContainerChangedEvent: typeof RadiogroupContainerChangedEvent
  }

  interface HTMLElementTagNameMap {
    [RadiogroupContainer.tagName]: RadiogroupContainer
  }

  interface GlobalEventHandlersEventMap {
    [RadiogroupContainerChangeEvent.type]: RadiogroupContainerChangeEvent
    [RadiogroupContainerChangedEvent.type]: RadiogroupContainerChangedEvent
  }

  interface GlobalEventHandlers {
    [RadiogroupContainerChangeEvent.handlerName]: GlobalRadiogroupContainerChangeEventHandler | null
    [RadiogroupContainerChangedEvent.handlerName]: GlobalRadiogroupContainerChangedEventHandler | null
  }
}
