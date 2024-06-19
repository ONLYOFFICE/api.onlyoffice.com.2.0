/* eslint @stylistic/max-len: ["error", {code: 140}] */

// todo: See the demo/index.html for unsupported use cases.

import {
  type RadiogroupContainerChangeEventListener,
  type RadiogroupContainerChangedEventListener,
  RadiogroupContainerChangeEvent,
  RadiogroupContainerChangedEvent
} from "./events.ts"

export type RadiogroupContainerAttributeName =
  Exclude<keyof RadiogroupContainerAttributes, undefined>

export interface RadiogroupContainerAttributes {
  "default-index"?: string
  "default-value"?: string
  "disabled"?: string
  "name"?: string
  "onradiogroupcontainerchange"?: string
  "onradiogroupcontainerchanged"?: string
}

export type RadiogroupContainerEvent =
  Window[RadiogroupContainerEventName]

export type RadiogroupContainerEventName = Exclude<{
  [K in keyof Window]: K extends `RadiogroupContainer${string}Event` ? K : never
}[keyof Window], undefined>

export type RadiogroupContainerEventListener =
  GlobalEventHandlersEventMap[RadiogroupContainerEventType]

export type RadiogroupContainerEventType = {
  [K in keyof GlobalEventHandlersEventMap]: K extends `radiogroupcontainer${string}` ? K : never
}[keyof GlobalEventHandlersEventMap]

export type RadiogroupContainerEventHandler =
  Exclude<GlobalEventHandlers[RadiogroupContainerEventHandlerName], null>

export type RadiogroupContainerEventHandlerName = Exclude<{
  [K in keyof GlobalEventHandlers]: K extends `onradiogroupcontainer${string}` ? K : never
}[keyof GlobalEventHandlers], undefined>

/**
 * A accessible radiogroup container element with keyboard support. Follows the
 * {@link https://www.w3.org/WAI/ARIA/apg/patterns/radio/ ARIA best practices guide on radiogroup}.
 */
export class RadiogroupContainer extends HTMLElement {
  static get tagName(): string {
    return "radiogroup-container"
  }

  static get observedAttributes(): RadiogroupContainerAttributeName[] {
    return [
      "default-index",
      "default-value",
      "disabled",
      "name",
      "onradiogroupcontainerchange",
      "onradiogroupcontainerchanged"
    ]
  }

  attributeChangedCallback(n: RadiogroupContainerAttributeName, _: string, v: string | null): void {
    switch (n) {
    case "default-index":
      this.#changeDefaultIndex(v)
      break
    case "default-value":
      this.#changeDefaultValue(v)
      break
    case "disabled":
      this.#changeDisabled(v)
      break
    case "name":
      this.#changeName(v)
      break
    case "onradiogroupcontainerchange":
      this.#changeOnradiogroupcontainerchange(v)
      break
    case "onradiogroupcontainerchanged":
      this.#changeOnradiogroupcontainerchanged(v)
      break
    default:
      throw new Error(`Attribute '${n}' is not supported`)
    }
  }

  #onradiogroupcontainerchange: RadiogroupContainerChangeEventListener | null = null

  get onradiogroupcontainerchange(): RadiogroupContainerChangeEventListener | null {
    return this.#onradiogroupcontainerchange
  }

  set onradiogroupcontainerchange(l: RadiogroupContainerChangeEventListener | null) {
    if (this.#onradiogroupcontainerchange) {
      this.removeEventListener(RadiogroupContainerChangeEvent.type, this.#onradiogroupcontainerchange)
    }
    this.#onradiogroupcontainerchange = l
    if (this.#onradiogroupcontainerchange) {
      this.addEventListener(RadiogroupContainerChangeEvent.type, this.#onradiogroupcontainerchange)
    }
  }

  #changeOnradiogroupcontainerchange(v: string | null): void {
    let f = null
    if (v !== null) {
      f = new Function("event", v) as RadiogroupContainerChangeEventListener
    }
    this.onradiogroupcontainerchange = f
  }

  #onradiogroupcontainerchanged: RadiogroupContainerChangedEventListener | null = null

  get onradiogroupcontainerchanged(): RadiogroupContainerChangedEventListener | null {
    return this.#onradiogroupcontainerchanged
  }

  set onradiogroupcontainerchanged(l: RadiogroupContainerChangedEventListener | null) {
    if (this.#onradiogroupcontainerchanged) {
      this.removeEventListener(RadiogroupContainerChangedEvent.type, this.#onradiogroupcontainerchanged)
    }
    this.#onradiogroupcontainerchanged = l
    if (this.#onradiogroupcontainerchanged) {
      this.addEventListener(RadiogroupContainerChangedEvent.type, this.#onradiogroupcontainerchanged)
    }
  }

  #changeOnradiogroupcontainerchanged(v: string | null): void {
    let f = null
    if (v !== null) {
      f = new Function("event", v) as RadiogroupContainerChangedEventListener
    }
    this.onradiogroupcontainerchanged = f
  }

  #internals: ElementInternals | null = null

  static formAssociated = true

  get form(): HTMLFormElement | null {
    const t = this.#internals
    if (!t) {
      return null
    }
    return t.form
  }

  get labels(): NodeList {
    const t = this.#internals
    if (!t) {
      return nopNodeList()
    }
    return t.labels
  }

  #name: string | null = null

  get name(): string | null {
    return this.#name
  }

  set name(n: string | null) {
    this.#name = n
  }

  #changeName(v: string | null): void {
    this.name = v
  }

  #defaultValue: string | null = null

  get defaultValue(): string | null {
    return this.#defaultValue
  }

  set defaultValue(v: string | null) {
    this.#defaultValue = v
  }

  #changeDefaultValue(v: string | null): void {
    this.defaultValue = v
  }

