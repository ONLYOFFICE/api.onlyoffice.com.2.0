import {
  PassThrough,
  Transform,
  type TransformCallback,
  pipeline,
} from "node:stream"
import type * as L from "@onlyoffice/library-declaration/next.js"
import {type JSONOutput as J} from "typedoc"
import {Collector} from "./collector.ts"
import {type Entity, Processor} from "./processor.ts"
import {Shaker} from "./shaker.ts"
import {type FlatTrail} from "./trail.ts"

// todo: support for nested categories
// todo: support for the readme description
// todo: remove the group sorting, as it is the responsibility of the site
// todo: remove the shaker block
// todo: migrate to the flat trail

export interface TransformerTransport {
  trailFor(t: L.Definition, f: FlatTrail): void
  idFor(s: number, e: number): void
  reflectionOf(t: FlatTrail): J.Reflection | undefined
}

export class Transformer extends Transform {
  #in: PassThrough
  #out: PassThrough

  constructor(tt: TransformerTransport) {
    super({objectMode: true})

    const input = new PassThrough({objectMode: true})
    const output = new PassThrough({objectMode: true})

    output.on("data", (ch) => {
      this.push(ch)
    })

    output.on("end", () => {
      this.push(null)
    })

    const pr = new Processor()
    const sh = new Shaker()
    const sb = new ShakerBlock()
    const cl = new Collector(tt)

    sh.onResolve = function onResolve(t) {
      return tt.reflectionOf(t)
    }

    sh.onRetrieve = function onRetrieve(id) {
      return sb.c[id]
    }

    pipeline(
      input,
      pr,
      sh,
      sb,
      cl,
      output,
      (err) => {
        if (err) {
          this.emit("error", err)
        }
      },
    )

    this.#in = input
    this.#out = output
  }

  _transform(ch: unknown, enc: BufferEncoding, cb: TransformCallback): void {
    this.#in.write(ch, enc, cb)
  }

  _flush(cb: TransformCallback): void {
    this.#in.end()
    this.#out.once("end", cb)
  }
}

class ShakerBlock extends Transform {
  c: Entity[]

  constructor() {
    super({objectMode: true})
    this.c = []
  }

  _transform(ch: Entity, _: BufferEncoding, cb: TransformCallback): void {
    this.c.push(ch)
    cb()
  }

  _flush(cb: TransformCallback): void {
    for (const ch of this.c) {
      this.push(ch)
    }
    this.c = []
    cb()
  }
}
