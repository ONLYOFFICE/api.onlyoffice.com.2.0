import {extname} from "node:path"
import {type Data, type Template, type UserConfig} from "@onlyoffice/eleventy-types"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    sitemap?(d: Data): SitemapData
  }
}

export interface SitemapData {
  title?: string
  url?: string
  order?: number
  groups?(): {
    title?: string
    order?: number
  }[]
  group?(): string
  data?: Data
}

export interface SitemapAccessible {
  get entities(): SitemapEntity[]
  path(e: SitemapEntity): string[]
  page(u: string): SitemapPage | undefined
  entity(id: string): SitemapEntity | undefined
}

export type SitemapIndexes = Record<string, number>

export type SitemapEntity = SitemapEntityMap[keyof SitemapEntityMap]

export type SitemapEntityMap = {
  page: SitemapPage
  group: SitemapGroup
}

export class SitemapPage {
  type = "page" as const
  id = ""
  title = ""
  url = ""
  order = 0
  parent = ""
  children: string[] = []
  data: Data = {}
}

export class SitemapGroup {
  type = "group" as const
  id = ""
  title = ""
  order = -1
  parent = ""
  children: string[] = []
}

export class Sitemap implements SitemapAccessible {
  #indexes: SitemapIndexes = {}
  #entities: SitemapEntity[] = []

  get entities(): SitemapEntity[] {
    return this.#entities
  }

  path(e: SitemapEntity): string[] {
    const p: string[] = []
    let t: SitemapEntity | undefined = e
    while (t) {
      p.push(t.id)
      t = this.entity(t.parent)
    }
    return p.reverse()
  }

  page(u: string): SitemapPage | undefined {
    const e = this.entity(`page;${u}`)
    if (!e || e.type !== "page") {
      return
    }
    return e
  }

  entity(id: string): SitemapEntity | undefined {
    const i = this.#indexes[id]
    if (i === undefined) {
      return undefined
    }
    return this.#entities[i]
  }

  static #shared: SitemapAccessible

  static get shared(): SitemapAccessible {
    return Sitemap.#shared
  }

