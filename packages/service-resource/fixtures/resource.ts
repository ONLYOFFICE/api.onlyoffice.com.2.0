import {createRequire} from "node:module"
import type {Component, Declaration} from "@onlyoffice/service-declaration"

const require = createRequire(import.meta.url)

const d: Declaration[] = require("")
const c: Record<string, Component> = require("")

export function list(): Declaration[] {
  return d
}

export function resolve(id: string): Component | undefined {
  return c[id]
}
