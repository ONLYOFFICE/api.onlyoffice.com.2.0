import type {ComboboxContainer} from "./element.ts"

export class ComboboxContainerChangeEvent extends Event {
  static get type(): string {
    return "comboboxcontainerchange"
  }

  constructor(eventInitDict?: EventInit) {
    super(ComboboxContainerChangeEvent.type, eventInitDict)
  }
}

export interface ComboboxContainerChangeEventListener extends EventListener {
  (this: ComboboxContainer, ev: ComboboxContainerChangeEvent): void
}

export interface GlobalComboboxContainerChangeHandler {
  (this: GlobalEventHandlers, ev: ComboboxContainerChangeEvent): void
}
