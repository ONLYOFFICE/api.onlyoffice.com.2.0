import process from "node:process"
import {URL, fileURLToPath} from "node:url"
import Eleventy from "@11ty/eleventy"
import {deepStrictEqualStructure as eq} from "@onlyoffice/node-assert"
import {Config} from "@onlyoffice/site-config"
import {test} from "uvu"

test.before.each(() => {
  const rd = rootDir()
  process.chdir(rd)
})

test("loads a new config into global data if none is present in the current process", async () => {
  process.chdir("./fixtures/000")
  const c = new Config()
  const e = new Eleventy()
  await e.toJSON()
  const d = await e.templateData.globalData
  eq(d.config, c)
})

test("loads an empty config from a directory of the current process into global data", async () => {
  process.chdir("./fixtures/001")
  const c = new Config()
  const e = new Eleventy()
  await e.toJSON()
  const d = await e.templateData.globalData
  eq(d.config, c)
})

test("loads an non-empty config from a directory of the current process into global data", async () => {
  process.chdir("./fixtures/002")
  const c = new Config()
  c.baseUrl = "http://localhost:8080/"
  const e = new Eleventy()
  await e.toJSON()
  const d = await e.templateData.globalData
  eq(d.config, c)
})

test("loads a mode specific config from a directory of the current process into global data", async () => {
  process.chdir("./fixtures/003")
  const c = new Config()
  c.baseUrl = "http://localhost/"
  const e = new Eleventy()
  await e.toJSON()
  const d = await e.templateData.globalData
  eq(d.config, c)
})

test.run()

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}
