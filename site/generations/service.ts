import {type Data} from "@onlyoffice/eleventy-types"
import {type Declaration} from "@onlyoffice/service-declaration"
import {type Resource} from "@onlyoffice/service-resource"
import {cutSuffix} from "@onlyoffice/strings"
import {slug} from "github-slugger"

export function data({list, retrieve}: Resource): Data {
  const sl = new ResourceSlugger()

  return {
    layout: "service-declaration",

    items: list(),
    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
    },

    slug(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Declaration[] = data.pagination.items
      const s = sl.slug(d, retrieve)
      return `${s}/index`
    },

    eleventyComputed: {
      title(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        const [d]: Declaration[] = data.pagination.items
        return d.name
      },
    },
  }
}

class ResourceSlugger {
  #m = new Map<string, string>()

  slug(d: Declaration, retrieve: Resource["retrieve"]): string {
    let s = ""
    let i = 0

    let c: Declaration | undefined = d

    while (c) {
      s = `${slug(c.name)}/${s}`
      c = retrieve(c.parent)
    }

    [s] = cutSuffix(s, "/")

    while (true) {
      const id = this.#m.get(s)

      if (!id) {
        this.#m.set(s, d.id)
        break
      }

      if (id === d.id) {
        break
      }

      i += 1
      s = `${s}-${i}`
    }

    return s
  }
}
