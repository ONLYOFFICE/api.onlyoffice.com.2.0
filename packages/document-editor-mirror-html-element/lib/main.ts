/* eslint @stylistic/max-len: ["error", {code: 140}] */
import {callerPosition} from "@onlyoffice/caller-position"
import type {DocumentEditorEventHandlerName} from "@onlyoffice/document-editor-html-element"
import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import {substringPosition} from "@onlyoffice/substring-position"

declare global {
  interface Window {
    DocumentEditorMirror: typeof DocumentEditorMirror
    DocumentEditorMirrorConsoleEvent: typeof DocumentEditorMirrorConsoleEvent
    DocumentEditorMirrorConsoleErrorEvent: typeof DocumentEditorMirrorConsoleErrorEvent
    DocumentEditorMirrorConsoleLogEvent: typeof DocumentEditorMirrorConsoleLogEvent
    DocumentEditorMirrorErrorEvent: typeof DocumentEditorMirrorErrorEvent
    DocumentEditorMirrorThrowEvent: typeof DocumentEditorMirrorThrowEvent
  }

  interface HTMLElementTagNameMap {
    "document-editor-mirror": DocumentEditorMirror
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor-mirror": Partial<Omit<DocumentEditorMirror, keyof HTMLElement>> & JSXBase["span"]
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    documenteditormirrorconsoleerror: DocumentEditorMirrorConsoleErrorEvent
    documenteditormirrorconsolelog: DocumentEditorMirrorConsoleLogEvent
    documenteditormirrorerror: DocumentEditorMirrorErrorEvent
    documenteditormirrorthrow: DocumentEditorMirrorThrowEvent
  }

  interface GlobalEventHandlers {
    ondocumenteditormirrorconsoleerror: GlobalDocumentEditorMirrorConsoleErrorEventHandler | null
    ondocumenteditormirrorconsolelog: GlobalDocumentEditorMirrorConsoleLogEventHandler | null
    ondocumenteditormirrorerror: GlobalDocumentEditorMirrorErrorHandler | null
    ondocumenteditormirrorthrow: GlobalDocumentEditorMirrorThrowEventHandler | null
  }
}

function main(): void {
  if (window.customElements.get(DocumentEditorMirror.tagName)) {
    return
  }
  window.DocumentEditorMirror = DocumentEditorMirror
  window.customElements.define(DocumentEditorMirror.tagName, DocumentEditorMirror)
  window.DocumentEditorMirrorConsoleEvent = DocumentEditorMirrorConsoleEvent
  window.DocumentEditorMirrorConsoleErrorEvent = DocumentEditorMirrorConsoleErrorEvent
  window.DocumentEditorMirrorConsoleLogEvent = DocumentEditorMirrorConsoleLogEvent
  window.DocumentEditorMirrorErrorEvent = DocumentEditorMirrorErrorEvent
  window.DocumentEditorMirrorThrowEvent = DocumentEditorMirrorThrowEvent
}

interface InternalWindow extends Window {
  Function: FunctionConstructor
  console: Console
  onthrow: ThrowPseudoEventListener
}

interface ThrowPseudoEventListener {
  (this: InternalWindow, error: Error): void
}

export class DocumentEditorMirror extends HTMLElement {
  static get tagName(): string {
    return "document-editor-mirror"
  }

  static isDocumentEditorMirrorConsoleErrorEvent(e: Event): e is DocumentEditorMirrorConsoleErrorEvent {
    return e instanceof DocumentEditorMirrorConsoleErrorEvent ||
      e.type === DocumentEditorMirrorConsoleErrorEvent.type
  }

  static isDocumentEditorMirrorConsoleLogEvent(e: Event): e is DocumentEditorMirrorConsoleLogEvent {
    return e instanceof DocumentEditorMirrorConsoleLogEvent ||
      e.type === DocumentEditorMirrorConsoleLogEvent.type
  }

  static isDocumentEditorMirrorThrowEvent(e: Event): e is DocumentEditorMirrorThrowEvent {
    return e instanceof DocumentEditorMirrorThrowEvent ||
      e.type === DocumentEditorMirrorThrowEvent.type
  }

