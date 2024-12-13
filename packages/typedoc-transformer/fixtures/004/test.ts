import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured enumeration"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "004"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Enumerations"
  g.children = [2]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "E"
  d.children = [3]
  t.entities.push(d.to())

  g = new Group()
  g.id = 3
  g.parentId = 2
  g.name = "Enumeration Members"
  g.children = [4, 5, 6, 7, 8]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 4
  d.parentId = 3
  d.name = "A"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 5
  d.parentId = 3
  d.name = "B"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 6
  d.parentId = 3
  d.name = "C"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 7
  d.parentId = 3
  d.name = "D"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 8
  d.parentId = 3
  d.name = "E"
  t.entities.push(d.to())
}
