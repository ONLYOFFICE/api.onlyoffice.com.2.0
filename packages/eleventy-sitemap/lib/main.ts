import {
  type Data,
  type Template,
  type UserConfig,
} from "@onlyoffice/eleventy-types"
import * as errors from "@onlyoffice/errors"
import {type Result} from "@onlyoffice/result"
import pack from "../package.json" with {type: "json"}

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    sitemap?: SitemapData
  }

  interface EleventyComputed {
    sitemap?(data: Data): SitemapData | undefined
  }
}

export interface SitemapData {
  type?: EntityType
  title?: string
  url?: string
  path?: string
  order?: number
}

export class SitemapDatum implements SitemapData {
  type: EntityType = "page"
  title = ""
  url = ""
  path = ""
  order = 0

  static merge(a: SitemapData, b: SitemapData): SitemapData {
    const c = new SitemapDatum()

    if (b.type) {
      c.type = b.type
    } else if (a.type) {
      c.type = a.type
    }

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.url) {
      c.url = b.url
    } else if (a.url) {
      c.url = a.url
    }

    if (b.path) {
      c.path = b.path
    } else if (a.path) {
      c.path = a.path
    }

    if (b.order !== undefined) {
      c.order = b.order
    } else if (a.order !== undefined) {
      c.order = a.order
    }

    return c
  }
}

export function eleventySitemap(uc: UserConfig): void {
  uc.addCollection("sitemap", (tc) => {
    const at = tc.getAll()

    const [st, err] = Sitemap.from(at)
    Sitemap.shared = st

    for (const e of errors.split(err)) {
      uc.logger.message(e.message, "error", "red", false, pack.name)
    }

    return []
  })
}

export class Sitemap {
  static shared: Sitemap

  static from(at: Template[]): Result<Sitemap, Error> {
    const s0 = new Sitemap()
    s0.#templates = at

    this.#populate(s0)
    const err = this.#attach(s0)

    const s1 = new Sitemap()
    s1.#templates = at

    const re = s0.findByUrl("/")
    if (!re) {
      throw new Error("Root not found")
    }

    this.#transfer(s0, s1, re)
    this.#reattach(s0, s1)

    return [s1, err]
  }

