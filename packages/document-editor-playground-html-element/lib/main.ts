/* eslint @stylistic/max-len: ["error", {code: 140}] */
import type {DocumentEditorEventHandlerName} from "@onlyoffice/document-editor-html-element"
import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import {DocumentEditorMirror} from "@onlyoffice/document-editor-mirror-html-element"
import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {setProperty} from "dot-prop"

declare global {
  interface Window {
    DocumentEditorPlayground: typeof DocumentEditorPlayground
    DocumentEditorPlaygroundErrorEvent: typeof DocumentEditorPlaygroundErrorEvent
  }

  interface HTMLElementTagNameMap {
    "document-editor-playground": DocumentEditorPlayground
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor-playground": Partial<Omit<DocumentEditorPlayground, keyof HTMLElement>> & JSXBase["span"]
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    documenteditorplaygrounderror: DocumentEditorPlaygroundErrorEvent
  }

  interface GlobalEventHandlers {
    ondocumenteditorplaygrounderror: GlobalDocumentEditorPlaygroundErrorHandler | null
  }
}

function main(): void {
  if (window.customElements.get(DocumentEditorPlayground.tagName)) {
    return
  }
  window.DocumentEditorPlayground = DocumentEditorPlayground
  window.customElements.define(DocumentEditorPlayground.tagName, DocumentEditorPlayground)
  window.DocumentEditorPlaygroundErrorEvent = DocumentEditorPlaygroundErrorEvent
}

export class DocumentEditorPlayground extends HTMLElement {
  static get tagName(): string {
    return "document-editor-playground"
  }

  #ondocumenteditorplaygrounderror: DocumentEditorPlaygroundErrorListener | null = null

  get ondocumenteditorplaygrounderror(): DocumentEditorPlaygroundErrorListener | null {
    return this.#ondocumenteditorplaygrounderror
  }

  set ondocumenteditorplaygrounderror(l: DocumentEditorPlaygroundErrorListener | null) {
    if (this.#ondocumenteditorplaygrounderror) {
      this.removeEventListener(DocumentEditorPlaygroundErrorEvent.type, this.#ondocumenteditorplaygrounderror)
    }
    this.#ondocumenteditorplaygrounderror = l
    if (this.#ondocumenteditorplaygrounderror) {
      this.addEventListener(DocumentEditorPlaygroundErrorEvent.type, this.#ondocumenteditorplaygrounderror)
    }
  }

  static get observedAttributes(): string[] {
    return [
      "ondocumenteditorplaygrounderror"
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "ondocumenteditorplaygrounderror":
      this.ondocumenteditorplaygrounderror = new Function("event", v) as DocumentEditorPlaygroundErrorListener
      break
    default:
      throw new Error(`The attribute '${n}' is not supported`)
    }
  }

  get config(): DocEditorConfig {
    const cf: DocEditorConfig = {}
    const cs: NodeListOf<HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement> =
      this.querySelectorAll("input, select, textarea")
    for (const c of cs) {
      let v: unknown = c.value
      if (c instanceof HTMLInputElement && c.type === "checkbox") {
        v = c.checked
      }
      setProperty(cf, c.name, v)
    }
    return cf
  }

  #eventHandlersNameMap = new Map<DocumentEditorEventHandlerName, string>()

  play(cf: DocEditorConfig): void {
    const dm = this.querySelector("document-editor-mirror")

    if (!dm) {
      const er = new Error("DocumentEditorMirror element not found")
      const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const de = this.querySelector("document-editor")

    if (!de) {
      const er = new Error("DocumentEditor element not found")
      const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    if (!de.editor) {
      const er = new Error("DocumentEditor instance not found")
      const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    cf = structuredClone(cf)

    const es = cf.events
    if (es) {
      delete cf.events
    }

    de.config = cf

    this.#eventHandlersNameMap.clear()
    dm.ondocumenteditormirrorconsoleerror = null
    dm.ondocumenteditormirrorconsolelog = null
    dm.ondocumenteditormirrorthrow = null

    if (es) {
      for (const [n, fn] of Object.entries(es)) {
        const hn = this.#eventHandlerName(n)
        if (!hn) {
          const er = new Error(`The '${hn}' (${n}) event does not exist in the DocumentEditor`)
          const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
          this.dispatchEvent(ev)
          continue
        }
        this.#eventHandlersNameMap.set(hn, n)
        de[hn] = new Function(fn) as EventListener
      }
      dm.ondocumenteditormirrorconsolelog = this.#handleMirrorEvent
      dm.ondocumenteditormirrorconsoleerror = this.#handleMirrorEvent
      dm.ondocumenteditormirrorthrow = this.#handleMirrorEvent
    }

    dm.setup()
    de.editor.requestClose()
    de.editor.destroyEditor()
    de.reload()
  }

  #eventHandlerName(n: string): DocumentEditorEventHandlerName | undefined {
    n = n.toLocaleLowerCase().slice(2)
    n = `ondocumenteditor${n}`
    if (!DocumentEditor.isDocumentEditorEventHandlerName(n)) {
      return undefined
    }
    return n
  }

  #handleMirrorEvent(me: Event): void {
    if (!(
      DocumentEditorMirror.isDocumentEditorMirrorConsoleErrorEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorConsoleLogEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorThrowEvent(me)
    )) {
      return
    }

    const en = this.#eventHandlersNameMap.get(me.source)
    if (!en) {
      const er = new Error(`The '${me.source}' event does register in the DocumentEditorPlayground`)
      const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const cd = this.querySelector(`[data-output-for="events.${en}"]`)
    if (!cd) {
      const er = new Error(`The output element for the '${en}' event not found`)
      const ev = new DocumentEditorPlaygroundErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    let m = ""
    if (DocumentEditorMirror.isDocumentEditorMirrorThrowEvent(me)) {
      m = `Error: ${me.error.message}`
    } else {
      m = me.args.join(" ")
    }

    cd.textContent = `${m} (${me.lineno}:${me.colno})`
  }
}

export class DocumentEditorPlaygroundErrorEvent extends ErrorEvent {
  static get type(): string {
    return "documenteditorplaygrounderror"
  }

  constructor(eventInitDict?: ErrorEventInit) {
    super(DocumentEditorPlaygroundErrorEvent.type, eventInitDict)
  }
}

export interface DocumentEditorPlaygroundErrorListener extends EventListener {
  (this: DocumentEditorPlayground, event: DocumentEditorPlaygroundErrorEvent): void
}

export interface GlobalDocumentEditorPlaygroundErrorHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorPlaygroundErrorEvent): void
}

main()
