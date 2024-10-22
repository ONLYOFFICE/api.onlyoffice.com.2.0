// todo: move out search components

import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {Fragment, type JSX, createContext, h} from "preact"
import {useContext} from "preact/hooks"
import {Breadcrumb} from "./breadcrumb.tsx"
import {Help} from "./help.tsx"
import {TableOfContents} from "./table-of-contents.tsx"

class Context {
  Content: ArticleContentChildren = () => null
  Sidebar: ArticleSidebarChildren = () => null
}

const ctx = createContext(new Context())

export interface ArticleContentProperties {
  children: ArticleContentChildren
}

export interface ArticleContentChildren {
  (this: void): JSX.Element | null
}

export function ArticleContent(p: ArticleContentProperties): JSX.Element {
  const c = useContext(ctx)
  c.Content = p.children
  return <></>
}

export interface ArticleSidebarProperties {
  children: ArticleSidebarChildren
}

export interface ArticleSidebarChildren {
  (this: void): JSX.Element | null
}

export function ArticleSidebar(p: ArticleSidebarProperties): JSX.Element {
  const c = useContext(ctx)
  c.Sidebar = p.children
  return <></>
}

export interface ArticleProperties extends ChildrenIncludable {
  url: string
}

export function Article(p: ArticleProperties): JSX.Element {
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

function Root(p: ArticleProperties): JSX.Element {
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

  return <Site.Article
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
}
