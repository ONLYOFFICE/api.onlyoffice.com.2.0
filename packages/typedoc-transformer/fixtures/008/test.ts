import {Transport} from "@onlyoffice/typedoc-transport"
import {type TypeDocOptions} from "typedoc"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured module"

export const options: Partial<TypeDocOptions> = {
  entryPoints: ["fixtures/008"],
  entryPointStrategy: "expand",
}

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "008"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Modules"
  g.children = [2, 5]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "another"
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
  d.name = "a"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 5
  d.parentId = 1
  d.name = "main"
  d.children = [6]
  t.entities.push(d.to())

  g = new Group()
  g.id = 6
  g.parentId = 5
  g.name = "Variables"
  g.children = [7]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 7
  d.parentId = 6
  d.name = "m"
  t.entities.push(d.to())
}
