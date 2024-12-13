import path from "node:path"
import {
  Declaration,
  DeclarationEntity,
  type Entity,
  GroupEntity,
} from "@onlyoffice/library-declaration/next.ts"
import {Console as C1} from "@onlyoffice/typedoc-transformer/console.ts"
import {Application, type JSONOutput as J} from "typedoc"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Console as C0} from "./console.ts"
import {process} from "./main.ts"

test.before(() => {
  C0.shared.mute()
  C1.shared.mute()
})

test.after(() => {
  C1.shared.unmute()
  C0.shared.unmute()
})

test("process(): process a project reflection", async () => {
  const o = await setup()
  const e: Entity[] = []

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