  get value(): string {
    const v = this.checkedRadio.dataset.value
    if (v) {
      return v
    }
    return ""
  }

  #disabled = false

  get disabled(): boolean {
    return this.#disabled
  }

  set disabled(d: boolean) {
    this.#disabled = d
    if (d) {
      this.#disable()
      return
    }
    this.#enable()
  }

  #changeDisabled(v: string | null): void {
    let d = true
    if (v === null) {
      d = false
    }
    this.disabled = d
  }

  get defaultOption(): HTMLElement {
    return this.radios[this.defaultIndex]
  }

  #defaultIndex = -1

  get defaultIndex(): number {
    return this.#defaultIndex
  }

  set defaultIndex(i: number) {
    this.#defaultIndex = i
  }

  #changeDefaultIndex(v: string | null): void {
    if (v === null) {
      v = "-1"
    }

    let n = Number.parseInt(v)
    if (Number.isNaN(n)) {
      n = -1
    }

    this.defaultIndex = n
  }

  get firstRadio(): HTMLElement {
    return this.radios[this.firstIndex]
  }

  get firstIndex(): number {
    return 0
  }

  get lastRadio(): HTMLElement {
    return this.radios[this.lastIndex]
  }

  get lastIndex(): number {
    return this.radios.length - 1
  }

  get nextRadio(): HTMLElement {
    return this.radios[this.nextIndex]
  }

  get nextIndex(): number {
    return Math.min(this.lastIndex, this.checkedIndex + 1)
  }

  get previousRadio(): HTMLElement {
    return this.radios[this.previousIndex]
  }

  get previousIndex(): number {
    return Math.max(this.firstIndex, this.checkedIndex - 1)
  }

  get checkedRadio(): HTMLElement {
    return this.radios[this.checkedIndex]
  }

  get checkedIndex(): number {
    for (const [i, r] of this.radios.entries()) {
      if (r.matches('[aria-checked="true"]')) {
        return i
      }
    }
    return -1
  }

  set checkedIndex(i: number) {
    this.check(i)
  }

  get #setupIndex(): number {
    let i = this.checkedIndex
    if (i !== -1) {
      return Math.max(0, i)
    }

    const v = this.#defaultValue
    if (v !== null) {
      for (const [j, r] of this.radios.entries()) {
        if (r.matches(`[data-value=${v}]`)) {
          i = j
          break
        }
      }
    }

    if (i === -1) {
      i = this.defaultIndex
    }

    return Math.max(0, i)
  }

  get #beforeRadiogroupSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="before-radiogroup"]')
  }

  get #radiogroup(): HTMLElement | null {
    const w = this.#radiogroupWrapper
    if (!w) {
      return null
    }

    if (w.hasAttribute("role")) {
      return w
    }

    const s = this.#radiogroupSlot
    if (!s) {
      return null
    }

    const [e] = s.assignedNodes()
    if (e instanceof HTMLElement) {
      return e
    }

    return null
  }

  get #radiogroupWrapper(): HTMLDivElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('div[name="radiogroup-wrapper"]')
  }

  get #radiogroupSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="radiogroup"]')
  }

  get #radiogroupElement(): HTMLElement | null {
    const e = this.querySelector('[role="radiogroup"]')
    if (e instanceof HTMLElement && this.#within(e)) {
      return e
    }
    return null
  }

  get radios(): HTMLElement[] {
    const rg = this.#radiogroup
    if (!rg) {
      return []
    }

    const rw = this.#radiogroupWrapper
    if (rw && rg === rw) {
      const rs = this.#radiogroupSlot
      if (!rs) {
        return []
      }
      return rs.assignedNodes() as HTMLElement[]
    }

    const ae: HTMLElement[] = []

    const ar = rg.querySelectorAll('[role="radio"]')
    for (const ra of ar) {
      if (ra instanceof HTMLElement && this.#within(ra)) {
        ae.push(ra)
      }
    }

    return ae
  }

  get #afterRadiogroupSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="after-radiogroup"]')
  }

  connectedCallback(): void {
    this.#attach()
    this.#create()
    this.#setup()
    this.#listen()
    if (this.disabled) {
      this.#disable()
    }
  }

  disconnectedCallback(): void {
    this.#delisten()
  }

  check(i: number): void {
    if (i < 0) {
      i = this.#setupIndex
    }
    this.#check(i)
  }

  #attach(): void {
    if (this.attachInternals) {
      this.#internals = this.attachInternals()
    }
    if (!this.shadowRoot) {
      this.attachShadow({mode: "open", slotAssignment: "manual"})
    }
  }

  #create(): void {
    const sr = this.shadowRoot
    if (!sr) {
      return
    }

    const br = document.createElement("slot")
    br.setAttribute("name", "before-radiogroup")
    br.setAttribute("part", "before-radiogroup")

    const rw = document.createElement("div")
    rw.setAttribute("name", "radiogroup-wrapper")
    rw.setAttribute("part", "radiogroup-wrapper")

    const rg = document.createElement("slot")
    rg.setAttribute("name", "radiogroup")
    rg.setAttribute("part", "radiogroup")
    rw.append(rg)

    const ar = document.createElement("slot")
    ar.setAttribute("name", "after-radiogroup")
    ar.setAttribute("part", "after-radiogroup")

    sr.replaceChildren(br, rw, ar)
  }

  #setup(): void {
    this.#setupRadiogroup()
    this.#setupRadios()
    this.#setupEdges()
    this.#check(this.#setupIndex, true)
  }

  #setupRadiogroup(): void {
    const rs = this.#radiogroupSlot
    if (!rs) {
      return
    }

    let re = this.#radiogroupElement
    if (!re) {
      re = this.#radiogroupWrapper
      if (!re) {
        return
      }
      re.setAttribute("role", "radiogroup")
    }

    rs.assign(re)
  }

  #setupRadios(): void {
    const rg = this.#radiogroup
    const rw = this.#radiogroupWrapper
    if (rg !== rw) {
      return
    }

    const rs = this.#radiogroupSlot
    if (!rs) {
      return
    }

    const ae: HTMLElement[] = []

    for (const ch of this.children) {
      if (isRadio(ch)) {
        ae.push(ch)
      }
    }

    rs.assign(...ae)
  }

  #setupEdges(): void {
    const br: Element[] = []
    const ar: Element[] = []
    let au = br

    for (const el of this.children) {
      switch (true) {
      case isBeforeRadiogroup(el):
        br.push(el)
        continue
      case isRadiogroup(el):
        au = ar
        continue
      case isRadio(el):
        au = ar
        continue
      case isAfterRadiogroup(el):
        ar.push(el)
        continue
      default:
        au.push(el)
        continue
      }
    }

    let sl = this.#beforeRadiogroupSlot
    if (sl) {
      sl.assign(...br)
    }

    sl = this.#afterRadiogroupSlot
    if (sl) {
      sl.assign(...ar)
    }
  }

  #listen(): void {
    // for (const el of this.#labels) {
    //   el.addEventListener("click", this)
    // }
    this.addEventListener("click", this)
    this.addEventListener("keydown", this)
  }

  #delisten(): void {
    // for (const el of this.#labels) {
    //   el.removeEventListener("click", this)
    // }
  }

  handleEvent(ev: Event): void {
    switch (true) {
    case isClickEvent(ev) && this.#isSelfEvent(ev):
      this.#handleClick(ev)
      break
    case isKeydownEvent(ev) && this.#isSelfEvent(ev):
      this.#handleKeydown(ev)
      break
    default:
      throw new Error(`Event '${ev.type}' is not supported`)
    }
  }

  #handleClick(ev: MouseEvent): void {
    switch (true) {
    case isRadio(ev.target):
      this.#handleRadioClick(ev)
      break
    }
  }

  #handleRadioClick(ev: MouseEvent): void {
    this.#handleCheck(ev)
  }

  #handleKeydown(ev: KeyboardEvent): void {
    switch (true) {
    case isRadio(ev.target):
      this.#handleRadioKeydown(ev)
      break
    }
  }

  #handleRadioKeydown(ev: KeyboardEvent): void {
    const ac = this.#action(ev)
    switch (true) {
    case ac === "check":
      this.#handleCheckAction(ev)
      break
    case ac === "next":
      this.#handleNextAction(ev)
      break
    case ac === "previous":
      this.#handlePreviousAction(ev)
      break
    case ac === "unknown":
      break
    default:
      throw new Error(`Action '${ac}' is not supported`)
    }
  }

  #handleCheckAction(ev: KeyboardEvent): void {
    this.#handleCheck(ev)
  }

  #handleNextAction(ev: KeyboardEvent): void {
    const el = ev.target
    if (!(el instanceof HTMLElement)) {
      return
    }
    ev.preventDefault()
    ev.stopPropagation()
    let i: number
    if (el === this.lastRadio) {
      i = this.firstIndex
    } else {
      i = this.nextIndex
    }
    this.check(i)
    this.checkedRadio.focus()
  }

  #handlePreviousAction(ev: KeyboardEvent): void {
    const el = ev.target
    if (!(el instanceof HTMLElement)) {
      return
    }
    ev.preventDefault()
    ev.stopPropagation()
    let i: number
    if (el === this.firstRadio) {
      i = this.lastIndex
    } else {
      i = this.previousIndex
    }
    this.check(i)
    this.checkedRadio.focus()
  }

  #handleCheck(ev: Event): void {
    const el = ev.target
    if (!(el instanceof HTMLElement)) {
      return
    }
    ev.preventDefault()
    ev.stopPropagation()
    const i = this.radios.indexOf(el)
    this.check(i)
    this.checkedRadio.focus()
  }

  #enable(): void {
    this.#listen()
  }

  #disable(): void {
    this.#delisten()
  }

  #check(i: number, silent = false): void {
    const rg = this.#radiogroup
    if (!rg) {
      return
    }

    const ar = this.radios
    if (ar.length === 0) {
      return
    }

    if (i > ar.length - 1) {
      throw new RangeError(`Index '${i}' is out of bounds`)
    }

    const ch = ar[i]

    if (!silent) {
      const ce = new RadiogroupContainerChangeEvent({
        bubbles: true,
        cancelable: true,
        radio: ch,
        radioIndex: i,
        radioValue: ch.dataset.value
      })
      const co = this.dispatchEvent(ce)
      if (!co) {
        return
      }
    }

    for (const ra of ar) {
      ra.setAttribute("aria-checked", "false")
      ra.setAttribute("tabindex", "-1")
    }

    ch.setAttribute("aria-checked", "true")
    ch.setAttribute("tabindex", "0")

    if (!silent) {
      const de = new RadiogroupContainerChangedEvent({
        bubbles: true,
        radio: ch,
        radioIndex: i,
        radioValue: ch.dataset.value
      })
      this.dispatchEvent(de)
    }
  }

  #action(ev: KeyboardEvent): Action {
    switch (true) {
    case isArrowDownKey(ev.key):
      return "next"
    case isArrowLeftKey(ev.key):
      return "previous"
    case isArrowRightKey(ev.key):
      return "next"
    case isArrowUpKey(ev.key):
      return "previous"
    case isEnterKey(ev.key):
      return "check"
    case isSpaceKey(ev.key):
      return "check"
    default:
      return "unknown"
    }
  }

  #within(el: HTMLElement): boolean {
    return el.closest(this.tagName) === this
  }

  #isSelfEvent(ev: unknown): ev is Event {
    return ev instanceof Event && ev.currentTarget === this
  }

  // #isLabelEvent(ev: unknown): ev is Event {
  //   return ev instanceof Event &&
  //     ev.target instanceof Node &&
  //     this.#labels.has(ev.target)
  // }
}