  static #populate(s0: Sitemap): void {
    for (const [ti, te] of s0.#templates.entries()) {
      const sd = te.data.sitemap

      if (!sd) {
        continue
      }

      if (!(sd instanceof SitemapDatum)) {
        throw new TypeError("Sitemap data is not a SitemapDatum")
      }

      if (sd.type === "group") {
        const ge = new GroupEntity()
        ge.templateId = ti
        ge.data = EntityData.from(sd)
        s0.#addEntity(ge)
        continue
      }

      if (sd.type === "page") {
        const pe = new PageEntity()
        pe.templateId = ti
        pe.data = EntityData.from(sd)
        s0.#addEntity(pe)
        continue
      }

      throw new Error(`Unknown type: ${sd.type}`)
    }
  }

  static #attach(s0: Sitemap): Error | undefined {
    let err: Error | undefined

    const na: Entity[] = []

    for (const en of s0.#entities) {
      let ce: Entity | undefined = en

      while (true) {
        if (ce.data.url === "/") {
          break
        }

        const ac = ce.data.url.split("/")
        if (ac.length === 1) {
          break
        }

        let ur = ""
        for (let i = 0; i < ac.length - 2; i += 1) {
          ur += `${ac[i]}/`
        }

        let pe = s0.findByUrl(ur)

        if (!pe) {
          const ed = EntityData.notFound()
          ed.url = ur

          const ne = new PageEntity()
          ne.data = ed
          s0.#addEntity(ne)

          pe = ne
          na.push(ne)

          const e = new Error(`Parent not found: ${ce.data.url} (#${ce.id}, #${ce.templateId})`)
          err = errors.join(err, e)
        }

        if (ce.parentId === -1) {
          ce.parentId = pe.id
          pe.children.push(ce.id)
        }

        ce = pe
      }
    }

    const ne = s0.findByUrl("/404/")

    if (!ne) {
      const e = new Error("Entity for the 404 page not found: /404/")
      err = errors.join(err, e)
    } else {
      for (const en of na) {
        en.templateId = ne.templateId
      }
    }

    return err
  }

  static #transfer(s0: Sitemap, s1: Sitemap, e: Entity): void {
    if (!e) {
      return
    }

    s1.#addEntity(e)

    if (e.children.length === 0) {
      return
    }

    e.children.sort((a, b) => {
      const x = s0.findById(a)
      if (!x) {
        throw new Error(`Entity not found: #${a}`)
      }

      const y = s0.findById(b)
      if (!y) {
        throw new Error(`Entity not found: #${b}`)
      }

      const d = x.data.order - y.data.order
      if (d !== 0) {
        return d
      }

      return x.data.title.localeCompare(y.data.title)
    })

    for (const id of e.children) {
      const e = s0.findById(id)
      if (!e) {
        throw new Error(`Entity not found: #${id}`)
      }

      this.#transfer(s0, s1, e)
    }
  }

  static #reattach(s0: Sitemap, s1: Sitemap): void {
    for (const en of s1.#entities) {
      if (en.parentId === -1 && en.data.url !== "/") {
        throw new Error(`Entity not attached: #${en.id}`)
      }

      if (en.parentId !== -1) {
        const e0 = s0.findById(en.parentId)
        if (!e0) {
          throw new Error(`Parent not found: #${en.parentId}`)
        }

        const e1 = s1.findByUrl(e0.data.url)
        if (!e1) {
          throw new Error(`Parent not found: ${e0.data.url}`)
        }

        en.parentId = e1.id
      }

      if (en.children.length === 0) {
        continue
      }

      for (const [i, id] of en.children.entries()) {
        const e0 = s0.findById(id)
        if (!e0) {
          throw new Error(`Entity not found: #${id}`)
        }

        const e1 = s1.findByUrl(e0.data.url)
        if (!e1) {
          throw new Error(`Entity not found: ${e0.data.url}`)
        }

        en.children[i] = e1.id
      }
    }
  }

  #idIndex: Record<number, number> = {}

  #urlIndex: Record<string, number> = {}

  #pathIndex: Record<string, number> = {}

  #entities: Entity[] = []

  get entities(): Entity[] {
    return this.#entities
  }

  #templates: Template[] = []

  findById(id: number): Entity | undefined {
    const i = this.#idIndex[id]
    if (i === undefined) {
      return
    }
    return this.#entities[i]
  }

  findByUrl(u: string): Entity | undefined {
    const i = this.#urlIndex[u]
    if (i === undefined) {
      return
    }
    return this.#entities[i]
  }

  findByPath(p: string): Entity | undefined {
    const i = this.#pathIndex[p]
    if (i === undefined) {
      return
    }
    return this.#entities[i]
  }

  trailOf(e: Entity): number[] {
    const t: number[] = []

    let c: Entity | undefined = e
    while (c) {
      t.push(c.id)
      c = this.findById(c.parentId)
    }

    return t.reverse()
  }

  dataOf(e: Entity): Data {
    const t = this.#templateOf(e)
    return t.data
  }

  dateOf(e: Entity): Date {
    const t = this.#templateOf(e)
    return t.date
  }

  #templateOf(e: Entity): Template {
    const t = this.#templates[e.templateId]
    if (!t) {
      throw new Error(`Template not found: #${e.templateId} (#${e.id})`)
    }
    return t
  }

  #addEntity(e: Entity): void {
    e.id = this.#entities.length
    this.#entities.push(e)
    this.#idIndex[e.id] = this.#entities.length - 1
    this.#urlIndex[e.data.url] = this.#entities.length - 1
    this.#pathIndex[e.data.path] = this.#entities.length - 1
  }
}

export type Entity = EntityMap[EntityType]

export type EntityType = keyof EntityMap

export interface EntityMap {
  group: GroupEntity
  page: PageEntity
}

export class GroupEntity implements EntityNode {
  id = -1
  type = "group" as const
  templateId = -1
  parentId = -1
  children: number[] = []
  data = new EntityData()
}

export class PageEntity implements EntityNode {
  id = -1
  type = "page" as const
  templateId = -1
  parentId = -1
  children: number[] = []
  data = new EntityData()
}

export interface EntityNode {
  id: number
  type: string
  templateId: number
  parentId: number
  children: number[]
  data: EntityData
}

export class EntityData {
  static notFound(): EntityData {
    const e = new EntityData()
    e.title = "404 Not Found"
    e.order = -Infinity
    return e
  }

  static from(d: SitemapDatum): EntityData {
    const e = new EntityData()
    e.title = d.title
    e.url = d.url
    e.path = d.path
    e.order = d.order
    return e
  }

  title = ""
  url = ""
  path = ""
  order = -1
}
