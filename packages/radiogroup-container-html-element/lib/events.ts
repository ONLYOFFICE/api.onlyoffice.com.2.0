import type {RadiogroupContainer} from "./element.ts"

class RadiogroupContainerEvent extends Event {
  #radio?: HTMLElement

  get radio(): HTMLElement | undefined {
    return this.#radio
  }

  #radioIndex?: number

  get radioIndex(): number | undefined {
    return this.#radioIndex
  }

  #radioValue?: string

  get radioValue(): string | undefined {
    return this.#radioValue
  }

  constructor(type: string, eventInitDict: RadiogroupContainerChangeEventInit) {
    super(type, eventInitDict)
    this.#radio = eventInitDict.radio
    this.#radioIndex = eventInitDict.radioIndex
    this.#radioValue = eventInitDict.radioValue
  }
}

export interface RadiogroupContainerChangeEventInit extends EventInit {
  radio?: HTMLElement
  radioIndex?: number
  radioValue?: string
}

export class RadiogroupContainerChangeEvent extends RadiogroupContainerEvent {
  static get type(): string {
    return "radiogroupcontainerchange"
  }

  constructor(eventInitDict: RadiogroupContainerChangeEventInit) {
    super(RadiogroupContainerChangeEvent.type, eventInitDict)
  }
}

export interface RadiogroupContainerChangeEventListener extends EventListener {
  (this: RadiogroupContainer, ev: RadiogroupContainerChangeEvent): void
}

export interface GlobalRadiogroupContainerChangeHandler {
  (this: GlobalEventHandlers, ev: RadiogroupContainerChangeEvent): void
}

export class RadiogroupContainerChangedEvent extends RadiogroupContainerEvent {
  static get type(): string {
    return "radiogroupcontainerchanged"
  }

  constructor(eventInitDict: RadiogroupContainerChangeEventInit) {
    super(RadiogroupContainerChangedEvent.type, eventInitDict)
  }
}

export interface RadiogroupContainerChangedEventListener extends EventListener {
  (this: RadiogroupContainer, ev: RadiogroupContainerChangedEvent): void
}

export interface GlobalRadiogroupContainerChangedHandler {
  (this: GlobalEventHandlers, ev: RadiogroupContainerChangedEvent): void
}
