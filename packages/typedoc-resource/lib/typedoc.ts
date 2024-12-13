import {mkdir, readFile, writeFile} from "node:fs/promises"
import path from "node:path"
import {cwd} from "node:process"
import {process} from "@onlyoffice/typedoc-declaration"
import {Config, type ConfigEntity} from "./shared.ts"

export async function run(): Promise<void> {
  const c = await Config.read()

  for (const e of c) {
    const s = await e.download()
    const o = JSON.parse(s.buf)
    const r = await process(o)
    const a = JSON.stringify(r, null, 2)
    const b = await Fixture.read(e)
    await Resource.write(e, a, b)
  }
}

const Resource = {
  async write(e: ConfigEntity, cc: string, fc: string): Promise<void> {
    const d = path.join(cwd(), "dist")
    await mkdir(d, {recursive: true})

    const cf = path.join(d, `${e.name}.json`)
    await writeFile(cf, cc)

    const ff = path.join(d, `${e.name}.ts`)
    await writeFile(ff, fc)
  },
}

const Fixture = {
  async read(e: ConfigEntity): Promise<string> {
    const f = path.join(import.meta.dirname, "..", "fixtures", "typedoc.ts")
    const c = await readFile(f, "utf8")
    return c.replace("typedoc.json", `${e.name}.json`)
  },
}
