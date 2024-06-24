import type {Data} from "@onlyoffice/eleventy-types"
import {cutPrefix, cutSuffix} from "@onlyoffice/node-strings"
import {slug} from "github-slugger"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    title?: string
    items?: any[]
    crosslink?(data: Data, s: string): string
    slug?(data: Data): string
  }

  interface EleventyComputed {
    title?(data?: Data): string | undefined
    layout?(data?: Data): string | undefined
  }

  interface Pagination {
    items?: any[]
  }
}

export function data(): Data {
  return {
    layout: "chapter",
    tags: ["navigation"],

    permalink(data) {
      let p = data.page.filePathStem
      p = cutPrefix(p, "/pages")

      if (data.slug) {
        p = cutSuffix(p, data.page.fileSlug)
        p += data.slug(data)
      }

      p = p.split("/").map((s) => slug(s)).join("/")
      p += `.${data.page.outputFileExtension}`

      return p
    },

    crosslink(data, s) {
      let p = data.page.filePathStem
      p = cutPrefix(p, "/pages")
      p = cutSuffix(p, data.page.fileSlug)
      p += s
      p = p.split("/").map((s) => slug(s)).join("/")
      return p
    },

    eleventyComputed: {
      title(data) {
        if (!data) {
          return undefined
        }
        if (!data.title) {
          return data.page.fileSlug
        }
        return data.title
      },
      layout(data) {
        if (!data || !data.layout) {
          return undefined
        }
        return `${data.layout}.tsx`
      }
    }
  }
}
