import {spawn} from "node:child_process"
import {readFile, readdir} from "node:fs/promises"
import {join} from "node:path"
import {argv} from "node:process"
import {URL, fileURLToPath} from "node:url"
import sade from "sade"

main()

function main(): void {
  sade("./makefile.ts")
    .command("build")
    .action(async () => {
      await run("build")
    })
    .command("test")
    .action(async () => {
      await run("test")
    })
    .parse(argv)
}

async function run(cmd: string): Promise<void> {
  const cd = currentDir()
  const pd = packagesDir(cd)
  const pc = await readdir(pd)
  for (const p of pc) {
    const d = join(pd, p)
    const f = packageJSON(d)
    const c = await readFile(f, "utf8")
    const j = JSON.parse(c)
    if (!(j.scripts && j.scripts[cmd])) {
      continue
    }
    await new Promise((res, rej) => {
      const s = spawn("pnpm", [cmd], {cwd: d, stdio: "inherit"})
      s.on("close", res)
      s.on("error", rej)
    })
  }
}

function currentDir(): string {
  const u = new URL(".", import.meta.url)
  return fileURLToPath(u)
}

function packagesDir(d: string): string {
  return join(d, "packages")
}

function packageJSON(d: string): string {
  return join(d, "package.json")
}
