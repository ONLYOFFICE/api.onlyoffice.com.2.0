// todo: Support for all HTMLSelectElement methods and properties.
// https://developer.mozilla.org/en-US/docs/Web/API/HTMLSelectElement/

// todo: Support for general HTMLElement methods such as blur, click, focus.
// https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/click/

// todo: Allow user omit the combobox and listbox elements.

// todo: Reflect aria-attributes (aria-label, aria-labelledby, aria-description,
// aria-describedby) to the combobox and listbox elements from the
// combobox-container element.

// todo: Implement combobox container events.
// todo: Implement type-searching in the combobox.

import type {ComboboxContainerChangeEventListener} from "./events.ts"
import {ComboboxContainerChangeEvent} from "./events.ts"

export type ComboboxContainerAttributeName =
  Exclude<keyof ComboboxContainerAttributes, undefined>

export interface ComboboxContainerAttributes {
  "default-index"?: string
  "disabled"?: string
  "name"?: string
  "page-size"?: string
  "oncomboboxcontainerchange"?: string
}

export type ComboboxContainerEvent =
  Window[ComboboxContainerEventName]

export type ComboboxContainerEventName = Exclude<{
  [K in keyof Window]: K extends `ComboboxContainer${string}Event` ? K : never
}[keyof Window], undefined>

export type ComboboxContainerEventListener =
  GlobalEventHandlersEventMap[ComboboxContainerEventType]

export type ComboboxContainerEventType = {
  [K in keyof GlobalEventHandlersEventMap]: K extends `comboboxcontainer${string}` ? K : never
}[keyof GlobalEventHandlersEventMap]

export type ComboboxContainerEventHandler =
  Exclude<GlobalEventHandlers[ComboboxContainerEventHandlerName], null>

export type ComboboxContainerEventHandlerName = Exclude<{
  [K in keyof GlobalEventHandlers]: K extends `oncomboboxcontainer${string}` ? K : never
}[keyof GlobalEventHandlers], undefined>

/**
 * A accessible combobox container element with keyboard support. Follows the
 * {@link https://www.w3.org/WAI/ARIA/apg/patterns/combobox/ ARIA best practices guide on combobox}.
 */
export class ComboboxContainer extends HTMLElement {
  static get tagName(): string {
    return "combobox-container"
  }

  static get observedAttributes(): ComboboxContainerAttributeName[] {
    return [
      "default-index",
      "disabled",
      "name",
      "page-size",
      "oncomboboxcontainerchange"
    ]
  }

  attributeChangedCallback(n: ComboboxContainerAttributeName, _: string, v: string | null): void {
    switch (n) {
    case "default-index":
      this.#changeDefaultIndex(v)
      break
    case "page-size":
      this.#changePageSize(v)
      break
    case "disabled":
      this.#changeDisabled(v)
      break
    case "name":
      this.#changeName(v)
      break
    case "oncomboboxcontainerchange":
      this.#changeOncomboboxcontainerchange(v)
      break
    default:
      throw new Error(`Attribute '${n}' is not supported`)
    }
  }

  #oncomboboxcontainerchange: ComboboxContainerChangeEventListener | null = null

  get oncomboboxcontainerchange(): ComboboxContainerChangeEventListener | null {
    return this.#oncomboboxcontainerchange
  }

