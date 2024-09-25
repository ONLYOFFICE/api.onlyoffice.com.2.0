import {spawn} from "node:child_process"
import {existsSync} from "node:fs"
import {readFile, readdir} from "node:fs/promises"
import path from "node:path"
import {argv} from "node:process"
import sade from "sade"

const config: Record<string, string[]> = {
  build: [
    "eslint-config",
    "stylelint-config",
    "remark-lint-eslint",
    "remark-config",

    "jsdoc-resource-fixtures",
    "openapi-resource-fixtures",
    "pagefind-fixtures",

    "community-server-resource",
    "docspace-hosted-solutions-resource",
    "docspace-resource",
    "document-builder-resource",

    "ui-primitives",
    "ui-icons",
    "ui-logos",
  ],
  test: [
    "service-declaration",
    "openapi-declaration",

    "svg-preact",
  ],
}

function main(): void {
  sade("makefile.ts")
    .command("clean")
    .describe("Recursively run 'pnpm clean' on all packages")
    .action(async () => {
      const a = await readdir("packages")
      await recursive(a, "clean")
    })
    .command("build")
    .describe("Recursively run 'pnpm build' on all packages")
    .action(async (p) => {
      const a = resolve(p, config.build)
      await recursive(a, "build")
    })
    .command("test")
    .describe("Recursively run 'pnpm test' on all packages")
    .action(async (p) => {
      const a = resolve(p, config.test)
      await recursive(a, "test")
    })
    .parse(argv)
}

function resolve(a: {_: string[]}, b: string[]): string[] {
  if (a._.length === 0) {
    return b
  }
  return a._
}

async function recursive(a: string[], cmd: string): Promise<void> {
  for (const n of a) {
    const p = path.join("packages", n)
    await run(p, cmd)
  }
}

async function run(d: string, cmd: string): Promise<void> {
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
