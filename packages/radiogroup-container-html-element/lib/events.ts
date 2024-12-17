import {type RadiogroupContainer} from "./element.ts"

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

  constructor(type: string, d: RadiogroupContainerChangeEventInit) {
    super(type, d)
    this.#radio = d.radio
    this.#radioIndex = d.radioIndex
    this.#radioValue = d.radioValue
  }
}

export interface RadiogroupContainerChangeEventInit extends EventInit {
  radio?: HTMLElement
  radioIndex?: number
  radioValue?: string
}

export class RadiogroupContainerChangeEvent extends RadiogroupContainerEvent {
  static get handlerName(): `on${typeof RadiogroupContainerChangeEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "radiogroupcontainerchange" {
    return "radiogroupcontainerchange"
  }

  constructor(d: RadiogroupContainerChangeEventInit) {
    super(RadiogroupContainerChangeEvent.type, d)
  }
}

export interface RadiogroupContainerChangeEventListener extends EventListener {
  (this: RadiogroupContainer, ev: RadiogroupContainerChangeEvent): void
}

export interface GlobalRadiogroupContainerChangeEventHandler {
  (this: GlobalEventHandlers, ev: RadiogroupContainerChangeEvent): void
}

export class RadiogroupContainerChangedEvent extends RadiogroupContainerEvent {
  static get handlerName(): `on${typeof RadiogroupContainerChangedEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "radiogroupcontainerchanged" {
    return "radiogroupcontainerchanged"
  }

  constructor(d: RadiogroupContainerChangeEventInit) {
    super(RadiogroupContainerChangedEvent.type, d)
  }
}

export interface RadiogroupContainerChangedEventListener extends EventListener {
  (this: RadiogroupContainer, ev: RadiogroupContainerChangedEvent): void
}

export interface GlobalRadiogroupContainerChangedEventHandler {
  (this: GlobalEventHandlers, ev: RadiogroupContainerChangedEvent): void
}
