document.addEventListener("documentbuildererror", onError)
document.addEventListener("documenteditorerror", onError)
document.addEventListener("documenteditorplaygrounderror", onError)
document.addEventListener("DOMContentLoaded", main)

import "@onlyoffice/combobox-container-html-element"
import "@onlyoffice/radiogroup-container-html-element"
import "@onlyoffice/document-builder-html-element"
import "@onlyoffice/document-editor-config-html-element"
import "@onlyoffice/document-editor-html-element"
import "@onlyoffice/document-editor-mirror-html-element"
import "@onlyoffice/ui-kit/client.ts"
import "@onlyoffice/documentation-ui-kit/kit.client.ts"
import "@onlyoffice/site-kit/client.ts"
import "../components/tree/tree.client.ts"
import "../components/document-builder-container/element.ts"
import {Client} from "@onlyoffice/server-client"

function main(): void {
  const c = new Client()
  if (import.meta && import.meta.env && import.meta.env.CONFIG_SERVER_BASE_URL) {
    c.baseURL = import.meta.env.CONFIG_SERVER_BASE_URL
  }

  const sp = document.querySelector("document-editor-playground")
  if (sp) {
    sp.client = c
    sp.play()
  }
}

function onError(...args: unknown[]): void {
  console.error(`Site error:`, ...args)
}
