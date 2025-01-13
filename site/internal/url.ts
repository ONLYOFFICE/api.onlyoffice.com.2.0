import {rm} from "node:fs/promises"
import both from "node:path"
import posix from "node:path/posix"
import {type Data, type Page, type UserConfig} from "@onlyoffice/eleventy-types"
import {cutSuffix} from "@onlyoffice/strings"
import {slug} from "github-slugger"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    isWritten?: boolean
    doWrite?(this: void, data: Data): boolean | undefined
  }
}

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    canonicalUrl?: string
    sitemapUrl?: string
    virtualUrl?: string
    specificUrl?: string
    writeUrl?: string
  }
}

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    virtualPath?: PathCallback
    specificPath?: PathCallback
  }
}

export type PathCallback =
  ((this: void, data: Data) => string | undefined) |
  string |
  undefined

export function eleventyUrl(uc: UserConfig): void {
  uc.on("eleventy.after", async (c) => {
    await rmTempDir(c.dir.output)
  })

  uc.addGlobalData("permalink", () => {
    return permalink
  })
}

function permalink(d: Data): string {
  if (d.writeUrl) {
    return d.writeUrl
  }

  const sp = computePath(d, d.specificPath)
  const su = slugify(sp)

  const vp = computePath(d, d.virtualPath)
  const vu = slugify(vp)

  const [mu] = cutSuffix(vu, "index.html")
  const [cu] = cutSuffix(su, "index.html")

  d.isWritten = doWrite(d)

  if (d.isWritten) {
    d.writeUrl = su
  } else {
    const tp = computePath(d, tempPath)
    const tu = slugify(tp)
    d.writeUrl = tu
  }

  d.specificUrl = su
  d.virtualUrl = vu
  d.sitemapUrl = mu
  d.canonicalUrl = cu

  return d.writeUrl
}

function doWrite(d: Data): boolean {
  if (d.doWrite) {
    const w = d.doWrite(d)
    if (w === false) {
      return false
    }
  }
  return true
}

async function rmTempDir(r: string): Promise<void> {
  const d = both.join(r, "temp")
  await rm(d, {recursive: true})
}

let tempCount = 0

function tempPath(): string {
  const i = tempCount
  tempCount += 1
  return `/temp/${i}.txt`
}

function slugify(s: string): string {
  let u = ""

  const a = s.split("/")

  for (let i = 0; i < a.length - 1; i += 1) {
    const e = a[i]
    const s = slug(e)
    u += `${s}/`
  }

  const e = a[a.length - 1]
  const b = e.split(".")

  for (const e of b) {
    const s = slug(e)
    u += `${s}.`
  }

  if (a.length !== 0) {
    u = u.slice(0, -1)
  }

  return u
}

function computePath(d: Data, cb: PathCallback): string {
  const p = d.page

  if (!p) {
    throw new Error("The page data is missing")
  }

  const a = defaultPath(p)
  const b = resolvePath(cb, d)

  return mergePath(a, b)
}

function resolvePath(cb: PathCallback, d: Data): string {
  let p: string | undefined

  if (cb && typeof cb === "function") {
    p = cb(d)
  } else if (cb && typeof cb === "string") {
    p = cb
  }

  if (!p) {
    p = ""
  }

  return p
}

function mergePath(a: string, b: string): string {
  if (a === "") {
    return b
  }

  if (b === "") {
    return a
  }

  const y = posix.dirname(b)

  if (y.startsWith("/")) {
    return b
  }

  const x = posix.dirname(a)

  return posix.join(x, b)
}

function defaultPath(p: Page): string {
  const a = `.${p.outputFileExtension}`
  const b = posix.basename(p.filePathStem) + a
  const c = posix.dirname(p.filePathStem)
  return posix.join(c, b)
}

export class Pather {
  /**
   * The index where the key is a path and the value is a unique identifier.
   */
  #x = new Map<string, number>()

  /**
   * The index where the key is a path, and the value is a number of duplicates.
   */
  #y = new Map<string, number>()

  /**
   * @param a A list of path segments.
   * @param b A corresponding list of unique identifiers.
   * @returns A unique path.
   */
  pathify(a: string[], b: number[]): string {
    const a0: string[] = []

    for (let s of a) {
      s = s.replaceAll("/", " ")
      a0.push(s)
    }

    const b0 = [...b]

    for (let i = 0; i < a0.length; i += 1) {
      const c = a0.slice(0, i + 1)
      const s = c[c.length - 1]

      let x0 = b0[i]
      let y0 = 0

      let k = ""

      while (true) {
        if (y0 !== 0) {
          c[c.length - 1] = `${s}-${y0}`
        }

        k = c.join("/")

        const x1 = this.#x.get(k)
        if (x1 === undefined) {
          break
        }

        const y1 = this.#y.get(k)
        if (y1 === undefined) {
          break
        }

        if (x1 === x0) {
          break
        }

        x0 = x1
        y0 = y1 + 1
      }

      this.#x.set(k, x0)
      this.#y.set(k, y0)

      a0[i] = c[c.length - 1]
      b0[i] = x0
    }

    const p = a0.join("/")

    return p
  }
}
