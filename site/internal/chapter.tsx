// todo: separate chapter with article

import {Sitemap, type SitemapEntity} from "@onlyoffice/eleventy-sitemap"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import * as Ui from "@onlyoffice/ui-kit"
import {Fragment, type JSX, createContext, h} from "preact"
import {useContext} from "preact/hooks"
import {Tree, TreeGroup, TreeItem, TreeLink} from "../components/tree/tree.tsx"
import {Help} from "./help.tsx"
import {TableOfContents} from "./table-of-contents.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    chapter?: ChapterData
  }

  interface EleventyComputed {
    chapter?(data: Data): ChapterData | undefined
  }
}

export interface ChapterData {
  title?: string
  tableOfContents?: boolean
  help?: boolean
}

export class ChapterDatum implements ChapterData {
  title = ""
  tableOfContents = false
  help = true

  static merge(a: ChapterData, b: ChapterData): ChapterData {
    const c = new ChapterDatum()

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.tableOfContents) {
      c.tableOfContents = b.tableOfContents
    } else if (a.tableOfContents) {
      c.tableOfContents = a.tableOfContents
    }

    if (b.help) {
      c.help = b.help
    } else if (a.help) {
      c.help = a.help
    }

    return c
  }
}

class Context {
  Content: unknown = () => null
  Sidebar: unknown = () => null
}

const ctx = createContext(new Context())

export interface ArticleContentProperties {
  children: unknown
}

export function ArticleContent(p: ArticleContentProperties): JSX.Element {
  const c = useContext(ctx)
  c.Content = p.children
  return <></>
}

export interface ArticleSidebarProperties {
  children: unknown
}

export function ArticleSidebar(p: ArticleSidebarProperties): JSX.Element {
  const c = useContext(ctx)
  c.Sidebar = p.children
  return <></>
}

export interface ChapterProperties extends ChildrenIncludable {
  url: string
}

export function Chapter(p: ChapterProperties): JSX.Element {
  const s = Sitemap.shared

  const ue = s.find(p.url, "url")
  if (!ue) {
    throw new Error(`Entity not found: ${p.url}`)
  }
  if (ue.type !== "page") {
    throw new Error(`Current entity is not a page: ${ue.type} (${ue.id})`)
  }

  return <ctx.Provider value={new Context()}>
    {ue.data.tempChapterNext && <>{p.children}</>}
    <Root {...p} />
  </ctx.Provider>
}

function Root(p: ChapterProperties): JSX.Element {
  const s = Sitemap.shared
  const {Content, Sidebar} = useContext(ctx)

  const ue = s.find(p.url, "url")
  if (!ue) {
    throw new Error(`Entity not found: ${p.url}`)
  }
  if (ue.type !== "page") {
    throw new Error(`Current entity is not a page: ${ue.type} (${ue.id})`)
  }

  const ud = ue.data.chapter
  if (!ud) {
    throw new Error(`Chapter data not found: ${ue.url} (${ue.id})`)
  }

  const ut = s.trace(ue)
  if (ut.length < 3) {
    throw new Error(`Chapter layout requires at least three levels: ${ue.url} (${ue.id})`)
  }

  const [, pi, hi] = ut

  const pe = s.find(pi, "id")
  if (!pe) {
    throw new Error(`Entity not found: ${pi}`)
  }
  if (pe.type !== "page") {
    throw new Error(`Part entity is not a page: ${pe.type} (${pe.id})`)
  }

  const he = s.find(hi, "id")
  if (!he) {
    throw new Error(`Entity not found: ${hi}`)
  }
  if (he.type !== "page") {
    throw new Error(`Chapter entity is not a page: ${he.type} (${he.id})`)
  }

  const hd = he.data.chapter
  if (!hd) {
    throw new Error(`Chapter data not found: ${he.url} (${he.id})`)
  }

  return <Site.Chapter
    data-part={pe.title}
    data-chapter={hd.title}
    data-pagefind-filter="part[data-part], chapter[data-chapter]"
  >
    <Site.ChapterNavigation>
      <Site.SearchContainer
        search-options={{
          filters: {
            part: [pe.title],
            chapter: [hd.title],
          },
        }}
      >
        <Site.SearchPlaceholder>Type <kbd>/</kbd> to search</Site.SearchPlaceholder>
        <Site.SearchField label="Search" />
        <Site.SearchClear label="Clear" />
        <Site.SearchTemplate>
          <li>
            <p><a data-search-container-link /></p>
            <p data-search-container-matches />
          </li>
        </Site.SearchTemplate>
      </Site.SearchContainer>
      <ChapterNavigation level={2} url={p.url} />
    </Site.ChapterNavigation>
    <Site.ChapterContent>
      <Site.Article
        variant={(() => {
          if (ue.data.tempChapterNext) {
            return "wide"
          }
          return "narrow"
        })()}
      >
        <Site.ArticleBreadcrumb>
          <Breadcrumb url={p.url} />
        </Site.ArticleBreadcrumb>
        {ue.data.tempChapterNext && <Site.ArticleSidebar>
          <Sidebar />
        </Site.ArticleSidebar>}
        <Site.ArticleContent>
          <Site.SearchHidable>
            <Site.Content>
              <h1>{ud.title}</h1>
              {ue.data.tempChapterNext && <Content />}
              {!ue.data.tempChapterNext && p.children}
              {ud.tableOfContents && <TableOfContents url={p.url} depth={1} />}
            </Site.Content>
          </Site.SearchHidable>
          <Site.SearchOutput>
            <Site.Content>
              <h1 aria-live="polite"><span data-search-container-counter /> Results</h1>
              <ol data-search-container-results />
            </Site.Content>
          </Site.SearchOutput>
        </Site.ArticleContent>
        <Site.ArticleHelp>
          {ud.help && <Help current={p.url} />}
        </Site.ArticleHelp>
      </Site.Article>
    </Site.ChapterContent>
  </Site.Chapter>
}

