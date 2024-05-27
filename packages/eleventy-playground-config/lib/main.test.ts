import process from "node:process"
import {URL, fileURLToPath} from "node:url"
import Eleventy from "@11ty/eleventy"
import {config, documentEditor} from "@onlyoffice/playground-config/well.ts"
import {equal as eq} from "uvu/assert"
import {test} from "uvu"

test.before.each(() => {
  const rd = rootDir()
  process.chdir(rd)
})

test("loads a configuration from a builtin data directory", async () => {
  process.chdir("./fixtures/000")
  const e = new Eleventy()
  const [p] = await e.toJSON()
  const de = documentEditor()
  de.documentServerURL = "http://localhost:3000/"
  const c = config(de)
  eq(p.content, c)
})

test("loads a configuration for a custom mode", async () => {
  process.chdir("./fixtures/001")
  const e = new Eleventy()
  const [p] = await e.toJSON()
  const de = documentEditor()
  de.documentServerURL = "http://localhost:4000/"
  const c = config(de)
  eq(p.content, c)
})

test("loads a configuration from a custom data directory", async () => {
  process.chdir("./fixtures/003")
  const e = new Eleventy()
  const [p] = await e.toJSON()
  const de = documentEditor()
  de.documentServerURL = "http://localhost:3000/"
  const c = config(de)
  eq(p.content, c)
})

test("loads a configuration from a custom data extension", async () => {
  process.chdir("./fixtures/003")
  const e = new Eleventy()
  const [p] = await e.toJSON()
  const de = documentEditor()
  de.documentServerURL = "http://localhost:3000/"
  const c = config(de)
  eq(p.content, c)
})

test.run()

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}
