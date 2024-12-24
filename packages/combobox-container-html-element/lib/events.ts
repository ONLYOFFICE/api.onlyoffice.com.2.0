import {type ComboboxContainer} from "./element.ts"

export interface ComboboxContainerEventInit extends EventInit {
  option?: HTMLElement
  optionIndex?: number
  optionValue?: string
}

class ComboboxContainerEvent extends Event {
  #option?: HTMLElement

  get option(): HTMLElement | undefined {
    return this.#option
  }

  #optionIndex?: number

  get optionIndex(): number | undefined {
    return this.#optionIndex
  }

  #optionValue?: string

  get optionValue(): string | undefined {
    return this.#optionValue
  }

  constructor(type: string, eventInitDict: ComboboxContainerEventInit) {
    super(type, eventInitDict)
    this.#option = eventInitDict.option
    this.#optionIndex = eventInitDict.optionIndex
    this.#optionValue = eventInitDict.optionValue
  }
}

export class ComboboxContainerChangeEvent extends ComboboxContainerEvent {
  static get handlerName(): `on${typeof ComboboxContainerChangeEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "comboboxcontainerchange" {
    return "comboboxcontainerchange"
  }

  constructor(eventInitDict: ComboboxContainerEventInit) {
    super(ComboboxContainerChangeEvent.type, eventInitDict)
  }
}

export interface ComboboxContainerChangeEventListener extends EventListener {
  (this: ComboboxContainer, ev: ComboboxContainerChangeEvent): void
}

export interface GlobalComboboxContainerChangeEventHandler {
  (this: GlobalEventHandlers, ev: ComboboxContainerChangeEvent): void
}

export class ComboboxContainerChangedEvent extends ComboboxContainerEvent {
  static get handlerName(): `on${typeof ComboboxContainerChangedEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "comboboxcontainerchanged" {
    return "comboboxcontainerchanged"
  }

  constructor(eventInitDict: ComboboxContainerEventInit) {
    super(ComboboxContainerChangedEvent.type, eventInitDict)
  }
}

export interface ComboboxContainerChangedEventListener extends EventListener {
  (this: ComboboxContainer, ev: ComboboxContainerChangedEvent): void
}

export interface GlobalComboboxContainerChangedEventHandler {
  (this: GlobalEventHandlers, ev: ComboboxContainerChangedEvent): void
}
