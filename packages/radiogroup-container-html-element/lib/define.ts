import {RadiogroupContainer} from "./element.ts"
import {
  type GlobalRadiogroupContainerChangedHandler,
  type GlobalRadiogroupContainerChangeHandler,
  RadiogroupContainerChangedEvent,
  RadiogroupContainerChangeEvent
} from "./events.ts"

declare global {
  interface Window {
    RadiogroupContainer: typeof RadiogroupContainer
    RadiogroupContainerChangeEvent: typeof RadiogroupContainerChangeEvent
    RadiogroupContainerChangedEvent: typeof RadiogroupContainerChangedEvent
  }

  interface HTMLElementTagNameMap {
    "radiogroup-container": RadiogroupContainer
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "radiogroup-container": HTMLAttributes<RadiogroupContainer>
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    radiogroupcontainerchange: RadiogroupContainerChangeEvent
    radiogroupcontainerchanged: RadiogroupContainerChangedEvent
  }

  interface GlobalEventHandlers {
    onradiogroupcontainerchange: GlobalRadiogroupContainerChangeHandler | null
    onradiogroupcontainerchanged: GlobalRadiogroupContainerChangedHandler | null
  }
}

export function define(): void {
  if (window.customElements.get(RadiogroupContainer.tagName)) {
    return
  }
  window.RadiogroupContainer = RadiogroupContainer
  window.customElements.define(RadiogroupContainer.tagName, RadiogroupContainer)
  window.RadiogroupContainerChangeEvent = RadiogroupContainerChangeEvent
  window.RadiogroupContainerChangedEvent = RadiogroupContainerChangedEvent
}
