import {StringWritable} from "@onlyoffice/stream-string"
import {is, match, unreachable} from "uvu/assert"
import {test} from "uvu"
import {rawURL, readURL, declarationFile, indexFile, resourceFile} from "./main.ts"

test("creates a raw github url", () => {
  const u = rawURL("o", "rp", "rf", "p")
  is(u, "https://raw.githubusercontent.com/o/rp/rf/p")
})

test("reads a url content into a writable stream", async () => {
  const w = new StringWritable()
  await readURL(w, "https://www.google.com/")
  match(w.buf, /<!doctype html>/)
})

test("throws an error if a status code is not 200", async () => {
  const w = new StringWritable()
  try {
    await readURL(w, "https://google.com/")
    unreachable(`Expected an error, got ${w.buf}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Bad status code: 301 Moved Permanently")
  }
})

test("creates a declaration file name", () => {
  const n = declarationFile("n")
  is(n, "n.declaration.json")
})

test("creates an index file name", () => {
  const n = indexFile("n")
  is(n, "n.index.json")
})

test("creates a resource file name", () => {
  const n = resourceFile("n")
  is(n, "n.ts")
})

test.run()
