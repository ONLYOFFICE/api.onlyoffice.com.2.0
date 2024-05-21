import {createReadStream, createWriteStream} from "node:fs"
import type {TransformCallback} from "node:stream"
import {Readable, Transform} from "node:stream"
import MultiStream from "multistream"
import Chain from "stream-chain"
import StreamArray from "stream-json/streamers/StreamArray.js"
import StreamObject from "stream-json/streamers/StreamObject.js"
import Disassembler from "stream-json/Disassembler.js"
import Parser from "stream-json/Parser.js"
import Stringer from "stream-json/Stringer.js"

interface ChainChunk {
  key: unknown
  value: unknown
}

/**
 * Creates a readable stream from a string.
 * @param s The string to convert into a readable stream.
 * @returns A readable stream that emits the provided string.
 */
export function createStringStream(s: string): Readable {
  return new Readable({
    read() {
      this.push(s)
      this.push(null)
    }
  })
}

/**
 * Merges multiple streams with an array of objects into a single one.
 * @param from The streams to merge.
 * @param to The path to save the merged streams.
 */
export function mergeArrays(from: MultiStream.Streams, to: string): Promise<void> {
  return chain(
    new MultiStream(from),
    new Parser({jsonStreaming: true}),
    new StreamArray(),
    (ch: {value: unknown}): unknown => {
      return ch.value
    },
    new Disassembler(),
    new Stringer({makeArray: true}),
    createWriteStream(to)
  )
}

/**
 * Merges multiple streams with objects into a single one.
 * @param from The streams to merge.
 * @param to The path to save the merged streams.
 */
export function mergeObjects(from: MultiStream.Streams, to: string): Promise<void> {
  return chain(
    new MultiStream(from),
    new Parser({jsonStreaming: true}),
    new StreamObject(),
    new UnStreamObject(),
    makeObject(),
    new Stringer(),
    createWriteStream(to)
  )
}

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
  ) {
    this.push(ch, enc)
    cb(null)
  }
}

/**
 * Creates an index map from a stream of object arrays, using a specified key.
 * @param from The path to the stream of object arrays.
 * @param to The path to save the index map.
 * @param by The key to use for the index map.
 */
export function createIndexes(from: string, to: string, by: string): Promise<void> {
  return chain(
    createReadStream(from),
    new Parser(),
    new StreamArray(),
    new StreamIndex(by),
    new UnStreamObject(),
    makeObject(),
    new Stringer(),
    createWriteStream(to)
  )
}

class StreamIndex extends Transform {
  _by: string
  _i: number

  constructor(by: string) {
    super({objectMode: true})
    this._by = by
    this._i = 0
  }

  _transform(ch: ChainChunk, _: BufferEncoding, cb: TransformCallback): void {
    if (ch.value === null) {
      throw new Error("Null object")
    }
    if (typeof ch.value !== "object") {
      throw new Error("Not an object")
    }
    if (!(this._by in ch.value)) {
      throw new Error("No such key")
    }
    const k = (ch.value as any)[this._by]
    if (typeof k !== "string") {
      throw new Error("Not a string")
    }
    this.push({key: k, value: this._i})
    this._i += 1
    cb(null)
  }
}

/**
 * Creates a promised version of the stream-chain package.
 * @param opts The options to pass to the chain.
 */
export function chain(...opts: ConstructorParameters<typeof Chain>[0]): Promise<void> {
  return new Promise((res, rej) => {
    const c = new Chain(opts)
    c.on("error", rej)
    c.on("close", res)
  })
}

export class UnStreamObject extends Disassembler {
  _transform(ch: ChainChunk, _: BufferEncoding, cb: TransformCallback): void {
    this.push({name: "startKey"})
    this.push({name: "stringChunk", value: ch.key})
    this.push({name: "endKey"})
    super._transform(ch.value, _, cb)
  }
}
