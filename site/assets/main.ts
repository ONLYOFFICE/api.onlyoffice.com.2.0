/* eslint-disable import/no-unassigned-import */

document.addEventListener("documentbuildererror", onError)
document.addEventListener("documenteditorerror", onError)
document.addEventListener("documenteditorplaygrounderror", onError)
document.addEventListener("DOMContentLoaded", main)

import "@onlyoffice/combobox-container-html-element"
import "@onlyoffice/document-builder-html-element"
import "@onlyoffice/document-editor-html-element"
import "@onlyoffice/document-editor-mirror-html-element"
import "@onlyoffice/radiogroup-container-html-element"
import {Client} from "@onlyoffice/server-client"
import "@onlyoffice/site-kit/client.js"
import "@onlyoffice/ui-kit/client.js"
import "../components/tree/tree.client.ts"
import "../internal/document-builder-container.ts"

function main(): void {
  const c = new Client()
  if (import.meta && import.meta.env && import.meta.env.CONFIG_SERVER_BASE_URL) {
    c.baseURL = import.meta.env.CONFIG_SERVER_BASE_URL
  }

  const a: Promise<void>[] = []

  const sp = document.querySelector("document-editor-playground")
  if (sp) {
    sp.client = c
    const p = sp.play()
    a.push(p)
  }

  const bc = document.querySelector("document-builder-container")
  if (bc) {
    bc.client = c
    const p = bc.play()
    a.push(p)
  }

  Promise.all(a).catch(onError)
}

function onError(...args: unknown[]): void {
  console.error("Site error:", ...args)
}
