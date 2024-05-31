import type {DocumentEditorConfig} from "@onlyoffice/document-editor-html-element"
import type {Element, ElementData, Properties} from "hast"

export interface DocumentEditor extends Element {
  properties: DocumentEditorProperties
  data: DocumentEditorData
}

export interface DocumentEditorProperties extends Properties {
  ["document-server-url"]?: string
  config?: string
}

export interface DocumentEditorData extends ElementData {
  documentServerUrl?: string
  config?: DocumentEditorConfig
}

export function documentEditor(): DocumentEditor {
  const e: DocumentEditor = {
    type: "element",
    tagName: "document-editor",
    properties: {},
    children: [],
    data: {
      get documentServerUrl(): string | undefined {
        return e.properties["document-server-url"]
      },

      set documentServerUrl(u: string | undefined) {
        if (!u) {
          delete e.properties["document-server-url"]
          return
        }
        e.properties["document-server-url"] = u
      },

      get config(): DocumentEditorConfig | undefined {
        if (!e.properties.config) {
          return undefined
        }
        return JSON.parse(e.properties.config) as DocumentEditorConfig
      },

      set config(c: DocumentEditorConfig | undefined) {
        if (!c) {
          delete e.properties.config
          return
        }
        e.properties.config = JSON.stringify(c)
      }
    }
  }
  return e
}
