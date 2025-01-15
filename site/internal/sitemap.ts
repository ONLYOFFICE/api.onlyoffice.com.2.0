import * as S from "@onlyoffice/eleventy-sitemap"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {type ChapterData} from "./chapter.tsx"
import {type ExplorerData} from "./explorer.tsx"
import {type HelpData} from "./help.tsx"
import {type HomeData} from "./home.tsx"
import {type LibraryData} from "./library.tsx"
import {type MarkdownData} from "./markdown.tsx"
import {type MenubarData} from "./menubar.tsx"
import {type PageData} from "./page.tsx"
import {type PartData} from "./part.tsx"
import {type ServiceData} from "./service.tsx"

const rootUrl = "/"

export function eleventySitemap(uc: UserConfig): void {
  S.eleventySitemap({
    ...uc,
    addCollection(n, cb) {
      uc.addCollection(n, (tc) => {
        const r = cb(tc)
        Sitemap.shared = new Sitemap(S.Sitemap.shared)
        return r
      })
    },
  })
}

export class Sitemap {
  static shared: Sitemap

  #s: S.Sitemap

  get root(): PageEntity {
    return this.findPageByUrl(rootUrl)
  }

  constructor(s: S.Sitemap) {
    this.#s = s
  }

  findRoot(u: string, d: number): PageEntity {
    let e = this.#s.findByUrl(rootUrl)

    if (!e) {
      throw new Error(`Entity not found: ${u}`)
    }

    while (true) {
      if (d === 0) {
        break
      }

      if (e.children.length === 0) {
        break
      }

      for (const id of e.children) {
        const c = this.#s.findById(id)

        if (!c) {
          throw new Error(`Entity not found: #${id}`)
        }

        if (u.startsWith(c.data.url)) {
          e = c
          d -= 1
          break
        }
      }
    }

    if (!(e instanceof S.PageEntity)) {
      throw new Error(`Entity is not a page: #${e.id}, ${e.type}, ${e.data.url}`)
    }

    return new PageEntity(this.#s, e)
  }

  findPageById(id: number): PageEntity {
    const e = this.#s.findById(id)

    if (!e) {
      throw new Error(`Entity not found: #${id}`)
    }

    if (e.type !== "page") {
      throw new Error(`Entity is not a page: #${e.id}, ${e.type}, ${e.data.url}`)
    }

    return new PageEntity(this.#s, e)
  }

  findPageByUrl(u: string): PageEntity {
    const e = this.#s.findByUrl(u)

    if (!e) {
      throw new Error(`Entity not found: ${u}`)
    }

    if (e.type !== "page") {
      throw new Error(`Entity is not a page: #${e.id}, ${e.type}, ${e.data.url}`)
    }

    return new PageEntity(this.#s, e)
  }

  findPageByPath(p: string): PageEntity {
    const e = this.#s.findByPath(p)

    if (!e) {
      throw new Error(`Entity not found: ${p}`)
    }

    if (e.type !== "page") {
      throw new Error(`Entity is not a page: #${e.id}, ${e.type}, ${e.data.url}`)
    }

    return new PageEntity(this.#s, e)
  }

  findById(id: number): Entity {
    const e = this.#s.findById(id)

    if (!e) {
      throw new Error(`Entity not found: #${id}`)
    }

    if (e instanceof S.GroupEntity) {
      return new GroupEntity(e)
    }

    if (e instanceof S.PageEntity) {
      return new PageEntity(this.#s, e)
    }

    // @ts-expect-error
    throw new Error(`Unknown entity type: #${id}, ${e.type}`)
  }

  findByUrl(u: string): Entity {
    const e = this.#s.findByUrl(u)

    if (!e) {
      throw new Error(`Entity not found: ${u}`)
    }

    if (e instanceof S.GroupEntity) {
      return new GroupEntity(e)
    }

    if (e instanceof S.PageEntity) {
      return new PageEntity(this.#s, e)
    }

    // @ts-expect-error
    throw new Error(`Unknown entity type: #${e.id}, ${e.type}`)
  }

  trailOf(e: Entity): number[] {
    const s = this.#sourceOf(e)
    return this.#s.trailOf(s)
  }

  #sourceOf(e: Entity): S.Entity {
    if (e instanceof GroupEntity) {
      return GroupEntity.source(e)
    }

    if (e instanceof PageEntity) {
      return PageEntity.source(e)
    }

    throw new Error(`Unknown entity type: ${e}`)
  }
}

export type Entity = EntityMap[EntityType]

export type EntityType = keyof EntityMap

export interface EntityMap {
  group: GroupEntity
  page: PageEntity
}

export class GroupEntity {
  static source(g: GroupEntity): S.GroupEntity {
    return g.#e
  }

  #e: S.GroupEntity

  get id(): number {
    return this.#e.id
  }

  get parentId(): number {
    return this.#e.parentId
  }

  get children(): number[] {
    return this.#e.children
  }

  get data(): S.EntityData {
    return this.#e.data
  }

  get title(): string {
    return this.#e.data.title
  }

  get sitemapUrl(): string {
    return this.#e.data.url
  }

  constructor(e: S.GroupEntity) {
    this.#e = e
  }
}

export class PageEntity {
  static source(p: PageEntity): S.PageEntity {
    return p.#e
  }

  #s: S.Sitemap
  #e: S.PageEntity

  get id(): number {
    return this.#e.id
  }

  get parentId(): number {
    return this.#e.parentId
  }

  get children(): number[] {
    return this.#e.children
  }

  get data(): S.EntityData {
    return this.#e.data
  }

  get title(): string {
    const d = this.#s.dataOf(this.#e)

    const t = d.title
    if (!t) {
      throw new Error(`Title data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get canonicalUrl(): string {
    const d = this.#s.dataOf(this.#e)

    const t = d.canonicalUrl
    if (!t) {
      throw new Error(`Canonical URL data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get virtualUrl(): string {
    const d = this.#s.dataOf(this.#e)

    const t = d.virtualUrl
    if (!t) {
      throw new Error(`Virtual URL data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get sitemapUrl(): string {
    const d = this.#s.dataOf(this.#e)

    const t = d.sitemapUrl
    if (!t) {
      throw new Error(`Sitemap URL data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get summary(): string {
    const d = this.#s.dataOf(this.#e)

    const t = d.summary
    if (!t) {
      throw new Error(`Summary data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get menubar(): MenubarData {
    const d = this.#s.dataOf(this.#e)

    const t = d.menubar
    if (!t) {
      throw new Error(`Menubar data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get explorer(): ExplorerData {
    const d = this.#s.dataOf(this.#e)

    const t = d.explorer
    if (!t) {
      throw new Error(`Explorer data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get help(): HelpData {
    const d = this.#s.dataOf(this.#e)

    const t = d.help
    if (!t) {
      throw new Error(`Help data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get library(): LibraryData {
    const d = this.#s.dataOf(this.#e)

    const t = d.library
    if (!t) {
      throw new Error(`Library data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get service(): ServiceData {
    const d = this.#s.dataOf(this.#e)

    const t = d.service
    if (!t) {
      throw new Error(`Service data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get chapter(): ChapterData {
    const d = this.#s.dataOf(this.#e)

    const t = d.chapter
    if (!t) {
      throw new Error(`Chapter data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get part(): PartData {
    const d = this.#s.dataOf(this.#e)

    const t = d.part
    if (!t) {
      throw new Error(`Part data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get home(): HomeData {
    const d = this.#s.dataOf(this.#e)

    const t = d.home
    if (!t) {
      throw new Error(`Home data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get document(): PageData {
    const d = this.#s.dataOf(this.#e)

    const t = d.document
    if (!t) {
      throw new Error(`Page data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  get markdown(): MarkdownData {
    const d = this.#s.dataOf(this.#e)

    const t = d.markdown
    if (!t) {
      throw new Error(`Markdown data not found: #${this.#e.id}, ${this.#e.data.url}`)
    }

    return t
  }

  constructor(s: S.Sitemap, e: S.PageEntity) {
    this.#s = s
    this.#e = e
  }

  get isRoot(): boolean {
    return this.canonicalUrl === rootUrl
  }
}
