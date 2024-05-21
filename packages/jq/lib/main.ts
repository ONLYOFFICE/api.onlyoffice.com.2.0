import {spawn} from "node:child_process"
import type {Writable} from "node:stream"
import {hasCommand} from "@onlyoffice/command"

export function hasJQ(): Promise<boolean> {
  return hasCommand("jq")
}

export function jq(w: Writable, opts: string[] = []): Promise<void> {
  return new Promise((res, rej) => {
    const s = spawn("jq", ["--monochrome-output", ...opts])
    s.stdout.on("data", (ch) => {
      w.write(ch)
    })
    s.on("close", res)
    s.on("error", rej)
  })
}
