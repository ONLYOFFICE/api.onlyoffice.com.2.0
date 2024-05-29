import {readFile} from "node:fs/promises"
import {join} from "node:path"
import {URL, fileURLToPath} from "node:url"
import type {Component, Declaration} from "@onlyoffice/service-declaration"

export interface Resource {
  list(): Declaration[]
  resolve(id: string): Component | undefined
}

export function nop(): Resource {
  return {
    list() {
      return []
    },
    resolve(): undefined {
      return undefined
    }
  }
}

export async function resource(df: string, cf: string): Promise<string> {
  const rd = rootDir()
  const fd = fixturesDir(rd)
  const rf = resourceFile(fd)
  let rc = await readFile(rf, "utf8")

  const d = "const d: Declaration[] = require"
  rc = rc.replace(`${d}("")`, `${d}("${df}")`)

  const c = "const c: Record<string, Component> = require"
  rc = rc.replace(`${c}("")`, `${c}("${cf}")`)

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
