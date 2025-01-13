import {
  RadiogroupContainer,
} from "./element.ts"
import {
  RadiogroupContainerChangeEvent,
  RadiogroupContainerChangedEvent,
} from "./events.ts"

export function define(): void {
  if (window.customElements.get(RadiogroupContainer.tagName)) {
    return
  }

  window.RadiogroupContainer = RadiogroupContainer
  window.customElements.define(RadiogroupContainer.tagName, RadiogroupContainer)

  window.RadiogroupContainerChangeEvent = RadiogroupContainerChangeEvent
  window.RadiogroupContainerChangedEvent = RadiogroupContainerChangedEvent
}
