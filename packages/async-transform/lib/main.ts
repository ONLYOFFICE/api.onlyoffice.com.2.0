import type {TransformCallback} from "node:stream"
import {Transform} from "node:stream"

export class AsyncTransform extends Transform {
  _transform(ch: unknown, _: BufferEncoding, cb: TransformCallback): void {
    this._atransform(ch).then(() => cb()).catch(cb)
  }

  async _atransform(_: unknown): Promise<void> {
    throw new Error("Not implemented")
  }
}