  set oncomboboxcontainerchange(l: ComboboxContainerChangeEventListener | null) {
    if (this.#oncomboboxcontainerchange) {
      this.removeEventListener(ComboboxContainerChangeEvent.type, this.#oncomboboxcontainerchange)
    }
    this.#oncomboboxcontainerchange = l
    if (this.#oncomboboxcontainerchange) {
      this.addEventListener(ComboboxContainerChangeEvent.type, this.#oncomboboxcontainerchange)
    }
  }

  #changeOncomboboxcontainerchange(v: string | null): void {
    let f = null
    if (v !== null) {
      f = new Function("event", v) as ComboboxContainerChangeEventListener
    }
    this.oncomboboxcontainerchange = f
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

  get value(): string {
    const v = this.selectedOption.dataset.value
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

  get expanded(): boolean {
    const ce = this.#combobox
    if (!ce) {
      return false
    }

    const ex = ce.getAttribute("aria-expanded")
    if (ex !== "true") {
      return false
    }

    return true
  }

  get defaultOption(): HTMLElement {
    return this.options[this.defaultIndex]
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

  get firstOption(): HTMLElement {
    return this.options[this.firstIndex]
  }

  get firstIndex(): number {
    return 0
  }

  get lastOption(): HTMLElement {
    return this.options[this.lastIndex]
  }

  get lastIndex(): number {
    return this.options.length - 1
  }

  get nextOption(): HTMLElement {
    return this.options[this.nextIndex]
  }

  get nextIndex(): number {
    return Math.min(this.lastIndex, this.currentIndex + 1)
  }

  get previousOption(): HTMLElement {
    return this.options[this.previousIndex]
  }

  get previousIndex(): number {
    return Math.max(this.firstIndex, this.currentIndex - 1)
  }

  #pageSize = 10

  get pageSize(): number {
    return this.#pageSize
  }

  set pageSize(s: number) {
    this.#pageSize = s
  }

  #changePageSize(v: string | null): void {
    if (v === null) {
      v = "10"
    }

    let n = Number.parseInt(v)
    if (Number.isNaN(n)) {
      n = 10
    }

    this.pageSize = n
  }

  get nextPageOption(): HTMLElement {
    return this.options[this.nextPageIndex]
  }

  get nextPageIndex(): number {
    return Math.min(this.lastIndex, this.currentIndex + this.pageSize)
  }

  get previousPageOption(): HTMLElement {
    return this.options[this.previousPageIndex]
  }

  get previousPageIndex(): number {
    return Math.max(this.firstIndex, this.currentIndex - this.pageSize)
  }

  get currentOption(): HTMLElement {
    return this.options[this.currentIndex]
  }

  get currentIndex(): number {
    for (const [i, o] of this.options.entries()) {
      if (o.matches('[aria-current="true"]')) {
        return i
      }
    }
    return -1
  }

  get selectedOption(): HTMLElement {
    return this.options[this.selectedIndex]
  }

  get selectedIndex(): number {
    for (const [i, o] of this.options.entries()) {
      if (o.matches('[aria-selected="true"]')) {
        return i
      }
    }
    return -1
  }

  set selectedIndex(i: number) {
    this.select(i)
  }

  get #setupIndex(): number {
    let i = this.defaultIndex
    if (i < 0) {
      i = this.selectedIndex
    }
    return Math.max(0, i)
  }

  get #labels(): Set<Node> {
    const cl = this.#comboboxLabels
    const ll = this.#listboxLabels
    return new Set([...cl, ...ll])
  }

  get #beforeComboboxSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="before-combobox"]')
  }

