import type {Data} from "@onlyoffice/eleventy-types"
import type {Resource} from "@onlyoffice/service-resource"

export function data({list, resolve}: Resource): Data {
  return {
    layout: "rest-declaration",

    items: list(),
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },

    slug(data): string {
      return `${data.pagination.items[0].slug}/index`
    },

    onRetrieve: resolve,

    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
      }
    }
  }
}
