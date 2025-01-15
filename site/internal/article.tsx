// todo: move out search components

import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Breadcrumb} from "./breadcrumb.tsx"
import {Help} from "./help.tsx"
import {Sitemap} from "./sitemap.ts"
import {TableOfContents} from "./table-of-contents.tsx"

// class Context {
//   Content: ArticleContentChildren = () => null
//   Sidebar: ArticleSidebarChildren = () => null
// }

// const ctx = createContext(new Context())

// export interface ArticleContentProperties {
//   children: ArticleContentChildren
// }

// export interface ArticleContentChildren {
//   (this: void): JSX.Element | null
// }

// export function ArticleContent(p: ArticleContentProperties): JSX.Element {
//   const c = useContext(ctx)
//   c.Content = p.children
//   return <></>
// }

// export interface ArticleSidebarProperties {
//   children: ArticleSidebarChildren
// }

// export interface ArticleSidebarChildren {
//   (this: void): JSX.Element | null
// }

// export function ArticleSidebar(p: ArticleSidebarProperties): JSX.Element {
//   const c = useContext(ctx)
//   c.Sidebar = p.children
//   return <></>
// }

export interface ArticleProperties extends ChildrenIncludable {
  sitemapUrl: string
}

export function Article(p: ArticleProperties): JSX.Element {
  const s = Sitemap.shared
  const e = s.findPageByUrl(p.sitemapUrl)
  const c = e.chapter
  const m = e.markdown

  return <Site.Article variant="wide">
    <Site.ArticleBreadcrumb>
      <Breadcrumb sitemapUrl={p.sitemapUrl} />
    </Site.ArticleBreadcrumb>
    <Site.ArticleSidebar>
      <Toc />
    </Site.ArticleSidebar>
    <Site.ArticleContent>
      <Site.SearchHidable>
        <Site.Content>
          <h1>{c.title}</h1>
          {p.children}
          {c.tableOfContents && <TableOfContents
            sitemapUrl={p.sitemapUrl}
            depth={1}
          />}
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
      {c.help && <Help sitemapUrl={p.sitemapUrl} />}
    </Site.ArticleHelp>
  </Site.Article>

  function Toc(): JSX.Element | null {
    if (!m.toc || m.toc.length === 0) {
      return null
    }

    const ls: JSX.Element[] = []

    for (const t of m.toc) {
      if (t.level !== 2) {
        continue
      }

      ls.push(<Site.TocItem>
        <Site.TocLink href={`#${t.id}`}>{t.text}</Site.TocLink>
      </Site.TocItem>)
    }

    if (ls.length === 0) {
      return null
    }

    return <Site.Toc>
      <Site.TocHeading>In this article</Site.TocHeading>
      <Site.TocList>{ls}</Site.TocList>
    </Site.Toc>
  }
}
