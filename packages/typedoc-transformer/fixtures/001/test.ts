import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Fragment, Group} from "../../lib/processor.ts"

export const name = "transforms a full-featured class"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "001"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Classes"
  g.children = [2]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "C"
  d.children = [3, 4, 5, 6, 7, 8, 9]
  t.entities.push(d.to())

  g = new Group()
  g.id = 3
  g.parentId = 2
  g.name = "Constructors"
  g.children = [10]
  t.entities.push(g.to())

  g = new Group()
  g.id = 4
  g.parentId = 2
  g.name = "Type Properties"
  g.children = [12]
  t.entities.push(g.to())

  g = new Group()
  g.id = 5
  g.parentId = 2
  g.name = "Type Accessors"
  g.children = [14]
  t.entities.push(g.to())

  g = new Group()
  g.id = 6
  g.parentId = 2
  g.name = "Type Methods"
  g.children = [16]
  t.entities.push(g.to())

  g = new Group()
  g.id = 7
  g.parentId = 2
  g.name = "Instance Properties"
  g.children = [11]
  t.entities.push(g.to())

  g = new Group()
  g.id = 8
  g.parentId = 2
  g.name = "Instance Accessors"
  g.children = [13]
  t.entities.push(g.to())

  g = new Group()
  g.id = 9
  g.parentId = 2
  g.name = "Instance Methods"
  g.children = [15]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 10
  d.parentId = 3
  d.name = "constructor"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 11
  d.parentId = 7
  d.name = "p"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 12
  d.parentId = 4
  d.name = "p"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 13
  d.parentId = 8
  d.name = "g"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 14
  d.parentId = 5
  d.name = "g"
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 15
  d.parentId = 9
  d.name = "m"
  let f = new Fragment()
  f.name = "v"
  d.parameters = [f]
  t.entities.push(d.to())

  d = new Declaration()
  d.id = 16
  d.parentId = 6
  d.name = "m"
  f = new Fragment()
  f.name = "v"
  d.parameters = [f]
  t.entities.push(d.to())
}
