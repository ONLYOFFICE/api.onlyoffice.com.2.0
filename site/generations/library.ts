import type {Data} from "@onlyoffice/eleventy-types"
import type {Declaration, Reference, Token} from "@onlyoffice/library-declaration"
import type {Resource} from "@onlyoffice/library-resource"

export function data({list, retrieve}: Resource): Data {
  return {
    layout: "library-declaration",

    items: list(),
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },

    slug(data): string {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Declaration[] = data.pagination.items
      const p = d.id.split("#").join("/")
      return `${p}/index`
    },

    onRetrieve(r: Reference): Declaration | undefined {
      return retrieve(r.id)
    },

    eleventyComputed: {
      title(data) {
        if (!data || !data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        return data.pagination.items[0].title
      },

      onLink(data) {
        return function onLink(t: Token): string | undefined {
          if (t.type !== "reference") {
            return
          }

          const d = retrieve(t.id)
          if (!d) {
            return
          }

          const s = d.id.split("#").join("/")
          return data.crosslink(data, `${s}/`)
        }
      }
    }
  }
}
