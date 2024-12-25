import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "transforms with multiple custom categories"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "011"
  d.children = [1, 2]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "C"
  g.children = [3]
  t.entities.push(g.to())

  g = new Group()
  g.id = 2
  g.parentId = 0
  g.name = "L"
  g.children = [4]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 3
  d.parentId = 1
  d.name = "c"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 4
  d.parentId = 2
  d.name = "l"
  t.entities.push(d.to())
}
