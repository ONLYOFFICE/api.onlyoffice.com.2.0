import {mkdtemp, rm, writeFile} from "node:fs/promises"
import {createRequire} from "node:module"
import {tmpdir} from "node:os"
import path from "node:path"
import {suite} from "uvu"
import {equal as eq, is} from "uvu/assert"
import pack from "../package.json" with {type: "json"}
import {type Resource, nop, resource} from "./main.ts"

const require = createRequire(import.meta.url)

interface Context {
  td: string
}

const test = suite<Context>("")

test.before(async (ctx) => {
  ctx.td = await mkdtemp(`${tempDir()}-`)
})

test.after(async (ctx) => {
  await rm(ctx.td, {recursive: true})
})

test("creates nop resource", () => {
  const n = nop()
  eq(n.list(), [])
  is(n.resolve(""), undefined)
})

test("generates resource with empty data", async (ctx) => {
  const df = path.join(ctx.td, "d0.json")
  await writeFile(df, "[]")

  const mf = path.join(ctx.td, "m0.json")
  await writeFile(mf, "{}")

  const rc = await resource(df, mf)
  const rf = path.join(ctx.td, "r0.ts")
  await writeFile(rf, rc)

  const r: Resource = require(rf)
  eq(r.list(), [])
  is(r.resolve(""), undefined)

  await rm(df)
  await rm(mf)
  await rm(rf)
})

test("generates resource with data", async (ctx) => {
  const df = path.join(ctx.td, "d1.json")
  await writeFile(df, '[{"id": "1", "name": "a"}]')

  const mf = path.join(ctx.td, "m1.json")
  await writeFile(mf, '{"1": {"type": "object"}}')

  const rc = await resource(df, mf)
  const rf = path.join(ctx.td, "r1.ts")
  await writeFile(rf, rc)

  const r: Resource = require(rf)
  eq(r.list(), [{id: "1", name: "a"}])
  eq(r.resolve("1"), {type: "object"})

  await rm(df)
  await rm(mf)
  await rm(rf)
})

test.run()

function tempDir(): string {
  const n = pack.name.replace("/", "+")
  return path.join(tmpdir(), n)
}
