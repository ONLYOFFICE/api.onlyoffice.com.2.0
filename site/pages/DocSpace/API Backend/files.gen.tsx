import {files} from "@/resources/docspace.ts"

export function data() {
  return {
    layout: "rest-declaration",
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true
    },
    items: files.list(),
    onRetrieve: files.resolve,
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
