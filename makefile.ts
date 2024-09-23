import {spawn} from "node:child_process"
import {existsSync} from "node:fs"
import {readFile} from "node:fs/promises"
import path from "node:path"
import {argv} from "node:process"
import {URL, fileURLToPath} from "node:url"
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
  ],
  test: [
    "service-declaration",
    "openapi-declaration",

    "svg-preact",
  ],
}

function main(): void {
  sade("makefile.ts")
    .command("build")
    .action(async ({_: t}: {_: string[]}) => {
      if (t.length === 0) {
        t = config.build
      }
      await run(t, "build")
    })
    .command("test")
    .action(async ({_: t}: {_: string[]}) => {
      if (t.length === 0) {
        t = config.test
      }
      await run(t, "test")
    })
    .parse(argv)
}

async function run(t: string[], cmd: string): Promise<void> {
  for (const [i, n] of t.entries()) {
    const d = packageDir(n)
    const f = packageJson(d)
    if (!existsSync(f)) {
      continue
    }

    const c = await readFile(f, "utf8")
    const o = JSON.parse(c)
    if (!o.scripts || !o.scripts[cmd]) {
      continue
    }

    console.log(`Executing '${cmd}' of '${o.name}'`)
    await new Promise((res, rej) => {
      const s = spawn("pnpm", [cmd], {cwd: d, shell: true, stdio: "inherit"})
      s.on("close", res)
      s.on("error", rej)
    })

    if (i < t.length - 1) {
      console.log("\n\n\n")
    }
  }
}

function packageDir(n: string): string {
  const d = currentDir()
  return path.join(d, "packages", n)
}

function currentDir(): string {
  const u = new URL(".", import.meta.url)
  return fileURLToPath(u)
}

function packageJson(d: string): string {
  return path.join(d, "package.json")
}

main()
