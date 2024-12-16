import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured namespace"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "007"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Namespaces"
  g.children = [2]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "N"
  d.children = [3]
  t.entities.push(d.to())

  g = new Group()
  g.id = 3
  g.parentId = 2
  g.name = "Variables"
  g.children = [4]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 4
  d.parentId = 3
  d.name = "v"
  t.entities.push(d.to())
}
