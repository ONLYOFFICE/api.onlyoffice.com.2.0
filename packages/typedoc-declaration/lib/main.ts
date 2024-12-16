import {pipeline} from "node:stream"
import {promisify} from "node:util"
import type * as L from "@onlyoffice/library-declaration/next.ts"
import {Transformer} from "@onlyoffice/typedoc-transformer"
import {Transport} from "@onlyoffice/typedoc-transport"
import {type JSONOutput as J} from "typedoc"
import {Console} from "./console.ts"

const pipe = promisify(pipeline)
const console = Console.shared

export async function process(o: J.Reflection): Promise<L.Entity[]> {
  console.log(`Start processing ${o.name} #${o.id}`)

  const tp = new Transport(o)
  const tf = new Transformer(tp)

  await pipe(tp.toReadable(), tf, tp.toWritable())

  console.log(`Finish processing ${o.name} #${o.id}`)

  return tp.entities
}
