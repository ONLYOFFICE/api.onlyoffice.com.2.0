import {type SitemapData, SitemapDatum} from "@onlyoffice/eleventy-sitemap"
import {type Data} from "@onlyoffice/eleventy-types"
import {type Declaration} from "@onlyoffice/library-declaration"
import {type Resource} from "@onlyoffice/library-resource"
import {LibraryDatum} from "../internal/library.tsx"
import {Sitemap} from "../internal/sitemap.ts"

type Item = PseudoGroup | Declaration

class PseudoGroup {
  id = ""
  title = ""
  parentId = ""
  children: string[] = []
}

export function data({list, retrieve}: Resource): Data {
  // todo: move the generation of groups to the declaration resource

  const x: Record<string, string> = {}
  const y: Record<string, number> = {}

  const a: Declaration[] = []
  const b: PseudoGroup[] = []

  for (const d of list()) {
    if (d.kind === "class") {
      const g = new PseudoGroup()
      g.title = "Classes"

      if (!d.parent) {
        g.id = g.title
        g.parentId = ""
      } else {
        g.id = `${d.parent.id}#${g.title}`
        g.parentId = d.parent.id
      }

      let i = y[g.id]
      if (i === undefined) {
        i = b.length
        y[g.id] = i
        b.push(g)
        g.children.push(d.id)
      } else {
        b[i].children.push(d.id)
      }

      x[d.id] = g.id

      if (d.id.includes("#")) {
        const a = d.id.split("#")
        x[d.id] += `#${a[a.length - 1]}`
      } else {
        x[d.id] += `#${d.id}`
      }

      a.push(d)
      continue
    }

    if (d.kind === "event") {
      const g = new PseudoGroup()
      g.title = "Events"

      if (!d.parent) {
        g.id = g.title
        g.parentId = ""
      } else {
        const p = `Classes#${d.parent.id}`
        g.id = `${p}#${g.title}`
        g.parentId = p
      }

      let i = y[g.id]
      if (i === undefined) {
        i = b.length
        y[g.id] = i
        b.push(g)
        g.children.push(d.id)
      } else {
        b[i].children.push(d.id)
      }

      x[d.id] = g.id

      if (d.id.includes("#")) {
        const a = d.id.split("#")
        x[d.id] += `#${a[a.length - 1]}`
      } else {
        x[d.id] += `#${d.id}`
      }

      a.push(d)
      continue
    }

    if (d.kind === "method") {
      const g = new PseudoGroup()
      g.title = "Instance Methods"

      if (!d.parent) {
        g.id = g.title
        g.parentId = ""
      } else {
        const p = `Classes#${d.parent.id}`
        g.id = `${p}#${g.title}`
        g.parentId = p
      }

      let i = y[g.id]
      if (i === undefined) {
        i = b.length
        y[g.id] = i
        b.push(g)
        g.children.push(d.id)
      } else {
        b[i].children.push(d.id)
      }

      x[d.id] = g.id

      if (d.id.includes("#")) {
        const a = d.id.split("#")
        x[d.id] += `#${a[a.length - 1]}`
      } else {
        x[d.id] += `#${d.id}`
      }

      a.push(d)
      continue
    }

    if (d.kind === "property") {
      const g = new PseudoGroup()
      g.title = "Instance Properties"

      if (!d.parent) {
        g.id = g.title
        g.parentId = ""
      } else {
        const p = `Classes#${d.parent.id}`
        g.id = `${p}#${g.title}`
        g.parentId = p
      }

      let i = y[g.id]
      if (i === undefined) {
        i = b.length
        y[g.id] = i
        b.push(g)
        g.children.push(d.id)
      } else {
        b[i].children.push(d.id)
      }

      x[d.id] = g.id

      if (d.id.includes("#")) {
        const a = d.id.split("#")
        x[d.id] += `#${a[a.length - 1]}`
      } else {
        x[d.id] += `#${d.id}`
      }

      a.push(d)
      continue
    }

    if (d.kind === "type") {
      const g = new PseudoGroup()
      g.title = "Type Aliases"

      if (!d.parent) {
        g.id = g.title
        g.parentId = ""
      } else {
        g.id = `${d.parent.id}#${g.title}`
        g.parentId = d.parent.id
      }

      let i = y[g.id]
      if (i === undefined) {
        i = b.length
        y[g.id] = i
        b.push(g)
        g.children.push(d.id)
      } else {
        b[i].children.push(d.id)
      }

      x[d.id] = g.id

      if (d.id.includes("#")) {
        const a = d.id.split("#")
        x[d.id] += `#${a[a.length - 1]}`
      } else {
        x[d.id] += `#${d.id}`
      }

      a.push(d)
      continue
    }
  }

  const o: Record<string, SitemapData> = {}

  return {
    layout: "library",

    items: [...a, ...b],

    pagination: {
      data: "items",
      size: 1,
      addAllPagesToCollections: true,
    },

    doWrite(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }

      const [d]: Item[] = data.pagination.items

      if (d instanceof PseudoGroup) {
        return false
      }

      return true
    },

    virtualPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }

      const [d]: Item[] = data.pagination.items

      let s = ""

      if (d instanceof PseudoGroup) {
        s = d.id
      } else if (x[d.id]) {
        s = x[d.id]
      } else {
        s = d.id
      }

      s = s.replaceAll("#", "/")

      return `${s}/index.html`
    },

    specificPath(data) {
      if (!data.pagination || !data.pagination.items) {
        throw new Error("No pagination")
      }
      const [d]: Item[] = data.pagination.items
      const p = d.id.replaceAll("#", "/")
      return `${p}/index.html`
    },

    eleventyComputed: {
      title(data) {
        if (!data || !data.pagination || !data.pagination.items) {
          throw new Error("No pagination")
        }
        const [d]: Item[] = data.pagination.items
        return d.title
      },

      sitemap(data) {
        if (!data.pagination || !data.pagination.items) {
          return
        }

        const a = data.defaultSitemap
        if (!a) {
          return
        }

        const b = new SitemapDatum()

        const [d]: Item[] = data.pagination.items

        if (d instanceof PseudoGroup) {
          b.type = "group"
        } else {
          b.type = "page"
        }

        const c = SitemapDatum.merge(a, b)

        o[d.id] = c

        return c
      },

      library(data) {
        if (!data.pagination || !data.pagination.items) {
          return
        }

        const d = new LibraryDatum()
        ;[d.declaration] = data.pagination.items

        d.onLink = function onLink(t) {
          const s = Sitemap.shared

          const r = retrieve(t.id)
          if (!r) {
            return ""
          }

          const m = o[r.id]
          if (!m || !m.url) {
            return ""
          }

          const e = s.findPageByUrl(m.url)
          return e.canonicalUrl
        }

        d.onRetrieve = function onRetrieve(r) {
          return retrieve(r.id)
        }

        return d
      },
    },
  }
}