  #ondocumenteditormirrorconsoleerror: DocumentEditorMirrorConsoleErrorEventListener | null = null

  get ondocumenteditormirrorconsoleerror(): DocumentEditorMirrorConsoleErrorEventListener | null {
    return this.#ondocumenteditormirrorconsoleerror
  }

  set ondocumenteditormirrorconsoleerror(l: DocumentEditorMirrorConsoleErrorEventListener | null) {
    if (this.#ondocumenteditormirrorconsoleerror) {
      this.removeEventListener(DocumentEditorMirrorConsoleErrorEvent.type, this.#ondocumenteditormirrorconsoleerror)
    }
    this.#ondocumenteditormirrorconsoleerror = l
    if (this.#ondocumenteditormirrorconsoleerror) {
      this.addEventListener(DocumentEditorMirrorConsoleErrorEvent.type, this.#ondocumenteditormirrorconsoleerror)
    }
  }

  #ondocumenteditormirrorconsolelog: DocumentEditorMirrorConsoleLogEventListener | null = null

  get ondocumenteditormirrorconsolelog(): DocumentEditorMirrorConsoleLogEventListener | null {
    return this.#ondocumenteditormirrorconsolelog
  }

  set ondocumenteditormirrorconsolelog(l: DocumentEditorMirrorConsoleLogEventListener | null) {
    if (this.#ondocumenteditormirrorconsolelog) {
      this.removeEventListener(DocumentEditorMirrorConsoleLogEvent.type, this.#ondocumenteditormirrorconsolelog)
    }
    this.#ondocumenteditormirrorconsolelog = l
    if (this.#ondocumenteditormirrorconsolelog) {
      this.addEventListener(DocumentEditorMirrorConsoleLogEvent.type, this.#ondocumenteditormirrorconsolelog)
    }
  }

  #ondocumenteditormirrorerror: DocumentEditorMirrorErrorListener | null = null

  get ondocumenteditormirrorerror(): DocumentEditorMirrorErrorListener | null {
    return this.#ondocumenteditormirrorerror
  }

  set ondocumenteditormirrorerror(l: DocumentEditorMirrorErrorListener | null) {
    if (this.#ondocumenteditormirrorerror) {
      this.removeEventListener(DocumentEditorMirrorErrorEvent.type, this.#ondocumenteditormirrorerror)
    }
    this.#ondocumenteditormirrorerror = l
    if (this.#ondocumenteditormirrorerror) {
      this.addEventListener(DocumentEditorMirrorErrorEvent.type, this.#ondocumenteditormirrorerror)
    }
  }

  #ondocumenteditormirrorthrow: DocumentEditorMirrorThrowEventListener | null = null

  get ondocumenteditormirrorthrow(): DocumentEditorMirrorThrowEventListener | null {
    return this.#ondocumenteditormirrorthrow
  }

  set ondocumenteditormirrorthrow(l: DocumentEditorMirrorThrowEventListener | null) {
    if (this.#ondocumenteditormirrorthrow) {
      this.removeEventListener(DocumentEditorMirrorThrowEvent.type, this.#ondocumenteditormirrorthrow)
    }
    this.#ondocumenteditormirrorthrow = l
    if (this.#ondocumenteditormirrorthrow) {
      this.addEventListener(DocumentEditorMirrorThrowEvent.type, this.#ondocumenteditormirrorthrow)
    }
  }

  static get observedAttributes(): string[] {
    return [
      "ondocumenteditormirrorconsoleerror",
      "ondocumenteditormirrorconsolelog",
      "ondocumenteditormirrorerror",
      "ondocumenteditormirrorthrow"
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "ondocumenteditormirrorconsoleerror":
      this.ondocumenteditormirrorconsoleerror = new Function("event", v) as DocumentEditorMirrorConsoleErrorEventListener
      break
    case "ondocumenteditormirrorconsolelog":
      this.ondocumenteditormirrorconsolelog = new Function("event", v) as DocumentEditorMirrorConsoleLogEventListener
      break
    case "ondocumenteditormirrorerror":
      this.ondocumenteditormirrorerror = new Function("event", v) as DocumentEditorMirrorErrorListener
      break
    case "ondocumenteditormirrorthrow":
      this.ondocumenteditormirrorthrow = new Function("event", v) as DocumentEditorMirrorThrowEventListener
      break
    default:
      throw new Error(`The attribute '${n}' is not supported`)
    }
  }

  connectedCallback(): void {
    this.setup()
  }

  setup(): void {
    const de = this.querySelector("document-editor")
    if (!de) {
      const er = new Error("DocumentEditor element not found")
      const ev = new DocumentEditorMirrorErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    let pt = this.querySelector("div[data-pit]")
    if (pt) {
      pt.remove()
    }

    pt = this.#createPit()
    this.append(pt)

    for (const en of DocumentEditor.eventHandlerNames) {
      const ln = de[en]
      if (ln === null) {
        continue
      }

      const wd = this.#createWindow(pt)

      const lc = this.#createWrapper(ln.toString())
      const lw = new wd.Function(lc)

      // todo: buggy, can't add a new line to the wrapper
      const lp = substringPosition(lw.toString(), lc)

      const wc = this.#createConsole(wd, lp, en)
      wd.console.error = wc.error.bind(wd.console)
      wd.console.log = wc.log.bind(wd.console)

      const wt = this.#createThrow(lp, en)
      wd.onthrow = wt.bind(wd)

      de[en] = lw.bind(de)
    }
  }

  #createPit(): Element {
    const pt = document.createElement("div")
    pt.style.display = "none"
    pt.dataset.pit = ""
    return pt
  }

  #createWindow(el: Element): InternalWindow {
    const fr = document.createElement("iframe")
    fr.dataset.source = "ondocumenteditorappready"
    el.append(fr)
    if (!fr.contentWindow) {
      throw new Error("The iframe contentWindow is not available")
    }
    return fr.contentWindow as InternalWindow
  }

  #createWrapper(fn: string): string {
    return `try {(${fn}).call(this)} catch (e) {window.onthrow(e); throw e}`
  }

  #createConsole(w: InternalWindow, p: [number, number], s: DocumentEditorEventHandlerName): Pick<Console, "error" | "log"> {
    // eslint-disable-next-line unicorn/no-this-assignment, @typescript-eslint/no-this-alias
    const dm = this
    const co = w.console
    const {error, log} = co

    return {
      error(...args) {
        // eslint-disable-next-line unicorn/error-message
        const cp = callerPosition(new Error(), 1)

        let ln = cp[0] - p[0]
        let cn = cp[1] - p[1]
        if (ln < 0 || cn < 0) {
          ln = -1
          cn = -1
        }

        const ev = new DocumentEditorMirrorConsoleErrorEvent({
          source: s,
          lineno: ln,
          colno: cn,
          args
        })
        dm.dispatchEvent(ev)

        error.apply(co, args)
      },

      log(...args) {
        // eslint-disable-next-line unicorn/error-message
        const cp = callerPosition(new Error(), 1)

        let ln = cp[0] - p[0]
        let cn = cp[1] - p[1]
        if (ln < 0 || cn < 0) {
          ln = -1
          cn = -1
        }

        const ev = new DocumentEditorMirrorConsoleLogEvent({
          source: s,
          lineno: ln,
          colno: cn,
          args
        })
        dm.dispatchEvent(ev)

        log.apply(co, args)
      }
    }
  }

  #createThrow(p: [number, number], s: DocumentEditorEventHandlerName): ThrowPseudoEventListener {
    // eslint-disable-next-line unicorn/no-this-assignment, @typescript-eslint/no-this-alias
    const dm = this

    return function onthrow(err) {
      const cp = callerPosition(err)

      let ln = cp[0] - p[0]
      let cn = cp[1] - p[1]
      if (ln < 0 || cn < 0) {
        ln = -1
        cn = -1
      }

      const ev = new DocumentEditorMirrorThrowEvent({
        source: s,
        lineno: ln,
        colno: cn,
        error: err
      })
      dm.dispatchEvent(ev)
    }
  }
}

export class DocumentEditorMirrorConsoleEvent extends Event {
  #source: DocumentEditorEventHandlerName

  get source(): DocumentEditorEventHandlerName {
    return this.#source
  }

  #lineno: number

  get lineno(): number {
    return this.#lineno
  }

  #colno: number

  get colno(): number {
    return this.#colno
  }

  #args: any[] = []

  get args(): any[] {
    return this.#args
  }

  constructor(type: string, eventInitDict: DocumentEditorMirrorConsoleEventInit) {
    super(type, eventInitDict)
    this.#source = eventInitDict.source
    this.#lineno = eventInitDict.lineno
    this.#colno = eventInitDict.colno
    this.#args = eventInitDict.args
  }
}

export interface DocumentEditorMirrorConsoleEventInit extends EventInit {
  source: DocumentEditorEventHandlerName
  lineno: number
  colno: number
  args: any[]
}

export class DocumentEditorMirrorConsoleErrorEvent extends DocumentEditorMirrorConsoleEvent {
  static get type(): string {
    return "documenteditormirrorconsoleerror"
  }

  constructor(eventInitDict: DocumentEditorMirrorConsoleEventInit) {
    super(DocumentEditorMirrorConsoleErrorEvent.type, eventInitDict)
  }
}

export interface DocumentEditorMirrorConsoleErrorEventListener extends EventListener {
  (this: DocumentEditorMirror, event: DocumentEditorMirrorConsoleErrorEvent): void
}

export interface GlobalDocumentEditorMirrorConsoleErrorEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMirrorConsoleErrorEvent): void
}

export class DocumentEditorMirrorConsoleLogEvent extends DocumentEditorMirrorConsoleEvent {
  static get type(): string {
    return "documenteditormirrorconsolelog"
  }

  constructor(eventInitDict: DocumentEditorMirrorConsoleEventInit) {
    super(DocumentEditorMirrorConsoleLogEvent.type, eventInitDict)
  }
}

export interface DocumentEditorMirrorConsoleLogEventListener extends EventListener {
  (this: DocumentEditorMirror, event: DocumentEditorMirrorConsoleLogEvent): void
}

export interface GlobalDocumentEditorMirrorConsoleLogEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMirrorConsoleLogEvent): void
}

