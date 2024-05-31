import type {DocumentEditorEventHandlerName} from "@onlyoffice/document-editor-html-element"
import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import {DocumentEditorMirror} from "@onlyoffice/document-editor-mirror-html-element"
import type {Client} from "@onlyoffice/server-client"
import {SitePlaygroundErrorEvent} from "./events.ts"

export class SitePlayground extends HTMLElement {
  static get tagName(): string {
    return "site-playground"
  }

  #client: Client | undefined

  get client(): Client | undefined {
    return this.#client
  }

  set client(value: Client | undefined) {
    this.#client = value
  }

  #handlers = new Map<DocumentEditorEventHandlerName, string>()

  async connectedCallback(): Promise<void> {
    if (!this.#client) {
      const er = new Error("Client instance is not registered")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const ec = this.querySelector("document-editor-config")
    if (!ec) {
      const er = new Error("The 'document-editor-config' element not found")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const em = this.querySelector("document-editor-mirror")
    if (!em) {
      const er = new Error("The 'document-editor-mirror' element not found")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const de = this.querySelector("document-editor")
    if (!de) {
      const er = new Error("The 'document-editor' element not found")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    if (!de.editor) {
      const er = new Error("DocEditor instance is not registered")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const cf = structuredClone(ec.config)

    const es = cf.events
    if (es) {
      delete cf.events
    }

    try {
      [de.config] = await this.#client.documentEditor.assign(cf)
    } catch (e) {
      let m = "Failed to sign DocEditor configuration"
      if (e instanceof Error) {
        m += `: ${e.message}`
      }
      const ev = new SitePlaygroundErrorEvent({error: e, message: m})
      this.dispatchEvent(ev)
      return
    }

    this.#handlers.clear()
    em.ondocumenteditormirrorconsoleerror = null
    em.ondocumenteditormirrorconsolelog = null
    em.ondocumenteditormirrorthrow = null

    if (es) {
      for (const [n, fn] of Object.entries(es)) {
        const hn = this.#handlerName(n)
        if (!hn) {
          const er = new Error(`The '${hn}' (${n}) event does not exist in the DocumentEditor`)
          const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
          this.dispatchEvent(ev)
          continue
        }
        this.#handlers.set(hn, n)
        de[hn] = new Function(fn) as EventListener
      }
      em.ondocumenteditormirrorconsolelog = this.#handle.bind(this)
      em.ondocumenteditormirrorconsoleerror = this.#handle.bind(this)
      em.ondocumenteditormirrorthrow = this.#handle.bind(this)
    }

    em.connectedCallback()
    de.editor.requestClose()
    de.editor.destroyEditor()
    de.reload()
  }

  #handlerName(n: string): DocumentEditorEventHandlerName | undefined {
    n = n.toLocaleLowerCase().slice(2)
    n = `ondocumenteditor${n}`
    if (!DocumentEditor.isDocumentEditorEventHandlerName(n)) {
      return undefined
    }
    return n
  }

  #handle(me: Event): void {
    if (!(
      DocumentEditorMirror.isDocumentEditorMirrorConsoleErrorEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorConsoleLogEvent(me) ||
      DocumentEditorMirror.isDocumentEditorMirrorThrowEvent(me)
    )) {
      return
    }

    const en = this.#handlers.get(me.source)
    if (!en) {
      const er = new Error(`The '${me.source}' event does register in the DocumentEditorPlayground`)
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    const cd = this.querySelector(`[data-output-for="events.${en}"]`)
    if (!cd) {
      const er = new Error(`The output element for the '${en}' event not found`)
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
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
