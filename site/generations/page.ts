import {type SitemapData, SitemapDatum} from "@onlyoffice/eleventy-sitemap"
import {type Data} from "@onlyoffice/eleventy-types"
import {type ChapterData, ChapterDatum} from "../internal/chapter.tsx"
import {type ExplorerData, ExplorerDatum} from "../internal/explorer.tsx"
import {type HelpData, HelpDatum} from "../internal/help.tsx"
import {type HomeData, HomeDatum} from "../internal/home.tsx"
import {type LibraryData, LibraryDatum} from "../internal/library.tsx"
import {type MenubarData, MenubarDatum} from "../internal/menubar.tsx"
import {type PageData, PageDatum} from "../internal/page.tsx"
import {type PartData, PartDatum} from "../internal/part.tsx"
import {type ServiceData, ServiceDatum} from "../internal/service.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    icon?: string
    title?: string
    url?: string
    description?: string
    summary?: string
    blank?: boolean
    order?: number
    items?: unknown[]

    defaultSitemap?: SitemapData
    defaultMenubar?: MenubarData
    defaultExplorer?: ExplorerData
    defaultHelp?: HelpData
    defaultLibrary?: LibraryData
    defaultService?: ServiceData
    defaultChapter?: ChapterData
    defaultPart?: PartData
    defaultHome?: HomeData
    defaultDocument?: PageData
  }

  interface EleventyComputed {
    icon?(data: Data): string | undefined
    title?(data: Data): string | undefined
    url?(data: Data): string | undefined
    description?(data: Data): string | undefined
    summary?(data: Data): string | undefined
    blank?(data: Data): boolean | undefined
    order?(data: Data): number | undefined
    items?(data: Data): unknown[] | undefined

    defaultSitemap?(data: Data): SitemapData | undefined
    defaultMenubar?(data: Data): MenubarData | undefined
    defaultExplorer?(data: Data): ExplorerData | undefined
    defaultHelp?(data: Data): HelpData | undefined
    defaultLibrary?(data: Data): LibraryData | undefined
    defaultService?(data: Data): ServiceData | undefined
    defaultChapter?(data: Data): ChapterData | undefined
    defaultPart?(data: Data): PartData | undefined
    defaultHome?(data: Data): HomeData | undefined
    defaultDocument?(data: Data): PageData | undefined
  }
}

export function data(): Data {
  return {
    layout: "article",

    eleventyComputed: {
      title(d) {
        if (d.title) {
          return d.title
        }
        if (d.page) {
          return d.page.fileSlug
        }
      },

      layout(d) {
        if (d.layout) {
          return `${d.layout}.tsx`
        }
      },

      sitemap(d) {
        const a = d.defaultSitemap
        if (!a) {
          return
        }
        const b = d.sitemap
        if (!b) {
          return a
        }
        return SitemapDatum.merge(a, b)
      },

      defaultSitemap(d) {
        const m = new SitemapDatum()
        if (d.title) {
          m.title = d.title
        }
        const u = d.sitemapUrl
        if (!u) {
          return
        }
        m.url = u
        if (d.page) {
          m.path = d.page.inputPath
        }
        if (d.order) {
          m.order = d.order
        }
        return m
      },

      menubar(d) {
        const a = d.defaultMenubar
        if (!a) {
          return
        }
        const b = d.menubar
        if (!b) {
          return a
        }
        return MenubarDatum.merge(a, b)
      },

      defaultMenubar(d) {
        const m = new MenubarDatum()
        if (d.icon) {
          m.icon = d.icon
        }
        if (d.title) {
          m.title = d.title
        }
        if (d.page) {
          // Remove the leading dot to pass this path to the Link component.
          m.path = d.page.inputPath.slice(1)
        }
        return m
      },

      explorer(d) {
        const a = d.defaultExplorer
        if (!a) {
          return
        }
        const b = d.explorer
        if (!b) {
          return a
        }
        return ExplorerDatum.merge(a, b)
      },

      defaultExplorer(d) {
        const m = new ExplorerDatum()
        if (d.title) {
          m.title = d.title
        }
        if (d.url) {
          m.url = d.url
        } else {
          const u = d.canonicalUrl
          if (!u) {
            return
          }
          m.url = u
        }
        if (d.blank) {
          m.blank = d.blank
        }
        return m
      },

      help(d) {
        const a = d.defaultHelp
        if (!a) {
          return
        }
        const b = d.help
        if (!b) {
          // Do not return the default help data to force the Help component to
          // try find the help data in the tree.
          return
        }
        return HelpDatum.merge(a, b)
      },

      defaultHelp(d) {
        const m = new HelpDatum()
        if (d.title) {
          m.title = d.title
        }
        return m
      },

      library(d) {
        const a = d.defaultLibrary
        if (!a) {
          return
        }
        const b = d.library
        if (!b) {
          return a
        }
        return LibraryDatum.merge(a, b)
      },

      defaultLibrary() {
        return new LibraryDatum()
      },

      service(d) {
        const a = d.defaultService
        if (!a) {
          return
        }
        const b = d.service
        if (!b) {
          return a
        }
        return ServiceDatum.merge(a, b)
      },

      defaultService() {
        return new ServiceDatum()
      },

      chapter(d) {
        const a = d.defaultChapter
        if (!a) {
          return
        }
        const b = d.chapter
        if (!b) {
          return a
        }
        return ChapterDatum.merge(a, b)
      },

      defaultChapter(d) {
        const m = new ChapterDatum()
        if (d.title) {
          m.title = d.title
        }
        return m
      },

      part(d) {
        const a = d.defaultPart
        if (!a) {
          return
        }
        const b = d.part
        if (!b) {
          return a
        }
        return PartDatum.merge(a, b)
      },

      defaultPart(d) {
        const m = new PartDatum()
        if (d.title) {
          m.title = d.title
        }
        if (d.description) {
          m.description = d.description
        }
        return m
      },

      home(d) {
        const a = d.defaultHome
        if (!a) {
          return
        }
        const b = d.home
        if (!b) {
          return a
        }
        return HomeDatum.merge(a, b)
      },

      defaultHome(d) {
        const m = new HomeDatum()
        if (d.title) {
          m.title = d.title
        }
        return m
      },

      document(d) {
        const a = d.defaultDocument
        if (!a) {
          return
        }
        const b = d.document
        if (!b) {
          return a
        }
        return PageDatum.merge(a, b)
      },

      defaultDocument() {
        return new PageDatum()
      },
    },
  }
}
