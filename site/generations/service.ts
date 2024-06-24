import type {Data} from "@onlyoffice/eleventy-types"
import type {Declaration} from "@onlyoffice/service-declaration"
import type {Resource} from "@onlyoffice/service-resource"

export function data({list, resolve}: Resource): Data {
  return {
    layout: "service-declaration",

    items: list(),
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },

    slug(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Declaration[] = data.pagination.items
      return `${d.slug}/index`
    },

    onRetrieve: resolve,

    eleventyComputed: {
      title(data) {
        if (!data || !data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        const [d]: Declaration[] = data.pagination.items
        return d.title
      }
    }
  }
}
