import {default as slugify} from "@sindresorhus/slugify"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    title?: "article" | "blank"
    layout?: string
  }
}

export function data() {
  return {
    title: "",
    remote: "",
    layout: "article",
    tags: ["navigation"],

    // todo: refactor.
    permalink(data) {
      const a = data.page.filePathStem.split("/")
      let s = a
        .slice(2, a.length)
        .map((s) => {
          s = s.toLowerCase()
          return slugify.default(s)
        })
        .join("/")

      if (data.slug) {
        s = s.replace(data.page.fileSlug, data.slug(data))
      }

      return `/${s}.${data.page.outputFileExtension}`
    },

    // todo: rename, make generic.
    // todo: refactor.
    _link(data: any, _s: string): string {
      const a = data.page.filePathStem.split("/")
      let s = a
        .slice(2, a.length)
        .map((s) => {
          s = s.toLowerCase()
          return slugify.default(s)
        })
        .join("/")

      s = s.replace(data.page.fileSlug, _s)

      return `/${s}/`
    },

    eleventyComputed: {
      title(data) {
        if (data === undefined) {
          return
        }
        if (data.title === "") {
          return data.page.fileSlug
        }
        return data.title
      },
      layout(data) {
        if (
          data === undefined ||
          data.layout === null
        ) {
          return
        }
        // todo: use smarter logic.
        return `${data.layout}.tsx`
      }
    }
  }
}