  static collect(ts: Template[]): void {
    const c = new Map<string, string>()
    const s = new Sitemap()

    for (const te of ts) {
      const n = extname(te.outputPath)
      if (n !== ".html") {
        continue
      }

      if (!te.data.sitemap) {
        continue
      }

      const d = te.data.sitemap(te.data)
      if (!d) {
        continue
      }

      if (!d.title) {
        throw new Error("No title")
      }
      if (!d.url) {
        throw new Error("No URL")
      }
      if (!d.data) {
        throw new Error("No data")
      }

      const p = new SitemapPage()
      p.id = `page;${d.url}`
      p.title = d.title
      p.url = d.url
      if (d.order) {
        p.order = d.order
      }
      p.data = d.data

      const i = s.#indexes[p.id]
      if (i !== undefined) {
        throw new Error(`Duplicate URL '${p.url}'`)
      }

      s.#entities.push(p)
      s.#indexes[p.id] = s.#entities.length - 1

      if (d.groups) {
        const a = d.groups()
        for (const d of a) {
          if (!d.title) {
            throw new Error("No title")
          }

          const g = new SitemapGroup()
          g.id = `group;${p.url};${d.title}`
          g.title = d.title
          g.parent = p.id

          const i = s.#indexes[g.id]
          if (i !== undefined) {
            throw new Error(`Duplicate group '${g.title}'`)
          }

          s.#entities.push(g)
          s.#indexes[g.id] = s.#entities.length - 1
        }
      }

      if (d.group) {
        const n = d.group()
        if (n) {
          c.set(p.id, n)
        }
      }
    }

    for (const e of s.#entities) {
      if (e.type !== "page") {
        continue
      }

      const a = e.url.split("/")

      let t = a.length - 1
      if (!a[t]) {
        t -= 1
      }

      // eslint-disable-next-line prefer-template
      const u = a.slice(0, t).join("/") + "/"

      if (e.url === u) {
        continue
      }

      const h: SitemapGroup[] = []

      let i = -1
      let k = t
      let x = u
      let n = ""

      while (true) {
        i = s.#indexes[`page;${x}`]
        if (i !== undefined) {
          break
        }

        k -= 1
        // eslint-disable-next-line prefer-template
        x = a.slice(0, k).join("/") + "/"
        n = a[k]

        let g: SitemapGroup

        const id = `group;${x};${n}`
        const j = s.#indexes[id]
        if (j !== undefined) {
          const e = s.#entities[j]
          if (e.type !== "group") {
            throw new Error(`Not a group '${id}'`)
          }
          g = e
        } else {
          g = new SitemapGroup()
          g.id = id
          g.title = n
        }

        h.push(g)
      }

      let m = s.#entities[i]
      if (!m || m.type !== "page") {
        throw new Error(`Not a page '${e.id}'`)
      }

      if (h.length !== 0) {
        let p = h[h.length - 1]
        for (let i = h.length - 2; i >= 0; i -= 1) {
          const n = h[i]
          if (!n.parent) {
            n.parent = p.id
          }
          if (n.parent !== p.id) {
            throw new Error(`Parent mismatch '${n.id}'`)
          }
          if (!p.children.includes(n.id)) {
            p.children.push(n.id)
          }
          p = n
        }

        const g = h[h.length - 1]
        if (!g.parent) {
          g.parent = m.id
        }
        if (g.parent !== m.id) {
          throw new Error(`Parent mismatch '${g.id}'`)
        }

        for (const g of h) {
          if (s.#indexes[g.id] === undefined) {
            s.#entities.push(g)
            s.#indexes[g.id] = s.#entities.length - 1
          }
        }

        m = g
      }

      e.parent = m.id
      m.children.push(e.id)
    }

    for (const e of s.#entities) {
      if (e.type !== "page") {
        continue
      }

      const n = c.get(e.id)
      if (!n) {
        continue
      }

      const j = s.#indexes[e.parent]
      if (j === undefined) {
        throw new Error(`No parent for '${e.url}'`)
      }

      const p = s.#entities[j]
      if (!p) {
        throw new Error(`No entity for '${e.url}'`)
      }

      let id = ""
      if (p.type === "page") {
        id = `group;${p.url};${n}`
      } else if (p.type === "group") {
        id = `${p.id};${n}`
      } else {
        // @ts-expect-error
        throw new Error(`Unknown type '${p.type}'`)
      }

      let i = s.#indexes[id]
      if (i === undefined) {
        const g = new SitemapGroup()
        g.id = id
        g.title = n
        s.#entities.push(g)
        i = s.#entities.length - 1
        s.#indexes[g.id] = i
      }

      const m = s.#entities[i]
      if (!m) {
        throw new Error(`No entity for '${id}'`)
      }

      for (const [i, id] of p.children.entries()) {
        if (id === e.id) {
          p.children.splice(i, 1)
        }
      }

      e.parent = m.id
      m.children.push(e.id)
      m.parent = p.id

      if (!p.children.includes(m.id)) {
        p.children.push(m.id)
      }
    }

    for (const e of s.#entities) {
      e.children.sort((a, b) => {
        const i = s.#indexes[a]
        if (i === undefined) {
          throw new Error(`No index for '${a}'`)
        }
        const x = s.#entities[i]
        if (!x) {
          throw new Error(`No entity for '${a}'`)
        }
        const j = s.#indexes[b]
        if (j === undefined) {
          throw new Error(`No index for '${b}'`)
        }
        const y = s.#entities[j]
        if (!y) {
          throw new Error(`No entity for '${b}'`)
        }
        const d = x.order - y.order
        if (d !== 0) {
          return d
        }
        return x.title.localeCompare(y.title)
      })
    }

    Sitemap.#shared = s
  }
}

export function eleventySitemap(uc: UserConfig): void {
  uc.addCollection("sitemap", (tc) => {
    const ts = tc.getAll()
    Sitemap.collect(ts)
    return []
  })
}
