import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Fragment, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured interface"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "002"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Interfaces"
  g.children = [2]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "I"
  d.children = [3, 4, 5]
  t.entities.push(d.to())

  g = new Group()
  g.id = 3
  g.parentId = 2
  g.name = "Properties"
  g.children = [6]
  t.entities.push(g.to())

  g = new Group()
  g.id = 4
  g.parentId = 2
  g.name = "Accessors"
  g.children = [7]
  t.entities.push(g.to())

  g = new Group()
  g.id = 5
  g.parentId = 2
  g.name = "Methods"
  g.children = [8]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 6
  d.parentId = 3
  d.name = "p"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 7
  d.parentId = 4
  d.name = "g"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 8
  d.parentId = 5
  d.name = "m"
  let f = new Fragment()
  f.name = "v"
  d.parameters = [f]
  t.entities.push(d.to())
}
