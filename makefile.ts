import {spawn} from "node:child_process"
import {existsSync} from "node:fs"
import {readFile, readdir} from "node:fs/promises"
import path from "node:path"
import {argv} from "node:process"
import sade from "sade"

interface PackageJson {
  dependencies?: Record<string, string>
  devDependencies?: Record<string, string>
}

function main(): void {
  sade("makefile.ts")
    .command("clean")
    .describe("Recursively run 'pnpm clean' on all packages")
    .action(async (p: {_: string[]}) => {
      if (p._.length === 0) {
        p._ = await readdir("packages")
      }
      for (const n of p._) {
        await run(n, "clean")
      }
    })
    .command("build")
    .describe("Recursively run 'pnpm build' on all packages")
    .action(async (p: {_: string[]}) => {
      if (p._.length === 0) {
        const t = await tree()
        p._ = list(t)
      }
      for (const n of p._) {
        await run(n, "build")
      }
    })
    .command("test")
    .describe("Recursively run 'pnpm test' on all packages")
    .action(async (p: {_: string[]}) => {
      if (p._.length === 0) {
        const t = await tree()
        p._ = list(t)
      }
      for (const n of p._) {
        // todo: this is a temporary solution to run only verified tests.
        if (
          n !== "signature" &&
          n !== "service-declaration" &&
          n !== "openapi-declaration" &&
          n !== "svg-preact"
        ) {
          continue
        }
        await run(n, "test")
      }
    })
    .parse(argv)
}

async function tree(): Promise<Record<string, string[]>> {
  const t: Record<string, string[]> = {}
  const a = await readdir("packages")

  for (const n of a) {
    const f = path.join("packages", n, "package.json")
    if (!existsSync(f)) {
      continue
    }

    const s = await readFile(f, "utf8")
    const j = JSON.parse(s) as PackageJson

    const d = []
    if (j.dependencies) {
      d.push(j.dependencies)
    }
    if (j.devDependencies) {
      d.push(j.devDependencies)
    }

    const a = []
    for (const o of d) {
      for (const [n, v] of Object.entries(o)) {
        if (n.startsWith("@onlyoffice/") && v.startsWith("workspace:")) {
          const s = n.replace("@onlyoffice/", "")
          a.push(s)
        }
      }
    }

    t[n] = a
  }

  return t
}

function list(t: Record<string, string[]>): string[] {
  const s: string[] = []
  const c = new Set<string>()
  const v = new Set<string>()

  let a = Object.keys(t)
  a = a.sort()

  for (const n of a) {
    visit(n)
  }

  return s

  function visit(n: string): void {
    if (c.has(n)) {
      throw new Error(`Circular dependency detected: ${n}`)
    }

    if (!v.has(n)) {
      c.add(n)

      const a = t[n]
      if (a) {
        for (const n of a) {
          visit(n)
        }
      }

      c.delete(n)
      v.add(n)
      s.push(n)
    }
  }
}

async function run(n: string, cmd: string): Promise<void> {
  const d = path.join("packages", n)
  const f = path.join(d, "package.json")
  if (!existsSync(f)) {
    return
  }

  const c = await readFile(f, "utf8")
  const o = JSON.parse(c)
  if (!o.scripts || !o.scripts[cmd]) {
    return
  }

  await new Promise((res, rej) => {
    const s = spawn("pnpm", [cmd], {cwd: d, shell: true, stdio: "inherit"})
    s.on("error", rej)
    s.on("close", (c) => {
      if (c !== 0) {
        rej(new Error(`Failed to execute '${cmd}' of '${o.name}'`))
        return
      }
      res(c)
    })
  })
}

main()