type Action = "check" | "next" | "previous" | "unknown"

function isBeforeRadiogroup(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("slot") === "before-radiogroup"
}

function isRadiogroup(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("role") === "radiogroup"
}

function isRadio(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("role") === "radio"
}

function isAfterRadiogroup(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("slot") === "after-radiogroup"
}

function nopNodeList(): NodeList {
  const d = document.createDocumentFragment()
  return d.querySelectorAll("*")
}

function isArrowDownKey(k: unknown): k is "ArrowDown" {
  return k === "ArrowDown"
}

function isArrowLeftKey(k: unknown): k is "ArrowLeft" {
  return k === "ArrowLeft"
}

function isArrowRightKey(k: unknown): k is "ArrowRight" {
  return k === "ArrowRight"
}

function isArrowUpKey(k: unknown): k is "ArrowUp" {
  return k === "ArrowUp"
}

function isEnterKey(k: unknown): k is "Enter" {
  return k === "Enter"
}

function isSpaceKey(k: unknown): k is " " {
  return k === " "
}

function isClickEvent(ev: unknown): ev is MouseEvent {
  return ev instanceof MouseEvent && ev.type === "click"
}

function isKeydownEvent(ev: unknown): ev is KeyboardEvent {
  return ev instanceof KeyboardEvent && ev.type === "keydown"
}
