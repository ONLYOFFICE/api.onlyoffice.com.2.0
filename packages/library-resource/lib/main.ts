import {readFile} from "node:fs/promises"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import type {Declaration} from "@onlyoffice/library-declaration"

export interface Resource {
  list(): Declaration[]
  retrieve(id: string): Declaration | undefined
}

export async function resource(df: string, mf: string): Promise<string> {
  const rd = rootDir()
  const fd = fixturesDir(rd)
  const rf = resourceFile(fd)
  let rc = await readFile(rf, "utf8")

  const d = "const d: Declaration[] = require"
  rc = rc.replace(`${d}("")`, `${d}("${df}")`)

  const m = "const m: Record<string, number> = require"
  rc = rc.replace(`${m}("")`, `${m}("${mf}")`)

  return rc
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function fixturesDir(d: string): string {
  return join(d, "fixtures")
}

function resourceFile(d: string): string {
  return join(d, "resource.ts")
}
