import {mkdtemp, rm, writeFile} from "node:fs/promises"
import {createRequire} from "node:module"
import {tmpdir} from "node:os"
import {join} from "node:path"
import {equal as eq, is} from "uvu/assert"
import {suite} from "uvu"
import type {Resource} from "./main.ts"
import {resource} from "./main.ts"
import pack from "../package.json" with {type: "json"}

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

test("generates resource with empty data", async (ctx) => {
  const df = join(ctx.td, "d0.json")
  await writeFile(df, "[]")

  const mf = join(ctx.td, "m0.json")
  await writeFile(mf, "{}")

  const rc = await resource(df, mf)
  const rf = join(ctx.td, "r0.ts")
  await writeFile(rf, rc)

  const r: Resource = require(rf)
  eq(r.list(), [])
  is(r.retrieve(""), undefined)

  await rm(df)
  await rm(mf)
  await rm(rf)
})

test("generates resource with data", async (ctx) => {
  const df = join(ctx.td, "d1.json")
  await writeFile(df, '[{"id": "1", "name": "a"}]')

  const mf = join(ctx.td, "m1.json")
  await writeFile(mf, '{"1": 0}')

  const rc = await resource(df, mf)
  const rf = join(ctx.td, "r1.ts")
  await writeFile(rf, rc)

  const r: Resource = require(rf)
  eq(r.list(), [{id: "1", name: "a"}])
  eq(r.retrieve("1"), {id: "1", name: "a"})

  await rm(df)
  await rm(mf)
  await rm(rf)
})

test.run()

function tempDir(): string {
  const n = pack.name.replace("/", "+")
  return join(tmpdir(), n)
}
