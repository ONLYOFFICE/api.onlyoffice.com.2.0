import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Fragment, Group} from "../../lib/processor.ts"

export const name = "uses a description of the first overload if the own one is missing"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "025"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Functions"
  g.children = [2, 3, 4]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "f"
  d.narrative.summary = "Description of the first overload."
  d.narrative.description = "Description of the first overload."

  let f = new Fragment()
  f.name = "p"
  d.parameters = [f]

  t.entities.push(d.to())

  d = new Declaration()
  d.id = 3
  d.parentId = 1
  d.name = "f"
  d.narrative.summary = "Description of the second overload."
  d.narrative.description = "Description of the second overload."

  f = new Fragment()
  f.name = "p"
  d.parameters = [f]

  t.entities.push(d.to())

  d = new Declaration()
  d.id = 4
  d.parentId = 1
  d.name = "f"
  d.narrative.summary = "Description of the first overload."
  d.narrative.description = "Description of the first overload."

  f = new Fragment()
  f.name = "p"
  d.parameters = [f]

  t.entities.push(d.to())
}
