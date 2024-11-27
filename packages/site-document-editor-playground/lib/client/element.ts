/* eslint-disable @typescript-eslint/no-implied-eval, no-new-func */

// todo: resolve ignores
/* eslint-disable @typescript-eslint/no-confusing-void-expression */
/* eslint-disable @typescript-eslint/no-floating-promises */
/* eslint-disable @typescript-eslint/no-misused-promises */

import {ComboboxContainer, ComboboxContainerChangeEvent, ComboboxContainerChangedEvent} from "@onlyoffice/combobox-container-html-element"
import * as configSample from "@onlyoffice/document-editor-code-sample"
import {DocumentEditor, type DocumentEditorEventHandlerName, type DocumentEditorEventType} from "@onlyoffice/document-editor-html-element"
import {DocumentEditorMirror} from "@onlyoffice/document-editor-mirror-html-element"
import {type DocEditorConfigEvents, type DocEditorConfigurableOptions} from "@onlyoffice/document-server-types"
import {type Client} from "@onlyoffice/server-client"
import {deepKeys, getProperty, setProperty} from "dot-prop"
import {DocumentEditorPlaygroundErrorEvent} from "./events.ts"

interface DocumentEditorPlaygroundConfig extends DocEditorConfigurableOptions {
  events?: Record<keyof DocEditorConfigEvents, string>
}

export class DocumentEditorPlayground extends HTMLElement {
  static get tagName(): string {
    return "document-editor-playground"
  }

