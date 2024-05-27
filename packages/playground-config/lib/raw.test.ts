import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {config, documentEditor, property} from "./raw.ts"

test("creates a property with correct order of keys", () => {
  const p = property("string")
  const a = Object.keys(p)
  eq(a, ["path", "href", "type", "format", "cases", "default"])
})

test("creates an empty property", () => {
  const p = property("string")
  is(p.path, "")
  is(p.href, "")
  is(p.type, "string")
  is(p.format, undefined)
  is(p.cases, undefined)
  is(p.default, undefined)
})

test("creates a document editor with correct order of keys", () => {
  const de = documentEditor()
  const a = Object.keys(de)
  eq(a, ["documentServerURL", "config"])
})

test("creates an empty document editor", () => {
  const de = documentEditor()
  is(de.documentServerURL, "")
  is(de.config.length, 0)
})

test("creates a config with correct order of keys", () => {
  const de = documentEditor()
  const c = config(de)
  const a = Object.keys(c)
  eq(a, ["documentEditor"])
})

test("creates an empty config", () => {
  const de = documentEditor()
  const c = config(de)
  is(c.documentEditor.config.length, 0)
})

test.run()
