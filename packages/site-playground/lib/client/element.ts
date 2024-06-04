import * as configSample from "@onlyoffice/document-editor-code-sample"
import type {DocumentEditorEventHandlerName} from "@onlyoffice/document-editor-html-element"
import {DocumentEditor} from "@onlyoffice/document-editor-html-element"
import {DocumentEditorMirror} from "@onlyoffice/document-editor-mirror-html-element"
import {cloneConfig} from "@onlyoffice/document-server-utils"
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

    const fr = ec.querySelector("form")
    if (!fr) {
      const er = new Error("The form element for the 'document-editor-config' not found")
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
      de.ondocumenteditorappready = this.connectedCallback.bind(this)
      return
      // const er = new Error("DocEditor instance is not registered")
      // const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      // this.dispatchEvent(ev)
      // return
    }

    de.ondocumenteditorappready = null

    const cf = cloneConfig(ec.config)

    const af = cf
    if (af.events) {
      delete af.events
    }

    try {
      [de.config] = await this.#client.documentEditor.assign(af)
    } catch (e) {
      let m = "Failed to sign DocEditor configuration"
      if (e instanceof Error) {
        m += `: ${e.message}`
      }
      const ev = new SitePlaygroundErrorEvent({error: e, message: m})
      this.dispatchEvent(ev)
      return
    }

    fr.onsubmit = this.#submit.bind(this)

    this.#handlers.clear()
    em.ondocumenteditormirrorconsoleerror = null
    em.ondocumenteditormirrorconsolelog = null
    em.ondocumenteditormirrorthrow = null

    if (cf.events) {
      for (const [n, fn] of Object.entries(cf.events)) {
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
    de.connectedCallback()

    const sm = document.querySelectorAll<HTMLElement>("[data-config-sample]")
    for (const e of sm) {
      const v = e.dataset.configSample
      if (!v) {
        continue
      }

      let s = ""

      switch (v) {
      case "html":
        s = configSample.html(de.documentServerUrl, cf)
        break
      case "js":
        s = configSample.js(cf)
        break
      case "json":
        s = configSample.json(cf)
        break
      default:
        const er = new Error(`Unknown config sample type: ${v}`)
        const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
        this.dispatchEvent(ev)
        continue
      }

      e.textContent = s
    }
  }

  #submit(se: SubmitEvent): void {
    se.preventDefault()

    if (!(se.submitter instanceof HTMLButtonElement)) {
      const er = new Error("The submitter is not a button element")
      const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    if (se.submitter.value === "play") {
      this.connectedCallback()
      return
    }

    if (se.submitter.value === "reset") {
      // todo: implement reset action
      return
    }

    const er = new Error(`Unknown submitter value: ${se.submitter.value}`)
    const ev = new SitePlaygroundErrorEvent({bubbles: true, error: er, message: er.message})
    this.dispatchEvent(ev)
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
