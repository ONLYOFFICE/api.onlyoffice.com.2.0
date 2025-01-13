/* c8 ignore start */
// Interfaces are not tested as they only define data structure, not logic or behavior
import {
  type Declaration,
  type Entity,
  type Fragment,
} from "@onlyoffice/library-declaration/next.js"
import {type JSONOutput as J} from "typedoc"

export interface Transport {
  entities: Entity[]
  trailOf(t: Declaration | Fragment): FlatTrail | undefined
  reflectionOf(t: FlatTrail): J.Reflection | undefined
  idOf(id: number): number | undefined
}

export type FlatTrail = number[]
/* c8 ignore stop */
