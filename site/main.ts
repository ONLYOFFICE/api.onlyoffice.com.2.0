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

function main(): void {
  const c = new Client()
  c.baseURL = "http://localhost:4001/"

  const sp = document.querySelector("site-playground")
  if (sp) {
    sp.client = c
  }
}

document.addEventListener("DOMContentLoaded", main)