export interface ChapterNavigationProperties {
  level: number
  url: string
}

export function ChapterNavigation(p: ChapterNavigationProperties): JSX.Element | null {
  const s = Sitemap.shared

  let l = p.level
  let e = s.find("/", "url")
  while (true) {
    if (!e || l === 0) {
      break
    }
    for (const id of e.children) {
      const c = s.find(id, "id")
      if (!c) {
        continue
      }
      let u = ""
      if (c.type === "group") {
        const b = s.find(c.parent, "id")
        if (!b || b.type !== "page") {
          continue
        }
        u = b.url
      } else if (c.type === "page") {
        u = c.url
      } else {
        // @ts-expect-error
        throw new Error(`Unexpected entity type: ${c.type}`)
      }
      if (p.url.startsWith(u)) {
        e = c
        l -= 1
        break
      }
    }
  }

  if (!e) {
    return null
  }

  return <Tree>
    {e.children.map((id) => {
      const e = s.find(id, "id")
      if (!e || e.type !== "page") {
        return null
      }
      return <TreeGroup>
        <TreeLink href={e.url} active={p.url === e.url}>{e.title}</TreeLink>
        <Sub e={e} />
      </TreeGroup>
    })}
  </Tree>

  function Sub({e}: {e: SitemapEntity}): JSX.Element | null {
    return <>{e.children.map((id) => {
      const e = s.find(id, "id")
      if (!e) {
        return null
      }
      if (e.type === "group") {
        if (e.children.length === 0) {
          return null
        }
        const r = s.find(e.parent, "id")
        if (!r) {
          return null
        }
        if (r.type !== "page") {
          throw new Error(`Nested group is not supported: ${e.id}`)
        }
        const b = s.find(p.url, "url")
        if (!b) {
          return null
        }
        return <TreeItem expanded={e.children.includes(b.id)}>
          <TreeLink href="" active={false}>{e.title}</TreeLink>
          <Sub e={e} />
        </TreeItem>
      }
      if (e.type === "page") {
        return <TreeItem expanded={p.url.startsWith(e.url)}>
          <TreeLink href={e.url} active={p.url === e.url} blank={e.data.blank}>{e.title}</TreeLink>
          {e.children.length !== 0 && <Sub e={e} />}
        </TreeItem>
      }
      // @ts-expect-error
      throw new Error(`Unexpected entity type: ${e.type}`)
    })}</>
  }
}

export interface BreadcrumbProperties {
  url: string
}

export function Breadcrumb(p: BreadcrumbProperties): JSX.Element | null {
  const a: JSX.Element[] = []
  const s = Sitemap.shared

  let e = s.find(p.url, "url")
  while (true) {
    while (e && e.type === "group") {
      e = s.find(e.parent, "id")
    }
    if (!e || e.url === "/") {
      break
    }
    a.unshift(<Ui.BreadcrumbCrumb href={e.url}>{e.title}</Ui.BreadcrumbCrumb>)
    e = s.find(e.parent, "id")
  }

  if (a.length === 0) {
    return null
  }

  return <Ui.Breadcrumb>{a}</Ui.Breadcrumb>
}