export class DocumentEditorMirrorErrorEvent extends ErrorEvent {
  static get type(): string {
    return "documenteditormirrorerror"
  }

  constructor(eventInitDict?: ErrorEventInit) {
    super(DocumentEditorMirrorErrorEvent.type, eventInitDict)
  }
}

export interface DocumentEditorMirrorErrorListener extends EventListener {
  (this: DocumentEditorMirror, event: DocumentEditorMirrorErrorEvent): void
}

export interface GlobalDocumentEditorMirrorErrorHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMirrorErrorEvent): void
}

export class DocumentEditorMirrorThrowEvent extends Event {
  static get type(): string {
    return "documenteditormirrorthrow"
  }

  #source: DocumentEditorEventHandlerName

  get source(): DocumentEditorEventHandlerName {
    return this.#source
  }

  #lineno: number

  get lineno(): number {
    return this.#lineno
  }

  #colno: number

  get colno(): number {
    return this.#colno
  }

  #error: Error

  get error(): Error {
    return this.#error
  }

  constructor(eventInitDict: DocumentEditorMirrorThrowEventInit) {
    super(DocumentEditorMirrorThrowEvent.type, eventInitDict)
    this.#source = eventInitDict.source
    this.#lineno = eventInitDict.lineno
    this.#colno = eventInitDict.colno
    this.#error = eventInitDict.error
  }
}

export interface DocumentEditorMirrorThrowEventInit extends EventInit {
  source: DocumentEditorEventHandlerName
  lineno: number
  colno: number
  error: Error
}

export interface DocumentEditorMirrorThrowEventListener extends EventListener {
  (this: DocumentEditorMirror, event: DocumentEditorMirrorThrowEvent): void
}

export interface GlobalDocumentEditorMirrorThrowEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMirrorThrowEvent): void
}

main()
