import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured variable"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "005"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Variables"
  g.children = [2, 3, 4]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "c"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 3
  d.parentId = 1
  d.name = "l"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 4
  d.parentId = 1
  d.name = "v"
  t.entities.push(d.to())
}
