import {Readable, Writable} from "node:stream"
import {
  type Definition,
  type Entity,
} from "@onlyoffice/library-declaration/next.ts"
import {type JSONOutput as J} from "typedoc"
import {type FlatTrail, resolveTrail} from "./trail.ts"

export class Transport {
  #tree: J.Reflection

  #entities: Entity[] = []

  get entities(): Entity[] {
    return this.#entities
  }

  #trailIndex = new Map<Definition, FlatTrail>()

  #idIndex = new Map<number, number>()

  constructor(o: J.Reflection) {
    this.#tree = o
  }

  trailFor(t: Definition, f: FlatTrail): void {
    this.#trailIndex.set(t, f)
  }

  idFor(s: number, e: number): void {
    this.#idIndex.set(s, e)
  }

  reflectionOf(t: FlatTrail): J.Reflection | undefined {
    return resolveTrail(this.#tree, t)
  }

  trailOf(t: Definition): FlatTrail | undefined {
    return this.#trailIndex.get(t)
  }

  idOf(id: number): number | undefined {
    return this.#idIndex.get(id)
  }

  toReadable(): Readable {
    return Readable.from([this.#tree])
  }

  toWritable(): Writable {
    const a = this.#entities
    return new Writable({
      objectMode: true,
      write(ch, _, cb) {
        a.push(ch)
        cb()
      },
    })
  }
}
