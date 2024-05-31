import type {DocumentEditorConfig} from "@onlyoffice/document-editor-html-element"
import {toHtml} from "hast-util-to-html"
import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {documentEditor} from "./main.ts"

test("initializes a document-editor with correct orders", () => {
  const e = documentEditor()

  let a = Object.keys(e)
  eq(a, ["type", "tagName", "properties", "children", "data"])

  a = Object.keys(e.data)
  eq(a, ["documentServerUrl", "config"])
})

test("initializes a document-editor with defaults", () => {
  const e = documentEditor()
  is(e.type, "element")
  is(e.tagName, "document-editor")
  eq(e.properties, {})
  is(e.data.documentServerUrl, undefined)
  is(e.data.config, undefined)
  eq(e.children, [])
})

test("sets and gets the document server url data", () => {
  const e = documentEditor()
  e.data.documentServerUrl = "u"
  eq(e.data.documentServerUrl, "u")
})

test("resets the document server url", () => {
  const e = documentEditor()
  e.data.documentServerUrl = "u"
  e.data.documentServerUrl = undefined
  is(e.data.documentServerUrl, undefined)
})

test("proxies the document server url to properties", () => {
  const e = documentEditor()
  e.data.documentServerUrl = "u"
  eq(e.properties["document-server-url"], "u")
})

test("proxies the document server url to the data", () => {
  const e = documentEditor()
  e.properties["document-server-url"] = "u"
  eq(e.data.documentServerUrl, "u")
})

test("includes the document server url in the html output", () => {
  const e = documentEditor()
  e.data.documentServerUrl = "u"
  const h = toHtml(e)
  is(h, '<document-editor document-server-url="u"></document-editor>')
})

test("sets and gets the config", () => {
  const e = documentEditor()
  e.data.config = configObject()
  eq(e.data.config, configObject())
})

test("resets the config", () => {
  const e = documentEditor()
  e.data.config = configObject()
  e.data.config = undefined
  is(e.data.config, undefined)
})

test("proxies the config to properties", () => {
  const e = documentEditor()
  e.data.config = configObject()
  is(e.properties.config, configString())
})

test("proxies the config to the data", () => {
  const e = documentEditor()
  e.properties.config = configString()
  eq(e.data.config, configObject())
})

test("includes the config in the html output", () => {
  const e = documentEditor()
  e.data.config = configObject()
  const h = toHtml(e)
  is(h, configHtml())
})

test.run()

function configObject(): DocumentEditorConfig {
  return {
    documentType: "word",
    document: {
      fileType: "docx",
      key: "k",
      title: "t",
      url: "u"
    }
  }
}

function configString(): string {
  const d = '{"fileType":"docx","key":"k","title":"t","url":"u"}'
  return `{"documentType":"word","document":${d}}`
}

function configHtml(): string {
  const c = configString().replaceAll('"', "&#x22;")
  return `<document-editor config="${c}"></document-editor>`
}
