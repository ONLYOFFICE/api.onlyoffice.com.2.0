import {createHash} from "node:crypto"
import {writeFileSync} from "node:fs"
import {tmpdir} from "node:os"
import path from "node:path"
import process from "node:process"
import {Console} from "@onlyoffice/console"
import {type BuildOptions, buildSync} from "esbuild"
import PQueue from "p-queue"
import pack from "../package.json" with {type: "json"}

// In the future, we should replace our custom logger with the eleventy one
// (see for the ConsoleLogger type for the @onlyoffice/eleventy-types).
const console = new Console(pack.name, process.stdout, process.stderr)

export interface EleventyEsbuildOptions {
  urlPath?: string
  outputDir?: string
  filenameFormat?(id: string, src: string): string
  buildOptions?: BuildOptions
}

export class BuildResult {
  type = ""
  src = ""
  content = ""
}

export class EleventyEsbuild {
  // @ts-ignore todo resolve it
  static #queue = new PQueue({concurrency: 1})
  static #cache = new Map<string, Promise<BuildResult>>()

  #opts: EleventyEsbuildOptions

  constructor(opts: EleventyEsbuildOptions) {
    this.#opts = opts
  }

  async build(f: string): Promise<BuildResult> {
    const c = EleventyEsbuild.#cache.get(f)
    if (c !== undefined) {
      return await c
    }

    const p = EleventyEsbuild.#queue.add(() => {
      const r = new BuildResult()

      // Esbuild populates the console itself.
      const a = buildSync({
        bundle: true,
        entryPoints: [f],
        outdir: tmpdir(),
        write: false,
        ...this.#opts.buildOptions,
      })
      if (a.errors.length !== 0) {
        return r
      }
      if (!a.outputFiles) {
        console.error("No output files")
        return r
      }

      if (this.#opts.buildOptions && this.#opts.buildOptions.format === "esm") {
        r.type = "module"
      }

      const [o] = a.outputFiles

      if (this.#opts.outputDir && this.#opts.urlPath) {
        const h = this.#hash(o.contents)

        let b = this.#base(f, h)
        if (this.#opts.filenameFormat) {
          b = this.#opts.filenameFormat(h, f)
        }

        const p = path.join(this.#opts.outputDir, b)
        writeFileSync(p, o.contents)

        r.src = `${this.#opts.urlPath}${b}`
      }

      r.content = o.text

      return r
    })

    EleventyEsbuild.#cache.set(f, p)

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
