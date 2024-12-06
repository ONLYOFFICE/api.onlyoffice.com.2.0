import {type Data} from "@onlyoffice/eleventy-types"
import {type Declaration} from "@onlyoffice/service-declaration"
import {type Resource} from "@onlyoffice/service-resource"
import {cutSuffix} from "@onlyoffice/strings"
import {ServiceDatum} from "../internal/service.tsx"

export function data({list, retrieve}: Resource): Data {
  // todo: use a single instance of ResourcePather
  const p0 = new ResourcePather()
  const p1 = new ResourcePather()

  return {
    layout: "service",

    items: list(),

    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
    },

    virtualPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Declaration[] = data.pagination.items
      const s = p1.path(d, retrieve)
      return `${s}/index.html`
    },

    specificPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Declaration[] = data.pagination.items
      const s = p0.path(d, retrieve)
      return `${s}/index.html`
    },

    eleventyComputed: {
      title(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        const [d]: Declaration[] = data.pagination.items
        return d.name
      },

      service(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        const d = new ServiceDatum()
        ;[d.declaration] = data.pagination.items
        return d
      },
    },
  }
}

class ResourcePather {
  #m = new Map<string, string>()

  path(d: Declaration, retrieve: Resource["retrieve"]): string {
    let s = ""
    let i = 0

    let c: Declaration | undefined = d

    while (c) {
      const n = sanitizeName(c.name)
      s = `${n}/${s}`
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

function sanitizeName(t: string): string {
  return t.replaceAll("/", " ")
}
