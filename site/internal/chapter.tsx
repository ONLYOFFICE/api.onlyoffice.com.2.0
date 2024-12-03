import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Explorer} from "./explorer.tsx"
import {Sitemap} from "./sitemap.ts"

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

export interface ChapterProperties extends ChildrenIncludable {
  sitemapUrl: string
}

export function Chapter(p: ChapterProperties): JSX.Element {
  const sm = Sitemap.shared

  const ce = sm.findPageByUrl(p.sitemapUrl)

  const ct = sm.trailOf(ce)
  if (ct.length < 3) {
    throw new Error(`Chapter layout requires at least three levels: #${ce.id}, ${ce.sitemapUrl}, ${ct}`)
  }

  const [, pi, hi] = ct

  const pe = sm.findPageById(pi)
  const pd = pe.part

  const he = sm.findPageById(hi)
  const hd = he.chapter

  return <Site.Chapter
    data-part={pd.title}
    data-chapter={hd.title}
    data-pagefind-filter="part[data-part], chapter[data-chapter]"
  >
    <Site.ChapterNavigation>
      <Site.SearchContainer
        search-options={{
          filters: {
            part: [pd.title],
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
      <Explorer sitemapUrl={p.sitemapUrl} level={2} />
    </Site.ChapterNavigation>
    <Site.ChapterContent>
      {p.children}
    </Site.ChapterContent>
  </Site.Chapter>
}
