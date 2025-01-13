import {createHash} from "node:crypto"
import {existsSync, mkdirSync, writeFileSync} from "node:fs"
import path from "node:path"
import process from "node:process"
import {Console} from "@onlyoffice/console"
import {type BundleAsyncOptions, type CustomAtRules, bundle} from "lightningcss"
import PQueue from "p-queue"
import pack from "../package.json" with {type: "json"}

// In the future, we should replace our custom logger with the eleventy one
// (see for the ConsoleLogger type for the @onlyoffice/eleventy-types).
const console = new Console(pack.name, process.stdout, process.stderr)

export interface EleventyLightningcssOptions {
  urlPath: string
  outputDir: string
  buildOptions?: Omit<BundleAsyncOptions<CustomAtRules>, "filename">
}

export class BuildResult {
  rel = ""
  href = ""
}

export class EleventyLightningcss {
  // @ts-ignore todo resolve it
  static #queue = new PQueue({concurrency: 1})
  static #cache = new Map<string, Promise<BuildResult>>()

  #opts: EleventyLightningcssOptions

  constructor(opts: EleventyLightningcssOptions) {
    this.#opts = opts
  }

  async build(f: string): Promise<BuildResult> {
    const c = EleventyLightningcss.#cache.get(f)
    if (c !== undefined) {
      return await c
    }

    const p = EleventyLightningcss.#queue.add(() => {
      const r = new BuildResult()

      const a = bundle({
        filename: f,
        ...this.#opts.buildOptions,
      })
      if (a.warnings) {
        for (const w of a.warnings) {
          console.warn(w.message)
        }
      }

      const d = this.#opts.outputDir
      if (!existsSync(d)) {
        mkdirSync(d, {recursive: true})
      }

      const h = this.#hash(a.code)
      const b = this.#base(f, h)
      const o = path.join(d, b)
      writeFileSync(o, a.code)

      r.rel = "stylesheet"
      r.href = `${this.#opts.urlPath}${b}`

      return r
    })

    EleventyLightningcss.#cache.set(f, p)

    return p
  }

  #base(f: string, h: string): string {
    const p = path.parse(f)
    p.name = `${p.name}-${h}`
    p.base = `${p.name}${p.ext}`
    return p.base
  }

  // https://github.com/sindresorhus/rev-hash/
  #hash(c: string | Uint8Array): string {
    return createHash("md5").update(c).digest("hex").slice(0, 10)
  }
}
