import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Explorer} from "./explorer.tsx"

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
      <Explorer level={2} url={p.url} />
    </Site.ChapterNavigation>
    <Site.ChapterContent>
      {p.children}
    </Site.ChapterContent>
  </Site.Chapter>
}
