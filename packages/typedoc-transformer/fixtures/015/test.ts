import {type Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "populates the narrative fields with the @summary tag only"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "015"
  d.children = [1]
  t.entities.push(d.to())

  let g = new Group()
  g.id = 1
  g.parentId = 0
  g.name = "Variables"
  g.children = [2]
  t.entities.push(g.to())

  d = new Declaration()
  d.id = 2
  d.parentId = 1
  d.name = "c"
  d.narrative.summary = "The description should be sanitized and formatted.\n\n```ts\nconst c = 0\n```"
  t.entities.push(d.to())
}
