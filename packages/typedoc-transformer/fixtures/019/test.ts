import {type Transport} from "@onlyoffice/typedoc-transport"
import {Declaration, Group} from "../../lib/processor.ts"

export const name = "populates the narrative fields with the head and @remarks tag"

export function cb(t: Transport): void {
  let d = new Declaration()
  d.id = 0
  d.name = "019"
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
  d.narrative.summary = "The head description should be sanitized and formatted."
  d.narrative.description = "The head description should be sanitized and formatted.\n\n```ts\n// From the head.\n```\n\nThe remarks description should be sanitized and formatted.\n\n```ts\n// From the remarks.\n```"
  t.entities.push(d.to())
}
