import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import {builder, fileType} from "@onlyoffice/document-builder-utils"
import type {DocEditorConnector} from "@onlyoffice/document-server-types"
import {uniqueString} from "@onlyoffice/unique-string"
import type {Stringify} from "@onlyoffice/utility-types"

declare global {
  interface Window {
    DocumentBuilder: typeof DocumentBuilder
    DocumentBuilderErrorEvent: typeof DocumentBuilderErrorEvent
    DocumentBuilderReadyEvent: typeof DocumentBuilderReadyEvent
  }

  interface HTMLElementTagNameMap {
    "document-builder": DocumentBuilder
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-builder": Partial<Stringify<Omit<DocumentBuilder, keyof HTMLElement>>> & JSXBase["span"]
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    documentbuildererror: DocumentBuilderErrorEvent
    documentbuilderready: DocumentBuilderReadyEvent
  }

  interface GlobalEventHandlers {
    ondocumentbuildererror: GlobalDocumentBuilderErrorHandler | null
    ondocumentbuilderready: GlobalDocumentBuilderReadyHandler | null
  }
}

function main(): void {
  if (window.customElements.get(DocumentBuilder.tagName)) {
    return
  }
  window.DocumentBuilder = DocumentBuilder
  window.customElements.define(DocumentBuilder.tagName, DocumentBuilder)
  window.DocumentBuilderErrorEvent = DocumentBuilderErrorEvent
  window.DocumentBuilderReadyEvent = DocumentBuilderReadyEvent
}

export class DocumentBuilderErrorEvent extends ErrorEvent {
  static get type(): string {
    return "documentbuildererror"
  }

  constructor(eventInitDict?: ErrorEventInit) {
    super(DocumentBuilderErrorEvent.type, eventInitDict)
  }
}

export interface DocumentBuilderErrorListener extends EventListener {
  (this: DocumentEditor, event: DocumentBuilderErrorEvent): void
}

export interface GlobalDocumentBuilderErrorHandler {
  (this: GlobalEventHandlers, ev: DocumentBuilderErrorEvent): void
}

export class DocumentBuilderReadyEvent extends Event {
  static get type(): string {
    return "documentbuilderready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentBuilderReadyEvent.type, eventInitDict)
  }
}

export interface DocumentBuilderReadyEventListener extends EventListener {
  (this: DocumentEditor, event: DocumentBuilderReadyEvent): void
}

export interface GlobalDocumentBuilderReadyHandler {
  (this: GlobalEventHandlers, ev: DocumentBuilderReadyEvent): void
}

interface DocumentBuilderCommandListener extends EventListener {
  (this: DocumentBuilder, event: DocumentBuilderReadyEvent): void
}

export type DocumentBuilderCommand = Parameters<DocEditorConnector["callCommand"]>[0]

export type DocumentBuilderConnector = DocEditorConnector

export class DocumentBuilder extends DocumentEditor {
  static get tagName(): string {
    return "document-builder"
  }

  #command: DocumentBuilderCommand | null = null

  get command(): DocumentBuilderCommand | null {
    return this.#command
  }

  set command(c: DocumentBuilderCommand | null) {
    if (this.#commandListener) {
      this.removeEventListener(DocumentBuilderReadyEvent.type, this.#commandListener)
      this.#commandListener = null
    }

    if (c) {
      c = new Function(`${banner()}\n\n(${c}).call(undefined, builder)`)
    }

    this.#command = c
    if (!this.#command) {
      return
    }

    if (this.#connector) {
      this.#connector.callCommand(this.#command)
      return
    }

    this.#commandListener = function commandListener() {
      if (!(this.#command && this.#connector)) {
        return
      }
      this.#connector.callCommand(this.#command)
    }
    this.addEventListener(DocumentBuilderReadyEvent.type, this.#commandListener)
  }

  #commandListener: DocumentBuilderCommandListener | null = null

  #connector: DocumentBuilderConnector | null = null

  get connector(): DocumentBuilderConnector | null {
    return this.#connector
  }

  #ondocumentbuilderready: DocumentBuilderReadyEventListener | null = null

  get ondocumentbuilderready(): DocumentBuilderReadyEventListener | null {
    return this.#ondocumentbuilderready
  }

  set ondocumentbuilderready(l: DocumentBuilderReadyEventListener | null) {
    if (this.#ondocumentbuilderready) {
      this.removeEventListener(DocumentBuilderReadyEvent.type, this.#ondocumentbuilderready)
    }
    this.#ondocumentbuilderready = l
    if (this.#ondocumentbuilderready) {
      this.addEventListener(DocumentBuilderReadyEvent.type, this.#ondocumentbuilderready)
    }
  }

  #ondocumentbuildererror: DocumentBuilderErrorListener | null = null

  get ondocumentbuildererror(): DocumentBuilderErrorListener | null {
    return this.#ondocumentbuildererror
  }

  set ondocumentbuildererror(l: DocumentBuilderErrorListener | null) {
    if (this.#ondocumentbuildererror) {
      this.removeEventListener(DocumentBuilderErrorEvent.type, this.#ondocumentbuildererror)
    }
    this.#ondocumentbuildererror = l
    if (this.#ondocumentbuildererror) {
      this.addEventListener(DocumentBuilderErrorEvent.type, this.#ondocumentbuildererror)
    }
  }

  static get observedAttributes(): string[] {
    return [
      ...DocumentEditor.observedAttributes,
      "command",
      "ondocumentbuilderready",
      "ondocumentbuildererror"
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "command":
      this.command = new Function("builder", v) as DocumentBuilderCommand
      break
    case "ondocumentbuilderready":
      this.ondocumentbuilderready = new Function("event", v) as DocumentBuilderReadyEventListener
      break
    case "ondocumentbuildererror":
      this.ondocumentbuildererror = new Function("event", v) as DocumentBuilderErrorListener
      break
    default:
      super.attributeChangedCallback(n, _, v)
    }
  }

  static fileType(c: string): string {
    return fileType(c)
  }

  connectedCallback(): void {
    super.connectedCallback()
    this.addEventListener("documenteditordocumentready", () => {
      if (!this.editor) {
        const er = new Error("DocumentEditor is not initialized")
        const ev = new DocumentBuilderErrorEvent({error: er, message: er.message})
        this.dispatchEvent(ev)
        return
      }

      this.#connector = this.editor.createConnector()

      const e = new DocumentBuilderReadyEvent()
      this.dispatchEvent(e)
    })
  }
}

function banner(): string {
  const n = `__${uniqueString()}`
  const m = builder.toString()
  return "// document-builder-element\n" +
    `function ${n}(){return (${m})()};const builder = ${n}();`
}

main()
