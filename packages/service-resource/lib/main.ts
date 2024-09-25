import {readFile} from "node:fs/promises"
import path from "node:path"
import {URL, fileURLToPath} from "node:url"
import {escape} from "@onlyoffice/node-path/win32.ts"
import {type Declaration} from "@onlyoffice/service-declaration"

export interface Resource {
  list(this: void): Declaration[]
  retrieve(this: void, id: string): Declaration | undefined
}

export function nop(): Resource {
  return {
    list() {
      return []
    },
    retrieve(): undefined {
      return undefined
    },
  }
}

export async function resource(df: string, mf: string): Promise<string> {
  const rd = rootDir()
  const fd = fixturesDir(rd)
  const rf = resourceFile(fd)
  let rc = await readFile(rf, "utf8")

  const d = "const d: Declaration[] = require"
  rc = rc.replace(`${d}("")`, `${d}("${escape(df)}")`)

  const m = "const m: Record<string, number> = require"
  rc = rc.replace(`${m}("")`, `${m}("${escape(mf)}")`)

  return rc
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function fixturesDir(d: string): string {
  return path.join(d, "fixtures")
}

function resourceFile(d: string): string {
  return path.join(d, "resource.ts")
}
