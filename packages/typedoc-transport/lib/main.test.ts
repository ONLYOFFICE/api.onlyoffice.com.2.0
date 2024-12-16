import path from "node:path"
import {
  Declaration,
  DeclarationEntity,
} from "@onlyoffice/library-declaration/next.ts"
import {Application, type JSONOutput as J} from "typedoc"
import {suite} from "uvu"
import {equal as eq, is} from "uvu/assert"
import {Transport} from "./main.ts"
import {type FlatTrail} from "./trail.ts"

interface Context {
  o: J.ProjectReflection
}

const test = suite<Context>()

test.before(async (c) => {
  c.o = await setup()
})

test("Transport(): creates a new Transport instance", (c) => {
  const t = new Transport(c.o)
  const k = Object.keys(t)
  eq(k, [])
  eq(t.entities, [])
})

test("Transport.trailFor() and Transport.trailOf(): sets and gets a trail", (c) => {
  const t = new Transport(c.o)
  const d = new Declaration()

  const e: FlatTrail = [0]
  t.trailFor(d, e)

  const a = t.trailOf(d)
  eq(a, e)
})

test("Transport.idFor() and Transport.idOf(): sets and gets an id", (c) => {
  const t = new Transport(c.o)

  const e = 1
  t.idFor(0, e)

  const a = t.idOf(0)
  eq(a, e)
})

test("Transport.reflectionOf(): returns undefined for an invalid trail", (c) => {
  const t = new Transport(c.o)
  const r = t.reflectionOf([-1])
  is(r, undefined)
})

test("Transport.reflectionOf(): resolves a trail through children", (c) => {
  const t = new Transport(c.o)
  const r = t.reflectionOf([0, 0])
  is(r && r.id, 2)
})

test("Transport.reflectionOf(): resolves a trail through signatures", (c) => {
  const t = new Transport(c.o)
  const r = t.reflectionOf([0, 0, 0])
  is(r && r.id, 3)
})

test("Transport.reflectionOf(): resolves a trail through the type", (c) => {
  const t = new Transport(c.o)
  const r = t.reflectionOf([1, 0])
  is(r && r.id, 6)
})

test("Transport.reflectionOf(): resolves a trail through parameters", (c) => {
  const t = new Transport(c.o)
  const r = t.reflectionOf([0, 0, 0, 0])
  is(r && r.id, 4)
})

test("Transport.toReadable(): converts a tree to a readable stream", async (c) => {
  const t = new Transport(c.o)
  const r = t.toReadable()

  const a: J.Reflection[] = []
  for await (const d of r) {
    a.push(d)
  }

  eq(a, [c.o])
})

test("Transport.toWritable(): converts entities to a writable stream", (c) => {
  const t = new Transport(c.o)
  const w = t.toWritable()

  const e = new DeclarationEntity()
  w.write(e)

  eq(t.entities, [e])
})

test.run()

async function setup(): Promise<J.ProjectReflection> {
  const d = path.join("fixtures")
  const e = path.join(d, "main.ts")
  const c = path.join(d, "tsconfig.json")

  const a = await Application.bootstrapWithPlugins({
    entryPoints: [e],
    name: path.basename(d),
    tsconfig: c,
  })

  const p = await a.convert()
  if (!p) {
    throw new Error("Project is missing")
  }

  return a.serializer.projectToObject(p, d)
}
