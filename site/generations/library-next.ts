import {type SitemapData, SitemapDatum} from "@onlyoffice/eleventy-sitemap"
import {type Data} from "@onlyoffice/eleventy-types"
import {type Entity} from "@onlyoffice/library-declaration/next.js"
import {cutSuffix} from "@onlyoffice/strings"
import {LibraryDatum} from "../internal/library.tsx"
import {Sitemap} from "../internal/sitemap.ts"

export interface Resource {
  list(): Entity[]
  retrieve(id: number): Entity | undefined
}

export function data(r: Resource): Data {
  const sp = new SpecificPather()
  const vp = new VirtualPather()

  const sr: Record<string, SitemapData> = {}

  return {
    layout: "library",

    items: r.list(),

    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
    },

    doWrite(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }

      const [e]: Entity[] = data.pagination.items

      if (e.type === "group") {
        return false
      }

      if (e.type === "declaration") {
        return true
      }

      // @ts-expect-error
      throw new Error(`Unknown entity type: ${e.type}`)
    },

    virtualPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [e]: Entity[] = data.pagination.items
      const p = vp.path(r, e)
      return `${p}/index.html`
    },

    specificPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [e]: Entity[] = data.pagination.items
      const p = sp.path(r, e)
      return `${p}/index.html`
    },

    eleventyComputed: {
      title(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }

        const [e]: Entity[] = data.pagination.items

        if (e.type === "group") {
          return e.group.name
        }

        if (e.type === "declaration") {
          return e.declaration.name
        }

        // @ts-expect-error
        throw new Error(`Unknown entity type: ${e.type}`)
      },

      sitemap(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }

        const a = data.defaultSitemap

        if (!a) {
          return
        }

        const b = new SitemapDatum()

        const [e]: Entity[] = data.pagination.items

        if (e.type === "group") {
          b.type = "group"
        } else if (e.type === "declaration") {
          b.type = "page"
        } else {
          // @ts-expect-error
          throw new Error(`Unknown entity type: ${e.type}`)
        }

        const c = SitemapDatum.merge(a, b)

        sr[e.id] = c

        return c
      },

      library(data) {
        if (!data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }

        const [e]: Entity[] = data.pagination.items

        const d = new LibraryDatum()
        d.declaration = e

        d.onLink = function onLink(id) {
          const s = Sitemap.shared

          const e = r.retrieve(id)
          if (!e) {
            return ""
          }

          const m = sr[e.id]
          if (!m || !m.url) {
            return ""
          }

          const p = s.findPageByUrl(m.url)
          return p.canonicalUrl
        }

        d.onRetrieve = function onRetrieve(id) {
          return r.retrieve(id)
        }

        return d
      },
    },
  }
}

class VirtualPather implements Pather {
  #m = new Map<string, number>()

  path(r: Resource, e: Entity): string {
    let s = ""
    let i = 0

    let c: Entity | undefined = e

    while (c) {
      if (c.type === "group") {
        const n = sanitizeName(c.group.name)
        s = `${n}/${s}`
      }

      if (c.type === "declaration") {
        const n = sanitizeName(c.declaration.name)
        s = `${n}/${s}`
      }

      c = r.retrieve(c.parentId)
    }

    [s] = cutSuffix(s, "/")

    while (true) {
      const id = this.#m.get(s)

      if (!id) {
        this.#m.set(s, e.id)
        break
      }

      if (id === e.id) {
        break
      }

      i += 1
      s = `${s}-${i}`
    }

    return s
  }
}

class SpecificPather implements Pather {
  #m = new Map<string, number>()

  path(r: Resource, e: Entity): string {
    let s = ""
    let i = 0

    let c: Entity | undefined = e

    while (c) {
      if (c.type === "declaration") {
        const n = sanitizeName(c.declaration.name)
        s = `${n}/${s}`
      }

      c = r.retrieve(c.parentId)
    }

    [s] = cutSuffix(s, "/")

    while (true) {
      const id = this.#m.get(s)

      if (!id) {
        this.#m.set(s, e.id)
        break
      }

      if (id === e.id) {
        break
      }

      i += 1
      s = `${s}-${i}`
    }

    return s
  }
}

interface Pather {
  path(r: Resource, e: Entity): string
}

function sanitizeName(t: string): string {
  return t.replaceAll("/", " ")
}
