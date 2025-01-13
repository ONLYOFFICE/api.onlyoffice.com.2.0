import path from "node:path"
import image, {type ImageOptions} from "@11ty/eleventy-img"
import {isBuild, rootDir} from "@onlyoffice/eleventy-env"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {toHast} from "@onlyoffice/hast-util-eleventy-img"
import * as pate from "@onlyoffice/node-path"
import {toJsxRuntime} from "@onlyoffice/preact-eleventy-img"
import {useSuspense} from "@onlyoffice/preact-suspense"
import {cutPrefix} from "@onlyoffice/strings"
import {type Root} from "hast"
import {type JSX, h} from "preact"
import {type HTMLAttributes} from "preact/compat"
import copy from "recursive-copy"
import {visit} from "unist-util-visit"
import {type VFile} from "vfile"

export function Image(p: HTMLAttributes<HTMLImageElement>): JSX.Element {
  let r: JSX.Element | null = null

  p = {...p}
  p.style = {...p.style}

  if (p.alt === undefined) {
    throw new Error("The 'alt' attribute is required, but missing.")
  }
  if (typeof p.alt !== "string") {
    throw new TypeError("The 'alt' attribute must be a string.")
  }

  if (p.src === undefined) {
    throw new Error("The 'src' attribute is required, but missing.")
  }
  if (typeof p.src !== "string") {
    throw new TypeError("The 'src' attribute must be a string.")
  }
  if (!URL.canParse(p.src) && !path.isAbsolute(p.src)) {
    throw new Error("The 'src' attribute must be an absolute URL.")
  }

  p.src = resolve(p.src, "")

  if (p.width !== undefined) {
    if (typeof p.style === "string") {
      throw new TypeError("The 'style' attribute must not be a string.")
    }
    if (typeof p.style === "object" && "peek" in p.style) {
      throw new Error("The 'style' attribute must not be a signal.")
    }
    if (typeof p.width === "object" && "peek" in p.width) {
      throw new Error("The 'width' attribute must not be a signal.")
    }
    if (p.width !== -1) {
      p.style.maxWidth = p.width
    }
  }

  if (p.height !== undefined) {
    if (typeof p.style === "string") {
      throw new TypeError("The 'style' attribute must not be a string.")
    }
    if (typeof p.style === "object" && "peek" in p.style) {
      throw new Error("The 'style' attribute must not be a signal.")
    }
    if (typeof p.height === "object" && "peek" in p.height) {
      throw new Error("The 'height' attribute must not be a signal.")
    }
    if (p.height !== -1) {
      p.style.maxHeight = p.height
    }
  }

  p.decoding = "async"
  p.loading = "lazy"

  if (!isBuild()) {
    return <img {...p} />
  }

  const b = {...p, alt: p.alt}
  const o = options(p.src)
  const d = image(p.src, o)

  const Suspense = useSuspense(async () => {
    const m = await d
    r = toJsxRuntime(m, b)
  })

  return <Suspense>{() => r}</Suspense>
}

export interface RehypeImageTransform {
  (tree: Root, file: VFile): Promise<undefined>
}

export function rehypeImage(): RehypeImageTransform {
  return async function transform(t, f) {
    const a: Promise<void>[] = []

    visit(t, "element", (n, i, r) => {
      if (
        !r ||
        typeof i !== "number" ||
        n.tagName !== "img"
      ) {
        return
      }

      const p = n.properties
      if (!p.style) {
        p.style = ""
      }

      if (p.alt === undefined) {
        throw new Error("The 'alt' attribute is required, but missing.")
      }
      if (typeof p.alt !== "string") {
        throw new TypeError("The 'alt' attribute must be a string.")
      }

      if (p.src === undefined) {
        throw new Error("The 'src' attribute is required, but missing.")
      }
      if (typeof p.src !== "string") {
        throw new TypeError("The 'src' attribute must be a string.")
      }

      p.src = resolve(p.src, f.path)

      if (p.width !== undefined && p.width !== null) {
        if (typeof p.style !== "string") {
          throw new TypeError("The 'style' attribute must be a string.")
        }
        if (typeof p.width !== "string" && typeof p.width !== "number") {
          throw new TypeError("The 'width' attribute must be a string or a number.")
        }
        let v = ""
        if (typeof p.width === "number") {
          v = `${p.width}px`
        } else {
          v = p.width
        }
        p.style += `max-width: ${v};`
      }

      if (p.height !== undefined && p.height !== null) {
        if (typeof p.style !== "string") {
          throw new TypeError("The 'style' attribute must be a string.")
        }
        if (typeof p.height !== "string" && typeof p.height !== "number") {
          throw new TypeError("The 'height' attribute must be a string or a number.")
        }
        let v = ""
        if (typeof p.height === "number") {
          v = `${p.height}px`
        } else {
          v = p.height
        }
        p.style += `max-height: ${v};`
      }

      n.properties.decoding = "async"
      n.properties.loading = "lazy"

      if (!isBuild()) {
        return
      }

      const b = {...p, alt: p.alt}
      const o = options(p.src)
      const d = image(p.src, o).then((m) => {
        r.children[i] = toHast(m, b)
      })

      a.push(d)
    })

    await Promise.all(a)
  }
}

export function eleventyImage(uc: UserConfig): void {
  if (!isBuild()) {
    uc.addPassthroughCopy("assets/images")
    return
  }

  uc.on("eleventy.after", async () => {
    await copy(".cache/assets", "dist/assets")
  })
}

function options(s: string): ImageOptions {
  const o: ImageOptions = {
    formats: ["jpg", "webp"],
    urlPath: "/assets/",
    outputDir: ".cache/assets/",
    cacheOptions: {
      duration: "28d",
    },

    // Disk cache does not work with custom filename formats.
    // https://www.11ty.dev/docs/plugins/image/#disk-cache
    // filenameFormat(id: string, s: string, w: number, f: string) {
    //   const e = path.extname(s)
    //   const n = path.basename(s, e)
    //   return `${n}-${w}w-${id}.${f}`
    // },
  }

  const e = path.extname(s)
  switch (e) {
  case ".svg":
    o.formats = ["svg"]
    break
  case ".gif":
    o.formats = ["gif", "webp"]
    o.sharpOptions = {
      animated: true,
      limitInputPixels: false,
    }
    break
  }

  return o
}

function resolve(a: string, b: string): string {
  if (URL.canParse(a)) {
    return a
  }

  let p = a

  if (!path.isAbsolute(a)) {
    p = path.dirname(b)
    p = pate.resolve(p, a)
    ;[p] = cutPrefix(p, rootDir())
  }

  if (isBuild()) {
    p = decodeURIComponent(`.${p}`)
  }

  return p
}
