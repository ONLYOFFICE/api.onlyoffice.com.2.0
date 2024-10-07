import {spawn} from "node:child_process"
import {type Readable, type Writable} from "node:stream"
import {hasCommand} from "@onlyoffice/command"
import {StringWritable} from "@onlyoffice/stream-string"

export async function throughJq(w: Writable): Promise<ThroughJq> {
  if (!await hasJq()) {
    return new ThroughJq(w)
  }
  const s = new StringWritable()
  return new ThroughJq(w, s)
}

export class ThroughJq {
  #w: Writable
  #s?: StringWritable

  get w(): Writable {
    if (!this.#s) {
      return this.#w
    }
    return this.#s
  }

  constructor(w: Writable, s?: StringWritable) {
    this.#w = w
    this.#s = s
  }

  async beautify(): Promise<void> {
    if (!this.#s) {
      return
    }
    const r = this.#s.toReadable()
    await jq(r, this.#w)
  }
}

async function jq(r: Readable, w: Writable): Promise<void> {
  await new Promise((res, rej) => {
    const s = spawn("jq", ["--monochrome-output"], {shell: true})
    r.pipe(s.stdin)
    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
    s.on("close", res)
    s.on("error", rej)
  })
}

async function hasJq(): Promise<boolean> {
  return await hasCommand("jq")
}
