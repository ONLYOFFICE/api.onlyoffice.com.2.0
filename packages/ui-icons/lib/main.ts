// todo: Replace primitive component generation with babel.
// https://github.com/tailwindlabs/heroicons/
// todo: Separate logos from icons.

import {mkdir, readFile, readdir, rm, writeFile} from "node:fs/promises"
import {existsSync} from "node:fs"
import {join, parse} from "node:path"
import {argv} from "node:process"
import {URL, fileURLToPath} from "node:url"
import sade from "sade"

function main(): void {
  sade("ui-colors", true)
    .action(build)
    .parse(argv)
}

async function build(): Promise<void> {
  const rd = rootDir()

  const dd = distDir(rd)
  if (existsSync(dd)) {
    await rm(dd, {recursive: true})
  }

  await mkdir(dd)

  const of = outputFile(dd)
  let oc = 'import {h} from "preact"\n\n'

  const sd = staticDir(rd)
  const ls = await readdir(sd)
  for (let f of ls) {
    f = join(sd, f)
    const p = parse(f)
    const n = rename(p.name)
    let c = await readFile(f, "utf8")
    c = c.trim()
    c = wrap(n, c)
    oc += `${c}\n`
  }

  oc = oc.slice(0, -1)

  await writeFile(of, oc)
}

function rename(s: string): string {
  return s.split("-").map((w) => w.charAt(0).toUpperCase() + w.slice(1)).join("")
}

function wrap(n: string, c: string): string {
  return `export function ${n}() {\n  return ${c}\n}\n`
}

function rootDir(): string {
  const u = new URL("..", import.meta.url)
  return fileURLToPath(u)
}

function distDir(d: string): string {
  return join(d, "dist")
}

function staticDir(d: string): string {
  return join(d, "static")
}

function outputFile(d: string): string {
  return join(d, "main.tsx")
}

main()
