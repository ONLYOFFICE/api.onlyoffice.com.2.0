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
    virtualPath?(this: void, data: Data): string | undefined
    specificPath?(this: void, data: Data): string | undefined
  }
}

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

interface PathCallback {
  (d: Data): string | undefined
}

function computePath(d: Data, cb: PathCallback | undefined): string {
  const p = d.page

  if (!p) {
    throw new Error("The page data is missing")
  }

  const a = defaultPath(p)

  let b = ""

  if (cb) {
    const v = cb(d)

    if (v) {
      b = v
    }
  }

  return mergePath(a, b)
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
