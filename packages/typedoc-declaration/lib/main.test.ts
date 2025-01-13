import path from "node:path"
import {
  Declaration,
  DeclarationEntity,
  type Entity,
  GroupEntity,
} from "@onlyoffice/library-declaration/next.js"
import {
  EntityToken,
  KeywordToken,
  TextToken,
  type Token,
} from "@onlyoffice/signature"
import {Console as C2} from "@onlyoffice/typedoc-signature/console.js"
import {Console as C1} from "@onlyoffice/typedoc-transformer/console.js"
import {Application, type JSONOutput as J} from "typedoc"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Console as C0} from "./console.ts"
import {process} from "./main.ts"

test.before(() => {
  C0.shared.mute()
  C1.shared.mute()
  C2.shared.mute()
})

test.after(() => {
  C2.shared.unmute()
  C1.shared.unmute()
  C0.shared.unmute()
})

test("process(): process a project reflection", async () => {
  const o = await setup()
  const e: Entity[] = []
  let t: Token

  let d = new DeclarationEntity()
  d.id = 0
  d.parentId = -1
  d.children = [1]
  d.declaration = new Declaration()
  d.declaration.name = "fixtures"
  e.push(d)

  const g = new GroupEntity()
  g.id = 1
  g.parentId = 0
  g.children = [2]
  g.group.name = "Classes"
  e.push(g)

  d = new DeclarationEntity()
  d.id = 2
  d.parentId = 1
  d.children = []
  d.declaration.name = "C"
  e.push(d)

  t = new KeywordToken()
  t.text = "class"
  d.declaration.signature.verbose.push(t)

  t = new TextToken()
  t.text = " "
  d.declaration.signature.verbose.push(t)

  t = new EntityToken()
  t.text = "C"
  d.declaration.signature.verbose.push(t)

  const a = await process(o)
  eq(a, e)
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
