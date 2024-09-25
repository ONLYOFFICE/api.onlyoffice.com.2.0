import {existsSync} from "node:fs"
import {mkdir, readFile, readdir, stat, writeFile} from "node:fs/promises"
import path from "node:path"
import {argv} from "node:process"
import {pascalCase} from "@onlyoffice/strings"
import {toJsxFile} from "@onlyoffice/svg-preact"
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
    const s = await stat(p)

    if (s.isDirectory()) {
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
    const o = path.join(dest, `${x}.tsx`)

    let c = await readFile(p, "utf8")
    c = await toJsxFile(x, c)

    console.log(`Writing ${o}`)
    await writeFile(o, c)

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

  const f = path.join(d, `${n}.tsx`)

  let c = ""
  for (const x of m) {
    c += `export {${x}} from "${g}/${x}.tsx";\n`
  }
  if (c.length === 0) {
    return
  }

  console.log(`Writing ${f}`)
  await writeFile(f, c)
}

main()
