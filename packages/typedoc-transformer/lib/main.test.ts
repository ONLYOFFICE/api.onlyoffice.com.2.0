import {readdir} from "node:fs/promises"
import path from "node:path"
import {pipeline} from "node:stream"
import {promisify} from "node:util"
import {type Definition} from "@onlyoffice/library-declaration/next.ts"
import {Transport} from "@onlyoffice/typedoc-transport"
import {Application, type JSONOutput as J, type TypeDocOptions} from "typedoc"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Console} from "./console.ts"
import {Transformer} from "./main.ts"
import {type FlatTrail} from "./trail.ts"

const pipe = promisify(pipeline)

class MockTransport extends Transport {
  trailForStack: [Definition, FlatTrail][] = []

  trailFor(t: Definition, f: FlatTrail): void {
    this.trailForStack.push([t, f])
    super.trailFor(t, f)
  }

  idForStack: [number, number][] = []

  idFor(s: number, e: number): void {
    this.idForStack.push([s, e])
    super.idFor(s, e)
  }
}

test.before(() => {
  Console.shared.mute()
})

test.after(() => {
  Console.shared.unmute()
})

for (const f of await readdir("fixtures")) {
  const t = await setupTest(f)

  test(`${f}: ${t.name}`, async () => {
    const o = await setupReflection(f, t.options)

    const e = new MockTransport(o)
    t.cb(e)

    const a = await transform(o)
    eq(a.entities, e.entities)

    // todo: would be nice to test them too
    // eq(a.trailForStack, e.trailForStack)
    // eq(a.idForStack, e.idForStack)
  })
}

test.run()

interface Test {
  name: string
  options: Partial<TypeDocOptions>
  cb(t: Transport): void
}

async function setupTest(n: string): Promise<Test> {
  const d = path.join("..", "fixtures", n)
  const f = path.join(d, "test.ts")
  const m = await import(f)
  const t: Test = {name: m.name, options: {}, cb: m.cb}
  if (m.options) {
    t.options = m.options
  }
  return t
}

async function setupReflection(n: string, opts: Partial<TypeDocOptions>): Promise<J.ProjectReflection> {
  const d = path.join("fixtures", n)
  const e = path.join(d, "main.ts")
  const c = path.join(d, "tsconfig.json")

  const a = await Application.bootstrapWithPlugins({
    entryPoints: [e],
    logLevel: "None",
    name: path.basename(d),
    tsconfig: c,
    ...opts,
  })

  const p = await a.convert()
  if (!p) {
    throw new Error("Project is missing")
  }

  return a.serializer.projectToObject(p, d)
}

async function transform(o: J.Reflection): Promise<MockTransport> {
  const p = new MockTransport(o)
  const f = new Transformer(p)
  await pipe(p.toReadable(), f, p.toWritable())
  return p
}
