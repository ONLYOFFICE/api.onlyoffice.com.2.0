import {readFile, readdir} from "node:fs/promises"
import {join, parse} from "node:path"
import type {UserConfig} from "@onlyoffice/eleventy-types"
import type * as Raw from "@onlyoffice/playground-config/raw.ts"
import {merge} from "@onlyoffice/playground-config/raw.ts"
import {config} from "@onlyoffice/playground-config"

export function eleventyPlaygroundConfig(uc: UserConfig, mode?: string): void {
  uc.addGlobalData("playground", async () => {
    const ds = new Map(uc.dataExtensions)
    if (!ds.has("json")) {
      ds.set("json", {
        extension: "json",
        parser(c: string) {
          return JSON.parse(c)
        },
        options: {}
      })
    }

    const bc = "playground.config"

    let mc: string | undefined
    if (mode) {
      mc = `${bc}.${mode}`
    }

    const fm: Record<string, string[]> = {}
    const dl = await readdir(uc.dir.data)
    for (const n of dl) {
      const p = parse(n)
      if (!(p.name === bc || mc && p.name === mc)) {
        continue
      }
      let o = fm[p.name]
      if (!o) {
        o = []
        fm[p.name] = o
      }
      const f = join(uc.dir.data, n)
      o.push(f)
    }

    const cm: Record<string, Raw.Config[]> = {}
    for (const [, de] of ds) {
      for (const [n, ls] of Object.entries(fm)) {
        for (const f of ls) {
          const p = parse(f)
          const e = p.ext.slice(1)
          if (de.extension !== e) {
            continue
          }
          let o = cm[n]
          if (!o) {
            o = []
            cm[n] = o
          }
          const c = await readFile(f, "utf8")
          const r = de.parser(c) as Raw.Config
          o.push(r)
        }
      }
    }

    const cr: Record<string, Raw.Config> = {}
    for (const [n, cs] of Object.entries(cm)) {
      if (cs.length === 0) {
        continue
      }
      let [c] = cs
      for (let i = 1; i < cs.length; i += 1) {
        c = merge(c, cs[i])
      }
      cr[n] = c
    }

    let c = cr[bc]
    if (mc && cr[mc]) {
      c = merge(c, cr[mc])
    }

    return config(c)
  })
}