  get #comboboxLabels(): NodeList {
    const c = this.#combobox
    return this.#queryLabels(c)
  }

  get #combobox(): HTMLElement | null {
    const w = this.#comboboxWrapper
    if (!w) {
      return null
    }

    if (w.hasAttribute("role")) {
      return w
    }

    const s = this.#comboboxSlot
    if (!s) {
      return null
    }

    const [e] = s.assignedNodes()
    if (e instanceof HTMLElement) {
      return e
    }

    return null
  }

  get #comboboxWrapper(): HTMLElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('div[name="combobox-wrapper"]')
  }

  get #comboboxSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="combobox"]')
  }

  get #comboboxElement(): HTMLElement | null {
    const e = this.querySelector('[role="combobox"]')
    if (e instanceof HTMLElement && this.#within(e)) {
      return e
    }
    return null
  }

  get #afterComboboxSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="after-combobox"]')
  }

  get #listboxLabels(): NodeList {
    const l = this.#listbox
    return this.#queryLabels(l)
  }

  get #listbox(): HTMLElement | null {
    const w = this.#listboxWrapper
    if (!w) {
      return null
    }

    if (w.hasAttribute("role")) {
      return w
    }

    const s = this.#listboxSlot
    if (!s) {
      return null
    }

    const [e] = s.assignedNodes()
    if (e instanceof HTMLElement) {
      return e
    }

    return null
  }

  get #listboxWrapper(): HTMLElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('div[name="listbox-wrapper"]')
  }

  get #listboxSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="listbox"]')
  }

  get #listboxElement(): HTMLElement | null {
    const e = this.querySelector('[role="listbox"]')
    if (e instanceof HTMLElement && this.#within(e)) {
      return e
    }
    return null
  }

  get options(): HTMLElement[] {
    const le = this.#listbox
    if (!le) {
      return []
    }

    const ae: HTMLElement[] = []

    const ao = le.querySelectorAll('[role="option"]')
    for (const op of ao) {
      if (op instanceof HTMLElement && this.#within(op)) {
        ae.push(op)
      }
    }

    return ae
  }

  get #afterListboxSlot(): HTMLSlotElement | null {
    const r = this.shadowRoot
    if (!r) {
      return null
    }
    return r.querySelector('slot[name="after-listbox"]')!
  }

  #queryLabels(el: HTMLElement | null): NodeList {
    if (!el) {
      return nopNodeList()
    }

    const b = el.getAttribute("aria-labelledby")
    if (!b) {
      return nopNodeList()
    }

    let q = ""

    const a = b.split(" ")
    for (const s of a) {
      q += `#${s}, `
    }

    q = q.slice(0, -2)
    return document.querySelectorAll(q)
  }

  connectedCallback(): void {
    this.#attach()
    this.#create()
    this.#setup()
    this.select(-1)
    this.#listen()
    if (this.disabled) {
      this.#disable()
    }
  }

  disconnectedCallback(): void {
    this.#delisten()
  }

  select(i: number): void {
    if (i < 0) {
      i = this.#setupIndex
    }
    this.#move(i)
    this.#select(i)
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

    const bc = document.createElement("slot")
    bc.setAttribute("name", "before-combobox")
    bc.setAttribute("part", "before-combobox")

    const cw = document.createElement("div")
    cw.setAttribute("name", "combobox-wrapper")
    cw.setAttribute("part", "combobox-wrapper")

    const ac = document.createElement("slot")
    ac.setAttribute("name", "after-combobox")
    ac.setAttribute("part", "after-combobox")

    const cb = document.createElement("slot")
    cb.setAttribute("name", "combobox")
    cb.setAttribute("part", "combobox")
    cw.append(cb)

    const lw = document.createElement("div")
    lw.setAttribute("name", "listbox-wrapper")
    lw.setAttribute("part", "listbox-wrapper")

    const lb = document.createElement("slot")
    lb.setAttribute("name", "listbox")
    lb.setAttribute("part", "listbox")
    lw.append(lb)

    const al = document.createElement("slot")
    al.setAttribute("name", "after-listbox")
    al.setAttribute("part", "after-listbox")

    sr.replaceChildren(bc, cw, ac, lw, al)
  }

  #setup(): void {
    this.#setupListbox()
    this.#setupCombobox()
    this.#setupEdges()
  }

  #setupListbox(): void {
    const ls = this.#listboxSlot
    if (!ls) {
      return
    }

    let le = this.#listboxElement
    if (!le) {
      le = this.#listboxWrapper
      if (!le) {
        return
      }

      le.setAttribute("role", "listbox")
    }

    if (!le.hasAttribute("tabindex")) {
      le.setAttribute("tabindex", "-1")
    }

    ls.assign(le)
  }

  #setupCombobox(): void {
    const le = this.#listbox
    if (!le) {
      return
    }

    const cs = this.#comboboxSlot
    if (!cs) {
      return
    }

    let ce = this.#comboboxElement
    if (!ce) {
      ce = this.#comboboxWrapper
      if (!ce) {
        return
      }

      ce.setAttribute("role", "combobox")
    }

    if (!ce.hasAttribute("aria-activedescendant")) {
      ce.setAttribute("aria-activedescendant", "")
    }

    if (!ce.hasAttribute("aria-controls")) {
      ce.setAttribute("aria-controls", le.id)
    }

    if (!ce.hasAttribute("aria-expanded")) {
      ce.setAttribute("aria-expanded", "false")
    }

    if (!ce.hasAttribute("aria-haspopup")) {
      ce.setAttribute("aria-haspopup", "listbox")
    }

    if (!ce.hasAttribute("tabindex")) {
      ce.setAttribute("tabindex", "0")
    }

    cs.assign(ce)
  }

  #setupEdges(): void {
    const bc: Element[] = []
    const ac: Element[] = []
    const al: Element[] = []
    let au = bc

    for (const el of this.children) {
      switch (true) {
      case isBeforeCombobox(el):
        bc.push(el)
        continue
      case isCombobox(el):
        au = ac
        continue
      case isAfterCombobox(el):
        ac.push(el)
        continue
      case isListbox(el):
        au = al
        continue
      case isAfterListbox(el):
        al.push(el)
        continue
      default:
        au.push(el)
        continue
      }
    }

    let se = this.#beforeComboboxSlot
    if (se) {
      se.assign(...bc)
    }

    se = this.#afterComboboxSlot
    if (se) {
      se.assign(...ac)
    }

    se = this.#afterListboxSlot
    if (se) {
      se.assign(...al)
    }
  }

  #listen(): void {
    window.addEventListener("touchstart", this)
    for (const el of this.#labels) {
      el.addEventListener("click", this)
    }
    this.addEventListener("blur", this)
    this.addEventListener("click", this)
    this.addEventListener("focusout", this)
    this.addEventListener("keydown", this)
  }

  #delisten(): void {
    window.removeEventListener("touchcancel", this)
    for (const el of this.#labels) {
      el.removeEventListener("click", this)
    }
    this.removeEventListener("blur", this)
    this.removeEventListener("click", this)
    this.removeEventListener("focusout", this)
    this.removeEventListener("keydown", this)
  }

  handleEvent(ev: Event): void {
    switch (true) {
    case isBlurEvent(ev) && this.#isSelfEvent(ev):
      this.#handleBlur(ev)
      break
    case isClickEvent(ev) && this.#isSelfEvent(ev):
      this.#handleClick(ev)
      break
    case isFocusoutEvent(ev) && this.#isSelfEvent(ev):
      this.#handleFocusout(ev)
      break
    case isKeydownEvent(ev) && this.#isSelfEvent(ev):
      this.#handleKeydown(ev)
      break
    case isTouchstartEvent(ev) && isWindowEvent(ev):
      this.#handleWindowTouchstart(ev)
      break
    case isClickEvent(ev) && this.#isLabelEvent(ev):
      this.#handleLabelClick()
      break
    default:
      throw new Error(`Event '${ev.type}' is not supported`)
    }
  }

  #handleBlur(ev: FocusEvent): void {
    this.#handleFocusout(ev)
  }

  #handleClick(ev: MouseEvent): void {
    switch (true) {
    case isCombobox(ev.target):
      this.#handleComboboxClick()
      break
    case isOption(ev.target):
      this.#handleOptionClick(ev.target)
      break
    }
  }

  #handleComboboxClick(): void {
    this.#toggleOptions()
  }

  #handleOptionClick(el: HTMLElement): void {
    const i = this.options.indexOf(el)
    this.select(i)
    this.#shrink()
    this.#focus()
  }

  #handleFocusout(ev: FocusEvent): void {
    const le = this.#listbox
    if (!le) {
      return
    }

    const el = ev.relatedTarget
    if (el instanceof Node && le.contains(el)) {
      return
    }

    if (!this.expanded) {
      return
    }

    this.#move(this.selectedIndex)
    this.#shrink()
  }

  #handleKeydown(ev: KeyboardEvent): void {
    switch (true) {
    case isCombobox(ev.target):
      this.#handleComboboxKeydown(ev)
      break
    }
  }

  #handleComboboxKeydown(ev: KeyboardEvent): void {
    const ac = this.#action(ev)
    switch (ac) {
    case "exit":
      this.#handleExitAction(ev)
      break
    case "expand":
      this.#handleExpandAction(ev)
      break
    case "first":
      this.#handleFirstAction(ev)
      break
    case "last":
      this.#handleLastAction(ev)
      break
    case "next":
      this.#handleNextAction(ev)
      break
    case "nextpage":
      this.#handleNextPageAction(ev)
      break
    case "previous":
      this.#handlePreviousAction(ev)
      break
    case "previouspage":
      this.#handlePreviousPageAction(ev)
      break
    case "shrink":
      this.#handleShrinkAction(ev)
      break
    case "type":
      this.#handleTypeAction(ev)
      break
    case "unknown":
      break
    default:
      throw new Error(`Action '${ac}' is not supported`)
    }
  }

  #handleExitAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#move(this.selectedIndex)
    this.#shrink()
    this.#focus()
  }

  #handleExpandAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#expand()
    this.#move(this.selectedIndex)
  }

  #handleFirstAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#expand()
    this.#move(this.firstIndex)
  }

  #handleLastAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#expand()
    this.#move(this.lastIndex)
  }

  #handleNextAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#move(this.nextIndex)
  }

  #handleNextPageAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#move(this.nextPageIndex)
  }

  #handlePreviousAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#move(this.previousIndex)
  }

  #handlePreviousPageAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#move(this.previousPageIndex)
  }

  #handleShrinkAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.select(this.currentIndex)
    this.#shrink()
    this.#focus()
  }

  #handleTypeAction(ev: KeyboardEvent): void {
    ev.preventDefault()
    this.#expand()
    this.#query += ev.key
    const i = this.#search(this.#query)
    if (i === -1) {
      this.#query = ""
      return
    }
    this.#move(i)
  }

  #handleWindowTouchstart(ev: TouchEvent): void {
    const el = ev.target
    if (el instanceof Node && this.contains(el)) {
      return
    }

    if (!this.expanded) {
      return
    }

    this.#move(this.selectedIndex)
    this.#shrink()
  }

  #handleLabelClick(): void {
    this.#focus()
  }

  #enable(): void {
    this.#listen()
  }

  #disable(): void {
    if (this.expanded) {
      this.#shrink()
    }
    this.#delisten()
  }

  #query = ""

  #search(qu: string): number {
    const ao = this.options
    if (ao.length === 0) {
      return -1
    }

    for (const op of ao) {
      const te = op.textContent
      if (!te) {
        continue
      }

      const a = te.toLowerCase()
      const b = qu.toLowerCase()

      if (a.startsWith(b)) {
        return ao.indexOf(op)
      }
    }

    return -1
  }

  #toggleOptions(): void {
    if (this.expanded) {
      this.#shrink()
      return
    }
    this.#expand()
  }

  #expand(): void {
    const ce = this.#combobox
    if (!ce) {
      return
    }

    const le = this.#listbox
    if (!le) {
      return
    }

    ce.setAttribute("aria-expanded", "true")
    le.removeAttribute("hidden")
  }

  #shrink(): void {
    const ce = this.#combobox
    if (!ce) {
      return
    }

    const le = this.#listbox
    if (!le) {
      return
    }

    ce.setAttribute("aria-expanded", "false")
    le.setAttribute("hidden", "")
  }

  #select(i: number): void {
    const ce = this.#combobox
    if (!ce) {
      return
    }

    const ao = this.options
    if (ao.length === 0) {
      return
    }

    if (i > ao.length - 1) {
      throw new RangeError(`Index '${i}' is out of bounds`)
    }

    for (const op of ao) {
      op.setAttribute("aria-selected", "false")
    }

    const se = ao[i]
    se.setAttribute("aria-selected", "true")

    ce.setAttribute("aria-activedescendant", se.id)
    ce.innerHTML = se.innerHTML
  }

  #move(i: number): void {
    const le = this.#listbox
    if (!le) {
      return
    }

    const ao = this.options
    if (ao.length === 0) {
      return
    }

    if (i > ao.length - 1) {
      throw new RangeError(`Index '${i}' is out of bounds`)
    }

    for (const op of ao) {
      op.setAttribute("aria-current", "false")
      op.setAttribute("tabindex", "-1")
    }

    const cu = ao[i]
    cu.setAttribute("aria-current", "true")
    cu.setAttribute("tabindex", "0")

    if (isScrollable(le)) {
      maintainScroll(le, cu)
    }

    if (!inView(cu)) {
      cu.scrollIntoView({behavior: "smooth", block: "nearest"})
    }
  }

  #focus(): void {
    const ce = this.#combobox
    if (!ce) {
      return
    }

    ce.focus()
  }

  #action(ev: KeyboardEvent): Action {
    // todo: Different engines use unique keybindings for the select element.
    // We could identify and apply the correct set of keybindings for each
    // engine individually or amalgamate all possible keybindings.
    // https://developer.mozilla.org/en-US/docs/Web/HTTP/Browser_detection_using_the_user_agent/#rendering_engine

    const ex = this.expanded
    const ak = ev.altKey
    const ck = ev.ctrlKey
    const ke = ev.key
    const mk = ev.metaKey

    switch (true) {
    case !ex && isArrowUpKey(ke):
      return "expand"
    case !ex && isArrowDownKey(ke):
      return "expand"
    case !ex && isPageUpKey(ke):
      return "expand"
    case !ex && isPageDownKey(ke):
      return "expand"
    case !ex && isEnterKey(ke):
      return "expand"
    case !ex && isSpaceKey(ke):
      return "expand"
    case isHomeKey(ke):
      return "first"
    case isEndKey(ke):
      return "last"
    case isBackspaceKey(ke) ||
      isClearKey(ke) ||
      !isSpaceKey(ke) && !ak && !ck && ke.length === 1 && !mk:
      return "type"
    case ex && isArrowUpKey(ke) && ak:
      return "shrink"
    case ex && isArrowDownKey(ke) && !ak:
      return "next"
    case ex && isArrowUpKey(ke):
      return "previous"
    case ex && isPageUpKey(ke):
      return "previouspage"
    case ex && isPageDownKey(ke):
      return "nextpage"
    case ex && isEscapeKey(ke):
      return "exit"
    case ex && (isEnterKey(ke) || isSpaceKey(ke)):
      return "shrink"
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

  #isLabelEvent(ev: unknown): ev is Event {
    return ev instanceof Event &&
      ev.target instanceof Node &&
      this.#labels.has(ev.target)
  }
}

