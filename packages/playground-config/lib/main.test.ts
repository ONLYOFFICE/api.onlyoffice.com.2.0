import {equal as eq, is, unreachable as un} from "uvu/assert"
import {test} from "uvu"
import {config, documentEditor, property} from "./main.ts"
import * as raw from "./raw.ts"
import type * as Well from "./well.ts"
import * as well from "./well.ts"

test("creates an empty property", () => {
  const rp = raw.property("string")
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.stringType(wn)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates a property with a format", () => {
  const rp = raw.property("number")
  rp.format = "percent"
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.numberType(wn)
  const wp = well.property(wt)
  wp.format = "percent"
  eq(p, wp)
})

test("creates a property with a default value", () => {
  const rp = raw.property("string")
  rp.default = "v"
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.stringType(wn)
  const wp = well.property(wt)
  wp.default = "v"
  eq(p, wp)
})

test("throws an error for an unknown type", () => {
  try {
    // @ts-expect-error
    const rp = raw.property("unknown")
    const p = property(rp)
    un(`Expected an error, but got ${p}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Unknown type: unknown")
  }
})

test("creates a property with a boolean type", () => {
  const rp = raw.property("boolean")
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.booleanType(wn)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates a property with a function type", () => {
  const rp = raw.property("function")
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.functionType(wn)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates a property with a number type", () => {
  const rp = raw.property("number")
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.numberType(wn)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates a property with a string type", () => {
  const rp = raw.property("string")
  const p = property(rp)
  const wn = well.typeNode()
  const wt = well.stringType(wn)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates a property with an enum type", () => {
  const rp = raw.property("number")
  rp.cases = [0, 1]
  const p = property(rp)
  const wn = well.typeNode()
  const cs: Well.Type[] = []
  for (const c of rp.cases) {
    const bn = well.typeNode()
    const bt = well.numberType(bn)
    const ln = well.typeNode()
    const lt = well.literalType(ln, bt, c)
    cs.push(lt)
  }
  const wt = well.enumType(wn, cs)
  const wp = well.property(wt)
  eq(p, wp)
})

test("creates an empty document editor", () => {
  const rde = raw.documentEditor()
  const de = documentEditor(rde)
  const wde = well.documentEditor()
  eq(de, wde)
})

test("creates a document editor with a document server URL", () => {
  const rde = raw.documentEditor()
  rde.documentServerURL = "http://localhost:3000/"
  const de = documentEditor(rde)
  const wde = well.documentEditor()
  wde.documentServerURL = "http://localhost:3000/"
  eq(de, wde)
})

test("creates a document editor with config", () => {
  const rp = raw.property("string")
  const rde = raw.documentEditor()
  rde.config = [rp]
  const de = documentEditor(rde)
  const wn = well.typeNode()
  const wt = well.stringType(wn)
  const wp = well.property(wt)
  const wde = well.documentEditor()
  wde.config = [wp]
  eq(de, wde)
})

test("creates an empty config", () => {
  const rc = raw.config()
  const c = config(rc)
  const wde = well.documentEditor()
  const wc = well.config(wde)
  eq(c, wc)
})

test("creates a config with a document editor", () => {
  const rde = raw.documentEditor()
  const rc = raw.config()
  rc.documentEditor = rde
  const c = config(rc)
  const wde = documentEditor(rde)
  const wc = well.config(wde)
  eq(c, wc)
})

test.run()
