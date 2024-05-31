import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {setProperty} from "dot-prop"

type Control = HTMLInputElement | HTMLSelectElement | HTMLTextAreaElement

export class DocumentEditorConfig extends HTMLElement {
  static get tagName(): string {
    return "document-editor-config"
  }

  get config(): DocEditorConfig {
    const cf: DocEditorConfig = {}
    const cs: NodeListOf<Control> = this.querySelectorAll("input, select, textarea")
    for (const c of cs) {
      let v: unknown = c.value
      if (c instanceof HTMLInputElement && c.type === "checkbox") {
        v = c.checked
      }
      setProperty(cf, c.name, v)
    }
    return cf
  }
}