type Action =
  "exit" |
  "expand" |
  "first" |
  "last" |
  "next" |
  "nextpage" |
  "previous" |
  "previouspage" |
  "shrink" |
  "shrink" |
  "type" |
  "unknown"

function isScrollable(el: HTMLElement): boolean {
  return el.clientHeight < el.scrollHeight
}

function maintainScroll(pe: HTMLElement, te: HTMLElement): void {
  const isAbove = te.offsetTop < pe.scrollTop
  if (isAbove) {
    pe.scrollTo(0, te.offsetTop)
    return
  }

  const isBellow = te.offsetTop + te.offsetHeight > pe.scrollTop + pe.offsetHeight
  if (isBellow) {
    pe.scrollTo(0, te.offsetTop - pe.offsetHeight + te.offsetHeight)
    return
  }
}

function inView(el: HTMLElement): boolean {
  const h = window.innerHeight || document.documentElement.clientHeight
  const w = window.innerWidth || document.documentElement.clientWidth
  const r = el.getBoundingClientRect()
  return r.top >= 0 && r.left >= 0 && r.bottom <= h && r.right <= w
}

function isBeforeCombobox(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("slot") === "before-combobox"
}

function isCombobox(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("role") === "combobox"
}

function isAfterCombobox(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("slot") === "after-combobox"
}

