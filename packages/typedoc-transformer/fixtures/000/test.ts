import {Transport} from "@onlyoffice/typedoc-transport"
import {Declaration} from "../../lib/processor.ts"

export const name = "transforms an empty project"

export function cb(t: Transport): void {
  const d = new Declaration()
  d.id = 0
  d.name = "000"
  t.entities.push(d.to())
}
