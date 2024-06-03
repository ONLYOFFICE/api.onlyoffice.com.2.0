import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {cloneConfig} from "./main.ts"

test("clones an empty config", () => {
  const a: DocEditorConfig = {}
  const b = cloneConfig(a)
  is(a === b, false)
  eq(a, b)
})

test("clones a config, not maintaining references to properties", () => {
  const a: DocEditorConfig = {
    documentType: "word",
    document: {
      fileType: "docx",
      key: "xxx",
      title: "Untitled document",
      url: "http://localhost/document.docx"
    }
  }
  const b = cloneConfig(a)
  is(a.document === b.document, false)
  eq(a, b)
})

test("clones a config, maintaining references to events", () => {
  const a: DocEditorConfig = {
    events: {
      onAppReady() {
        console.log("Document Editor is ready")
      }
    }
  }
  const b = cloneConfig(a)
  is(a.events === b.events, false)
  is(a.events && b.events && a.events.onAppReady === b.events.onAppReady, true)
  eq(a, b)
})

test.run()
