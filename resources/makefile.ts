import {argv} from "node:process"
import esMain from "es-main"
import sade from "sade"
import * as docspace from "./scripts/docspace.ts"
import {createTempDir, prepareLibDir} from "./utils/basedir.ts"

if (esMain(import.meta)) {
  main()
}

function main(): void {
  sade("./makefile.js")
    .command("build")
    .action(build)
    .parse(argv)
}

export interface BuildOptions {
  _: string[]
}

export async function build(opts: BuildOptions): Promise<void> {
  const tempDir = await createTempDir()
  const distDir = await prepareLibDir()

  const a = resolve(opts._)
  for (const m of a) {
    await m.build(tempDir, distDir)
  }

  function resolve(a: string[]): typeof docspace[] {
    if (a.length === 0) {
      return [docspace]
    }
    const r: typeof docspace[] = []
    for (const n of a) {
      const m = module(n)
      if (m) {
        r.push(m)
      }
    }
    return r
  }

  function module(n: string): typeof docspace | undefined {
    switch (n) {
    case "docspace":
      return docspace
    default:
      return
    }
  }
}