function isListbox(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("role") === "listbox"
}

function isOption(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("role") === "option"
}

function isAfterListbox(el: unknown): el is HTMLElement {
  return el instanceof HTMLElement &&
    el.getAttribute("slot") === "after-listbox"
}

function isArrowDownKey(k: unknown): k is "ArrowDown" {
  return k === "ArrowDown"
}

function isArrowUpKey(k: unknown): k is "ArrowUp" {
  return k === "ArrowUp"
}

function isBackspaceKey(k: unknown): k is "Backspace" {
  return k === "Backspace"
}

function isClearKey(k: unknown): k is "Clear" {
  return k === "Clear"
}

function isEndKey(k: unknown): k is "End" {
  return k === "End"
}

function isEnterKey(k: unknown): k is "Enter" {
  return k === "Enter"
}

function isEscapeKey(k: unknown): k is "Escape" {
  return k === "Escape"
}

function isHomeKey(k: unknown): k is "Home" {
  return k === "Home"
}

function isPageDownKey(k: unknown): k is "PageDown" {
  return k === "PageDown"
}

function isPageUpKey(k: unknown): k is "PageUp" {
  return k === "PageUp"
}

function isSpaceKey(k: unknown): k is " " {
  return k === " "
}

function isWindowEvent(ev: unknown): ev is Event {
  return ev instanceof Event && ev.currentTarget === window
}

function isBlurEvent(ev: unknown): ev is FocusEvent {
  return ev instanceof FocusEvent && ev.type === "blur"
}

function isClickEvent(ev: unknown): ev is MouseEvent {
  return ev instanceof MouseEvent && ev.type === "click"
}

function isFocusoutEvent(ev: unknown): ev is FocusEvent {
  return ev instanceof FocusEvent && ev.type === "focusout"
}

function isKeydownEvent(ev: unknown): ev is KeyboardEvent {
  return ev instanceof KeyboardEvent && ev.type === "keydown"
}

function isTouchstartEvent(ev: unknown): ev is TouchEvent {
  return window.TouchEvent !== undefined &&
    ev instanceof TouchEvent &&
    ev.type === "touchstart"
}

function nopNodeList(): NodeList {
  const d = document.createDocumentFragment()
  return d.querySelectorAll("*")
}
