import {readdir} from "node:fs/promises"
import path from "node:path"
import {pipeline} from "node:stream"
import {promisify} from "node:util"
import {DeclarationEntity, type Entity, GroupEntity} from "@onlyoffice/library-declaration/next.js"
import {type Signature} from "@onlyoffice/signature"
import {Transformer} from "@onlyoffice/typedoc-transformer"
import {Console as C1} from "@onlyoffice/typedoc-transformer/console.js"
import {Transport} from "@onlyoffice/typedoc-transport"
import {Application, type JSONOutput as J, type TypeDocOptions} from "typedoc"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import * as C from "./concise.ts"
import {Console as C0} from "./console.ts"
import {type Context} from "./context.ts"
import {Formatter} from "./formatter.ts"
import {compute} from "./main.ts"
import {State} from "./state.ts"
import * as V from "./verbose.ts"
const pipe = promisify(pipeline)

test.before(() => {
  C0.shared.mute()
  C1.shared.mute()
})

test.after(() => {
  C1.shared.unmute()
  C0.shared.unmute()
})

interface F {
  (cf: Context, t: J.Reflection, p?: J.Reflection): Signature
}

const fs: F[] = [
  V.classDeclaration,
  V.classDeclaration,
  V.constructorDeclaration,
  V.enumMemberReflection,
  C.enumMemberReflection,
  V.enumReflection,
  V.functionsDeclaration,
  C.functionsDeclaration,
  V.interfaceReflection,
  C.methodDeclaration,
  V.propertyReflection,
  C.propertyReflection,
  V.typeAliasReflection,
  V.variableDeclaration,
  C.variableDeclaration,
]

const t = await setupReflection("000", {})

const tp = new Transport(t)

const cf: Context = {
  s: new State(),
  f: new Formatter(),
  t: tp,
}

for (const f of fs) {
  test(`${f.name}(): returns an empty array when sending projectReflection`, () => {
    const a = f(cf, t)
    eq(a, [])
  })
}

test("constructorDeclaration(): returns an empty array when sending projectReflection", () => {
  const a = C.constructorDeclaration(t)
  eq(a, [])
})

test("methodDeclaration(): returns an empty array when sending projectReflection", () => {
  const a = V.methodDeclaration(cf, t, t)
  eq(a, [])
})

for (const n of await readdir("fixtures")) {
  const t = await setupTest(n)

  let f
  if (t.name.startsWith("skip: ")) {
    f = test.skip.bind(test)
  } else {
    f = test
  }

  f(`${n}: ${t.name}`, async () => {
    const o = await setupReflection(n, t.options)

    const a = t.collection
    const e = await process(o)

    for (const x of a) {
      if (x instanceof GroupEntity) {
        continue
      }

      if (x.id === 0) {
        continue
      }

      let c = new DeclarationEntity()

      for (const y of e) {
        if (x.id === y.id && !(y instanceof GroupEntity)) {
          c = y
          break
        }
      }

      eq(c.id, x.id)
      eq(c.declaration.parameters, x.declaration.parameters)
      eq(c.declaration.signature.verbose, x.declaration.signature.verbose)
      eq(c.declaration.signature.concise, x.declaration.signature.concise)
      eq(c.declaration.returns.signature.concise, x.declaration.returns.signature.concise)
    }
  })
}

test.run()

interface Test {
  name: string
  options: Partial<TypeDocOptions>
  collection: DeclarationEntity[]
}

async function setupTest(n: string): Promise<Test> {
  const m = await import(`../fixtures/${n}/test.ts`)
  const t: Test = {name: m.name, options: {}, collection: m.collection}
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

export async function process(o: J.ProjectReflection): Promise<Entity[]> {
  const tp = new Transport(o)
  const tf = new Transformer(tp)

  await pipe(tp.toReadable(), tf, tp.toWritable())

  compute(tp)
  return tp.entities
}
