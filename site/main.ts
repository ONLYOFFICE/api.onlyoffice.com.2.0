document.addEventListener("documentbuildererror", onError)
document.addEventListener("documenteditorerror", onError)
document.addEventListener("siteplaygrounderror", onError)
document.addEventListener("DOMContentLoaded", main)

import "@onlyoffice/document-builder-html-element"
import "@onlyoffice/document-editor-config-html-element"
import "@onlyoffice/document-editor-html-element"
import "@onlyoffice/document-editor-mirror-html-element"
import "@onlyoffice/documentation-ui-kit/kit.client.ts"
import "@onlyoffice/site-playground/client.ts"
import "./components/tree/tree.client.ts"
import "./components/clipboard-copy/clipboard-copy.client.ts"
import "./components/document-builder-container/element.ts"
import {Client} from "@onlyoffice/server-client"

async function main(): Promise<void> {
  const c = new Client()
  c.baseURL = "http://0.0.0.0:4000/"

  const sp = document.querySelector("site-playground")
  if (sp) {
    sp.client = c
    await sp.connectedCallback()
  }
}

function onError(...args: unknown[]): void {
  console.error(`Site error:`, ...args)
}
