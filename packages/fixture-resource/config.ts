import path from "node:path"
import {type Config} from "@onlyoffice/typedoc-resource"
import {Application} from "typedoc"

export const config: Config = [
  {
    name: "typedoc",
    source: {
      content: await typedoc(),
    },
  },
]

async function typedoc(): Promise<string> {
  const d = path.join("fixtures", "typedoc")
  const e = path.join(d, "main.ts")
  const c = path.join(d, "tsconfig.json")

  const a = await Application.bootstrapWithPlugins({
    entryPoints: [e],
    name: "fixture",
    readme: "none",
    tsconfig: c,
  })

  const p = await a.convert()
  if (!p) {
    throw new Error("Project is missing")
  }

  const o = a.serializer.projectToObject(p, d)
  return JSON.stringify(o, null, 2)
}
