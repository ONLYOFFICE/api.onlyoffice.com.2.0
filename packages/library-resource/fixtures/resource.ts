import {createRequire} from "node:module"
import type {Declaration} from "@onlyoffice/library-declaration"

const require = createRequire(import.meta.url)

const d: Declaration[] = require("")
const m: Record<string, number> = require("")

export function list(): Declaration[] {
  return d
}

export function retrieve(id: string): Declaration | undefined {
  const i = m[id]
  if (i === undefined) {
    return undefined
  }
  return d[i]
}
