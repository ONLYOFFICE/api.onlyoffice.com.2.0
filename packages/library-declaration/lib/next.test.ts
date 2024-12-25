import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  Declaration,
  DeclarationEntity,
  DeclarationReturns,
  DeclarationSignature,
  Fragment,
  FragmentSignature,
  Group,
  GroupEntity,
} from "./next.ts"

test("FragmentSignature(): creates a new FragmentSignature instance", () => {
  const s = new FragmentSignature()
  const k = Object.keys(s)
  eq(k, ["concise"])
  eq(s.concise, [])
})

test("Fragment(): creates a new Fragment instance", () => {
  const f = new Fragment()
  const k = Object.keys(f)
  eq(k, ["name", "signature", "optional", "default", "example", "description"])
  eq(f.name, "")
  eq(f.signature, new FragmentSignature())
  eq(f.optional, false)
  eq(f.default, "")
  eq(f.example, "")
  eq(f.description, "")
})

test("DeclarationReturns(): creates a new DeclarationReturns instance", () => {
  const r = new DeclarationReturns()
  const k = Object.keys(r)
  eq(k, ["signature", "description"])
  eq(r.signature, new FragmentSignature())
  eq(r.description, "")
})

test("DeclarationSignature(): creates a new DeclarationSignature instance", () => {
  const s = new DeclarationSignature()
  const k = Object.keys(s)
  eq(k, ["concise", "verbose"])
  eq(s.concise, [])
  eq(s.verbose, [])
})

test("Declaration(): creates a new Declaration instance", () => {
  const d = new Declaration()
  const k = Object.keys(d)
  eq(k, [
    "name",
    "signature",
    "summary",
    "description",
    "parameters",
    "returns",
    "examples",
  ])
  eq(d.name, "")
  eq(d.signature, new DeclarationSignature())
  eq(d.summary, "")
  eq(d.description, "")
  eq(d.parameters, [])
  eq(d.returns, new DeclarationReturns())
  eq(d.examples, "")
})

test("Group(): creates a new Group instance", () => {
  const g = new Group()
  const k = Object.keys(g)
  eq(k, ["name", "description"])
  eq(g.name, "")
  eq(g.description, "")
})

test("DeclarationEntity(): creates a new DeclarationEntity instance", () => {
  const e = new DeclarationEntity()
  const k = Object.keys(e)
  eq(k, ["id", "type", "parentId", "children", "declaration"])
  eq(e.id, -1)
  eq(e.type, "declaration")
  eq(e.parentId, -1)
  eq(e.children, [])
  eq(e.declaration, new Declaration())
})

test("GroupEntity(): creates a new GroupEntity instance", () => {
  const e = new GroupEntity()
  const k = Object.keys(e)
  eq(k, ["id", "type", "parentId", "children", "group"])
  eq(e.id, -1)
  eq(e.type, "group")
  eq(e.parentId, -1)
  eq(e.children, [])
  eq(e.group, new Group())
})

test.run()
