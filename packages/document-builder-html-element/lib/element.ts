import {DocumentEditor, type DocumentEditorAttributes} from "@onlyoffice/document-editor-html-element"
import {type DocEditorConnector} from "@onlyoffice/document-server-types"
import {DocumentBuilderErrorEvent, DocumentBuilderReadyEvent} from "./events.ts"

export type DocumentBuilderAttribute = Exclude<keyof DocumentBuilderAttributes, undefined>

export interface DocumentBuilderAttributes extends DocumentEditorAttributes {
  command?: string
}

interface DocumentBuilderCommandListener extends EventListener {
  (this: DocumentBuilder, event: DocumentBuilderReadyEvent): void
}

// @ts-ignore TS2417
// Since `DocumentBuilderAttribute` is a subset of `DocumentEditorAttributes`
// the TypeScript error is not a cause for concern.
export class DocumentBuilder extends DocumentEditor {
  static get tagName(): string {
    return "document-builder"
  }

  static get observedAttributes(): DocumentBuilderAttribute[] {
    return [
      ...DocumentEditor.observedAttributes,
      "command",
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "command":
      this.command = v
      break
    default:
      super.attributeChangedCallback(n, _, v)
      break
    }
  }

  #commandListener: DocumentBuilderCommandListener | null = null

  #command: string | null = null

  get command(): string | null {
    return this.#command
  }

  set command(c: string | null) {
    if (this.#commandListener) {
      this.removeEventListener(DocumentBuilderReadyEvent.type, this.#commandListener)
      this.#commandListener = null
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

  #connector: DocEditorConnector | null = null

  get connector(): DocEditorConnector | null {
    return this.#connector
  }

  constructor() {
    super()
    this.eventList.add("documenteditordocumentready")
  }

  connectedCallback(): void {
    super.connectedCallback()
    this.#listen()
  }

  disconnectedCallback(): void {
    this.#delisten()
  }

  #listen(): void {
    this.addEventListener("documenteditordocumentready", this)
  }

  #delisten(): void {
    this.removeEventListener("documenteditordocumentready", this)
  }

  handleEvent(e: Event): void {
    if (e.type === "documenteditordocumentready") {
      if (!this.editor) {
        const er = new Error("DocumentEditor is not initialized")
        const ev = new DocumentBuilderErrorEvent({bubbles: true, error: er, message: er.message})
        this.dispatchEvent(ev)
        return
      }

      this.#connector = this.editor.createConnector()

      const e = new DocumentBuilderReadyEvent({bubbles: true})
      this.dispatchEvent(e)
    }
  }
}