  get #form(): HTMLFormElement | null {
    return this.querySelector("form")
  }

  get #propertyCombobox(): ComboboxContainer | null {
    const e = this.querySelector('combobox-container[name="property"]')
    if (!e || !(e instanceof ComboboxContainer)) {
      return null
    }
    return e
  }

  get #propertiesContainer(): HTMLElement | null {
    const e = this.querySelector("[data-de-playground-properties-container]")
    if (!e || !(e instanceof HTMLElement)) {
      return null
    }
    return e
  }

  get #eventCombobox(): ComboboxContainer | null {
    const e = this.querySelector('combobox-container[name="event"]')
    if (!e || !(e instanceof ComboboxContainer)) {
      return null
    }
    return e
  }

  get #eventsContainer(): HTMLElement | null {
    const e = this.querySelector("[data-de-playground-events-container]")
    if (!e || !(e instanceof HTMLElement)) {
      return null
    }
    return e
  }

  get #scenarioCombobox(): ComboboxContainer | null {
    const e = this.querySelector('combobox-container[name="scenario"]')
    if (!e || !(e instanceof ComboboxContainer)) {
      return null
    }
    return e
  }

  get #documentEditorMirror(): DocumentEditorMirror | null {
    return this.querySelector("document-editor-mirror")
  }

  get #documentEditor(): DocumentEditor | null {
    return this.querySelector("document-editor")
  }

  get #playButton(): HTMLButtonElement | null {
    return this.querySelector('button[type="submit"][name="action"][value="play"]')
  }

  get #sharedConfig(): DocumentEditorPlaygroundConfig | undefined {
    const p = new URLSearchParams(window.location.search)
    let s = p.get("c")
    if (!s) {
      return undefined
    }
    s = decodeURIComponent(s)
    return JSON.parse(s)
  }

  set #sharedConfig(c: DocumentEditorPlaygroundConfig) {
    let s = JSON.stringify(c)
    let u = window.location.origin + window.location.pathname

    const p = new URLSearchParams(window.location.search)
    if (s === "{}") {
      if (p.has("c")) {
        p.delete("c")
      }
    } else {
      s = encodeURIComponent(s)
      p.set("c", s)
    }

    s = p.toString()
    if (s) {
      u += `?${s}`
    }

    window.history.replaceState({}, "", u)
  }

  get #scenarioConfig(): DocumentEditorPlaygroundConfig {
    const s = this.#scenarioCombobox
    if (!s) {
      return {}
    }

    const o = s.querySelector('[role="option"]')
    if (!o || !(o instanceof HTMLElement)) {
      return {}
    }

    if (!o.dataset.value) {
      return {}
    }

    return JSON.parse(o.dataset.value)
  }

  set #scenarioConfig(c: DocumentEditorPlaygroundConfig) {
    const s = this.#scenarioCombobox
    if (!s) {
      return
    }

    const o = s.querySelector('[role="option"]')
    if (!o || !(o instanceof HTMLElement)) {
      return
    }

    o.dataset.value = JSON.stringify(c)
  }

  get #currentConfig(): DocumentEditorPlaygroundConfig {
    const cf: DocumentEditorPlaygroundConfig = {}

    const pc = this.#propertyCombobox
    if (!pc) {
      return cf
    }

    const ec = this.#eventCombobox
    if (!ec) {
      return cf
    }

    const sc = this.#scenarioCombobox
    if (!sc) {
      return cf
    }

    const cs = this.querySelectorAll("combobox-container, input, textarea")

    for (const c of cs) {
      if (c === pc) {
        continue
      }
      if (c === ec) {
        continue
      }
      if (c === sc) {
        continue
      }

      if (c instanceof ComboboxContainer && c.name) {
        setProperty(cf, c.name, c.value)
        continue
      }

      if (c instanceof HTMLInputElement && c.type === "checkbox" && c.name) {
        setProperty(cf, c.name, c.checked)
        continue
      }

      if (c instanceof HTMLInputElement && c.type === "text" && c.name) {
        setProperty(cf, c.name, c.value)
        continue
      }

      if (c instanceof HTMLTextAreaElement && c.name) {
        setProperty(cf, c.name, c.value)
        continue
      }
    }

    return cf
  }

  #client: Client | undefined

  get client(): Client | undefined {
    return this.#client
  }

  set client(value: Client | undefined) {
    this.#client = value
  }

  #documentEditorHandlers = new Map<DocumentEditorEventHandlerName, string>()

  connectedCallback(): void {
    this.#setup()
    this.#listen()
  }

  #setup(): void {
    let c: DocumentEditorPlaygroundConfig
    const sh = this.#sharedConfig
    if (sh) {
      c = sh
    } else {
      c = this.#scenarioConfig
    }
    this.#renderConfig(c)
    this.#renderSamples()
    this.#clearOutput()
    this.play()
  }

  #listen(): void {
    this.addEventListener("comboboxcontainerchange", this)
    this.addEventListener("comboboxcontainerchanged", this)
    this.addEventListener("change", this)
    this.addEventListener("click", this)

    const fr = this.#form
    if (fr) {
      fr.addEventListener("submit", this)
    }
  }

  handleEvent(e: Event): void {
    if (
      this.#propertyCombobox &&
      e instanceof ComboboxContainerChangeEvent &&
      e.target === this.#propertyCombobox
    ) {
      this.#handlePropertyChange(e)
      return
    }

    if (
      this.#propertyCombobox &&
      e instanceof ComboboxContainerChangeEvent &&
      e.target === this.#eventCombobox
    ) {
      this.#handleEventChange(e)
      return
    }

    if (
      this.#scenarioCombobox &&
      e instanceof ComboboxContainerChangeEvent &&
      e.target === this.#scenarioCombobox
    ) {
      this.#handleScenarioChange(e)
      return
    }

    if (
      this.#propertyCombobox &&
      e instanceof ComboboxContainerChangedEvent &&
      e.target === this.#propertyCombobox
    ) {
      this.#handleComboboxChanged(e)
      return
    }

    if (
      this.#eventCombobox &&
      e instanceof ComboboxContainerChangedEvent &&
      e.target === this.#eventCombobox
    ) {
      this.#handleComboboxChanged(e)
      return
    }

    if (
      e.type === "change" &&
      e.target &&
      e.target instanceof HTMLInputElement &&
      (e.target.type === "checkbox" || e.target.type === "text")
    ) {
      this.#handleInputChange()
      return
    }

    if (
      e.type === "change" &&
      e.target &&
      e.target instanceof HTMLTextAreaElement
    ) {
      this.#handleTextareaChange()
      return
    }

    if (
      e instanceof MouseEvent &&
      e.type === "click" &&
      e.target &&
      e.target instanceof HTMLButtonElement &&
      e.target.name === "remove" &&
      !e.target.value.startsWith("events.")
    ) {
      this.#handlePropertyRemoval(e)
      return
    }

    if (
      e instanceof MouseEvent &&
      e.type === "click" &&
      e.target &&
      e.target instanceof HTMLButtonElement &&
      e.target.name === "remove" &&
      e.target.value.startsWith("events.")
    ) {
      this.#handleEventRemoval(e)
      return
    }

    if (
      this.#playButton &&
      e instanceof SubmitEvent &&
      e.submitter === this.#playButton
    ) {
      this.#handlePlayAction(e)
    }
  }

  #handlePropertyChange(e: ComboboxContainerChangeEvent): void {
    this.#appendProperty(e)
    this.#renderSamples()
  }

  #handleEventChange(e: ComboboxContainerChangeEvent): void {
    this.#appendEvent(e)
    this.#renderSamples()
  }

  #handleScenarioChange(ev: ComboboxContainerChangeEvent): void {
    const op = ev.option
    if (!op) {
      return
    }

    if (!op.dataset.value) {
      return
    }

    this.#removePropertyControllers()
    this.#showPropertyOptions()

    this.#removeEventControllers()
    this.#showEventOptions()

    const cf: DocumentEditorPlaygroundConfig = JSON.parse(op.dataset.value)
    this.#renderConfig(cf)
    this.#renderSamples()

    this.#sharedConfig = cf
  }

  #renderConfig(cf: DocumentEditorPlaygroundConfig): void {
    for (const p of deepKeys(cf)) {
      const v = getProperty(cf, p)
      const c = this.#importControl(p, v)
      if (!c) {
        continue
      }
      this.#appendControl2(p, c)
      this.#hideOption2(p)
    }
  }

  #importControl(p: string, v: unknown): DocumentFragment | undefined {
    const t = this.querySelector(`[data-de-playground-property="${p}"]`)
    if (!t || !(t instanceof HTMLTemplateElement)) {
      return
    }

    const f = document.importNode(t.content, true)
    let c: HTMLElement | null = null

    c = f.querySelector("combobox-container")
    if (c && c instanceof ComboboxContainer) {
      let j = -1

      const s = c.querySelectorAll('[role="option"]')
      for (const [i, e] of s.entries()) {
        if (e instanceof HTMLElement && e.dataset.value === v) {
          j = i
          break
        }
      }

      if (j === -1) {
        return
      }

      c.defaultIndex = j
      return f
    }

    c = f.querySelector('input[type="checkbox"]')
    if (c && c instanceof HTMLInputElement) {
      c.checked = Boolean(v)
      return f
    }

    c = f.querySelector('input[type="text"]')
    if (c && c instanceof HTMLInputElement) {
      c.value = String(v)
      return f
    }

    c = f.querySelector("textarea")
    if (c && c instanceof HTMLTextAreaElement) {
      c.value = String(v)
      return f
    }
  }

  #appendControl2(p: string, n: Node): void {
    const c = this.#resolveContainer(p)
    if (!c) {
      return
    }

    c.append(n)
  }

  #hideOption2(p: string): void {
    const c = this.#resolveCombobox(p)
    if (!c) {
      return
    }

    const o = c.querySelector(`[role="option"][data-value="${p}"]`)
    if (!o || !(o instanceof HTMLElement)) {
      return
    }

    this.#hideOption(c, o)
  }

  #resolveCombobox(p: string): ComboboxContainer | null {
    if (p.startsWith("events.")) {
      return this.#eventCombobox
    }
    return this.#propertyCombobox
  }

  #resolveContainer(p: string): HTMLElement | null {
    if (p.startsWith("events.")) {
      return this.#eventsContainer
    }
    return this.#propertiesContainer
  }

  #handleComboboxChanged(ev: ComboboxContainerChangedEvent): void {
    const cx = ev.target
    if (!cx || !(cx instanceof ComboboxContainer)) {
      return
    }

    const op = ev.option
    if (!op) {
      return
    }

    if (cx.selectedIndex === 0) {
      return
    }

    cx.select(0)
    this.#hideOption(cx, op)
    this.#saveScenario()
    this.#renderSamples()
  }

  #handleInputChange(): void {
    this.#saveScenario()
    this.#renderSamples()
  }

  #handleTextareaChange(): void {
    this.#saveScenario()
    this.#renderSamples()
  }

  #handlePropertyRemoval(ev: MouseEvent): void {
    const cx = this.#propertyCombobox
    if (!cx) {
      return
    }

    const cr = this.#propertiesContainer
    if (!cr) {
      return
    }

    const et = ev.target
    if (!et || !(et instanceof HTMLButtonElement)) {
      return
    }

    const op = cx.querySelector(`[role="option"][data-value="${et.value}"]`)
    if (!op || !(op instanceof HTMLElement)) {
      return
    }

    this.#removeControl(cr, ev)
    this.#showOption(cx, op)
    this.#saveScenario()
    this.#renderSamples()
  }

  #handleEventRemoval(ev: MouseEvent): void {
    const cx = this.#eventCombobox
    if (!cx) {
      return
    }

    const cr = this.#eventsContainer
    if (!cr) {
      return
    }

    const et = ev.target
    if (!et || !(et instanceof HTMLButtonElement)) {
      return
    }

    const op = cx.querySelector(`[role="option"][data-value="${et.value}"]`)
    if (!op || !(op instanceof HTMLElement)) {
      return
    }

    this.#removeControl(cr, ev)
    this.#showOption(cx, op)
    this.#saveScenario()
    this.#renderSamples()
  }

  #handlePlayAction(e: SubmitEvent): void {
    e.preventDefault()
    this.#clearOutput()
    this.play()
    this.#renderSamples()
  }

  #handleDocumentEditorMirrorEvent(me: Event): void {
    if (!(
      DocumentEditorMirror.isDocumentEditorMirrorConsoleErrorEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorConsoleLogEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorThrowEvent(me)
    )) {
      return
    }

    const en = this.#documentEditorHandlers.get(me.source)
    if (!en) {
      return
    }

    const cd = this.querySelector(`[data-de-playground-output-for="events.${en}"]`)
    if (!cd) {
      return
    }

    let m = ""
    if (DocumentEditorMirror.isDocumentEditorMirrorThrowEvent(me)) {
      m = `Error: ${me.error.message}`
    } else {
      m = me.args.join(" ")
    }

    cd.textContent += `${m} (${me.lineno}:${me.colno})\n`
  }

  #removePropertyControllers(): void {
    const c = this.#propertiesContainer
    if (!c) {
      return
    }

    c.innerHTML = ""
  }

  #removeEventControllers(): void {
    const c = this.#eventsContainer
    if (!c) {
      return
    }

    c.innerHTML = ""
  }

  #showPropertyOptions(): void {
    const c = this.#propertyCombobox
    if (!c) {
      return
    }

    for (const o of c.options) {
      this.#showOption(c, o)
    }
  }

  #showEventOptions(): void {
    const c = this.#eventCombobox
    if (!c) {
      return
    }

    for (const o of c.options) {
      this.#showOption(c, o)
    }
  }

  #appendProperty(e: ComboboxContainerChangeEvent): void {
    const c = this.#propertiesContainer
    if (!c) {
      return
    }

    this.#appendControl(c, e)
  }

  #appendEvent(e: ComboboxContainerChangeEvent): void {
    const c = this.#eventsContainer
    if (!c) {
      return
    }

    this.#appendControl(c, e)
  }

  #appendControl(el: HTMLElement, ev: ComboboxContainerChangeEvent): DocumentFragment | undefined {
    const v = ev.optionValue
    if (!v) {
      return
    }

    const t = this.querySelector(`[data-de-playground-property="${v}"]`)
    if (!t || !(t instanceof HTMLTemplateElement)) {
      return
    }

    const f = document.importNode(t.content, true)
    el.append(f)
  }

  #removeControl(el: HTMLElement, ev: MouseEvent): void {
    let t = ev.target

    while (true) {
      if (!t || !(t instanceof HTMLElement) || t === el) {
        break
      }

      for (const c of el.children) {
        if (c instanceof HTMLElement && c === t) {
          c.remove()
          break
        }
      }

      t = t.parentElement
    }
  }

  #hideOption(co: ComboboxContainer, op: HTMLElement): void {
    let t = op

    while (true) {
      if (!t || t === co) {
        break
      }

      const p = t.parentElement
      if (!p) {
        break
      }

      if (p.role === "listbox") {
        t.setAttribute("hidden", "")
        break
      }

      t = p
    }
  }

  #showOption(co: ComboboxContainer, op: HTMLElement): void {
    let t = op

    while (true) {
      if (!t || t === co) {
        break
      }

      const p = t.parentElement
      if (!p) {
        break
      }

      if (p.role === "listbox") {
        t.removeAttribute("hidden")
        break
      }

      t = p
    }
  }

  #saveScenario(): void {
    const s = this.#scenarioCombobox
    if (!s) {
      return
    }

    const c = this.#currentConfig
    this.#scenarioConfig = c
    s.select(0)
    this.#sharedConfig = c
  }

  #clearOutput(): void {
    const o = this.querySelectorAll("[data-de-playground-output-for]")
    for (const e of o) {
      e.textContent = ""
    }
  }

  async play(): Promise<void> {
    const cl = this.#client
    if (!cl) {
      return
    }

    const em = this.#documentEditorMirror
    if (!em) {
      return
    }

    const de = this.#documentEditor
    if (!de) {
      return
    }

    if (!de.editor) {
      de.eventList.add("documenteditorappready")
      de.ondocumenteditorappready = this.play.bind(this)
      return
    }

    de.eventList.remove("documenteditorappready")
    de.ondocumenteditorappready = null

    const cf = this.#currentConfig
    const op: DocEditorConfigurableOptions = cf

    const {events} = cf
    if (cf.events) {
      delete cf.events
    }

    try {
      [de.config] = await cl.documentEditor.sign({empty: false}, op)
    } catch (e) {
      let m = "Failed to sign DocEditor configuration"
      if (e instanceof Error) {
        m += `: ${e.message}`
      }
      const ev = new DocumentEditorPlaygroundErrorEvent({
        bubbles: true,
        error: e,
        message: m,
      })
      this.dispatchEvent(ev)
      return
    }

    for (const [, n] of this.#documentEditorHandlers.entries()) {
      const en = `documenteditor${n.toLocaleLowerCase().slice(2)}` as DocumentEditorEventType
      const hn = `on${en}` as DocumentEditorEventHandlerName
      de.eventList.remove(en)
      de[hn] = null
    }
    this.#documentEditorHandlers.clear()

    em.ondocumenteditormirrorconsoleerror = null
    em.ondocumenteditormirrorconsolelog = null
    em.ondocumenteditormirrorthrow = null

    if (events) {
      for (const [n, fn] of Object.entries(events)) {
        const en = `documenteditor${n.toLocaleLowerCase().slice(2)}` as DocumentEditorEventType

        const hn = `on${en}`
        if (!DocumentEditor.isDocumentEditorEventHandlerName(hn)) {
          const er = new Error(`The '${hn}' (${n}) event does not exist in the DocumentEditor`)
          const ev = new DocumentEditorPlaygroundErrorEvent({
            bubbles: true,
            error: er,
            message: er.message,
          })
          this.dispatchEvent(ev)
          continue
        }

        de.eventList.add(en)
        de[hn] = new Function(fn) as EventListener
        this.#documentEditorHandlers.set(hn, n)
      }

      em.ondocumenteditormirrorconsolelog = this.#handleDocumentEditorMirrorEvent.bind(this)
      em.ondocumenteditormirrorconsoleerror = this.#handleDocumentEditorMirrorEvent.bind(this)
      em.ondocumenteditormirrorthrow = this.#handleDocumentEditorMirrorEvent.bind(this)
    }

    em.connectedCallback()
    de.editor.requestClose()
    de.editor.destroyEditor()
    de.connectedCallback()
  }

  #renderSamples(): void {
    const de = this.#documentEditor
    if (!de) {
      return
    }

    const cf = this.#currentConfig
    delete cf.events

    const op: DocEditorConfigurableOptions = cf

    const sm = this.querySelectorAll("[data-de-playground-config-sample]")
    for (const e of sm) {
      if (!(e instanceof HTMLElement)) {
        continue
      }

      const v = e.dataset.dePlaygroundConfigSample
      if (!v) {
        continue
      }

      let s = ""

      switch (v) {
      case "html":
        s = configSample.html(de.documentServerUrl, op)
        break
      case "js":
        s = configSample.js(op)
        break
      case "json":
        s = configSample.json(op)
        break
      default:
        continue
      }

      e.textContent = s
    }
  }
}
