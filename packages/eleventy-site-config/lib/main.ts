import {readFile} from "node:fs/promises"
import {join} from "node:path"
import {cwd} from "node:process"
import type {UserConfig} from "@onlyoffice/eleventy-types"
import {Config} from "@onlyoffice/site-config"
import {existsSync} from "node:fs"

declare module "@onlyoffice/eleventy-types" {
  interface GlobalData {
    config: Config
  }

  interface Context {
    config: Config
  }
}

export function eleventySiteConfig(uc: UserConfig, mode?: string): void {
  const dir = cwd()

  uc.addGlobalData("config", async () => {
    const bc = "config"

    let mc: string | undefined
    if (mode) {
      mc = `${bc}.${mode}`
    }

    const cs: Config[] = []

    const bf = join(dir, `${bc}.yml`)
    if (existsSync(bf)) {
      const c = await readFile(bf, "utf8")
      const r = Config.fromYaml(c)
      cs.push(r)
    }

    if (mc) {
      const mf = join(dir, `${mc}.yml`)
      if (existsSync(mf)) {
        const c = await readFile(mf, "utf8")
        const r = Config.fromYaml(c)
        cs.push(r)
      }
    }

    if (cs.length === 0) {
      return new Config()
    }

    let [c] = cs

    if (cs.length > 1) {
      for (let i = 1; i < cs.length; i += 1) {
        c = Config.merge(c, cs[i])
      }
    }

    return c
  })
}
