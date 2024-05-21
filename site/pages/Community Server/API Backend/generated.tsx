import {list, resolve} from "@/resources/community-server.ts"

export function data() {
  return {
    layout: "rest-declaration",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: list(),
    onRetrieve: resolve,
    permalink(data) {
      const d = data.pagination.items[0]
      return `/community-server/api-backend/${d.slug}/index.html`
    },
    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
      }
    }
  }
}
