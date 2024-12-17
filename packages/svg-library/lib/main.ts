import {existsSync} from "node:fs"
import {mkdir, readFile, readdir, stat, writeFile} from "node:fs/promises"
import path from "node:path"
import {argv} from "node:process"
import {pascalCase} from "@onlyoffice/strings"
import {toJsFile, toTdsFile} from "@onlyoffice/svg-preact"
import sade from "sade"
import {Console} from "./console.ts"

const console = Console.shared

function main(): void {
  sade("svg-library <src> <dest>", true)
    .action(build)
    .parse(argv)
}

async function build(src: string, dest: string): Promise<void> {
  if (!existsSync(src)) {
    throw new Error(`Source directory does not exist: ${src}`)
  }
  console.log("Start building")
  await walk(src, dest)
  console.log("Build complete")
}

async function walk(src: string, dest: string): Promise<void> {
  const m: string[] = []

  if (!existsSync(dest)) {
    await mkdir(dest, {recursive: true})
  }

  const a = await readdir(src)

  for (const n of a) {
    const p = path.join(src, n)
    const t = await stat(p)

    if (t.isDirectory()) {
      const d = path.join(dest, n)
      await walk(p, d)
      continue
    }

    const e = path.extname(n)
    if (e !== ".svg") {
      continue
    }

    const b = path.basename(n, e)
    const x = pascalCase(b)

    const s = await readFile(p, "utf8")

    let f = path.join(dest, `${x}.js`)
    let c = await toJsFile(x, s)

    console.log(`Writing ${f}`)
    await writeFile(f, c)

    f = path.join(dest, `${x}.d.ts`)
    c = toTdsFile(x)

    console.log(`Writing ${f}`)
    await writeFile(f, c)

    m.push(x)
  }

  let d = path.dirname(dest)
  let g = "."
  let n: string

  if (d === ".") {
    d = dest
    n = "main"
  } else {
    n = path.basename(dest)
    g += `/${n}`
  }

  let f = path.join(d, `${n}.js`)
  let c = ""

  for (const x of m) {
    c += `export {${x}} from "${g}/${x}.js";\n`
  }

  if (c.length === 0) {
    return
  }

  console.log(`Writing ${f}`)
  await writeFile(f, c)

  f = path.join(d, `${n}.d.ts`)
  c = ""

  for (const x of m) {
    c += `export {${x}} from "${g}/${x}.js";\n`
  }

  if (c.length === 0) {
    return
  }

  console.log(`Writing ${f}`)
  await writeFile(f, c)
}

main()
