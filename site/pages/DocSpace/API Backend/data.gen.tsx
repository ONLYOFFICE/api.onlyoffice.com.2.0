import {data as d} from "@/resources/docspace.ts"

export function data() {
  return {
    layout: "rest-declaration",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: d.list(),
    onRetrieve: d.resolve,
    permalink(data) {
      return permalink(data.pagination.items[0])
    },
    eleventyComputed: {
      title(data) {
        return data.pagination.items[0].title
      },
    }
  }
}

function permalink(d) {
  return `/docspace/api-backend/${d.slug}/index.html`
}
