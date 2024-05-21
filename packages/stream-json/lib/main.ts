import type {TransformCallback} from "node:stream"
import {Transform} from "node:stream"
import Disassembler from "stream-json/Disassembler.js"

/**
 * Returns a transform similar to the `stream-json/Stringer` with the
 * `makeArray` option is enabled. For more information, refer to the related
 * [issue](https://github.com/uhop/stream-json/pull/143/).
 */
export function makeObject(): Transform {
  return new Transform({
    objectMode: true,
    transform(ch, enc, cb) {
      this.push({name: "startObject"})
      this._transform = transformPassThrough
      return this._transform(ch, enc, cb)
    },
    flush(cb) {
      if (this._transform === transformPassThrough) {
        this.push({name: "endObject"})
      }
      cb(null)
    }
  })

  function transformPassThrough(
    this: Transform,
    ch: unknown,
    enc: BufferEncoding,
    cb: TransformCallback
  ): void {
    this.push(ch, enc)
    cb(null)
  }
}

export interface ChainChunk {
  key: unknown
  value: unknown
}

export class UnstreamObject extends Disassembler {
  _transform(ch: ChainChunk, _: BufferEncoding, cb: TransformCallback): void {
    this.push({name: "startKey"})
    this.push({name: "stringChunk", value: ch.key})
    this.push({name: "endKey"})
    super._transform(ch.value, _, cb)
  }
}
