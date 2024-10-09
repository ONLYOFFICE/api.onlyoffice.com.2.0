import {type SitemapData, SitemapDatum} from "@onlyoffice/eleventy-sitemap"
import {type Data} from "@onlyoffice/eleventy-types"
import {cutSuffix} from "@onlyoffice/strings"
import {slug} from "github-slugger"
import {type ChapterData, ChapterDatum} from "../internal/chapter.tsx"
import {type GlobalNavigationData, GlobalNavigationDatum} from "../internal/global-navigation.tsx"
import {type HelpData, HelpDatum} from "../internal/help.tsx"
import {type HomeData, HomeDatum} from "../internal/home.tsx"
import {type LibraryData, LibraryDatum} from "../internal/library.tsx"
import {type PageData, PageDatum} from "../internal/page.tsx"
import {type PartData, PartDatum} from "../internal/part.tsx"
import {
  type ServiceDeclarationData,
  ServiceDeclarationDatum,
} from "../internal/service-declaration.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    slug?(data: Data): string | undefined
    crosslink?(data: Data, slug: string): string | undefined

    icon?: string
    title?: string
    description?: string
    summary?: string
    order?: number
    items?: unknown[]

    defaultSitemap?: SitemapData
    defaultGlobalNavigation?: GlobalNavigationData
    defaultHelp?: HelpData
    defaultLibrary?: LibraryData
    defaultServiceDeclaration?: ServiceDeclarationData
    defaultChapter?: ChapterData
    defaultPart?: PartData
    defaultHome?: HomeData
    defaultDocument?: PageData
  }

  interface EleventyComputed {
    icon?(data: Data): string | undefined
    title?(data: Data): string | undefined
    description?(data: Data): string | undefined
    summary?(data: Data): string | undefined
    order?(data: Data): number | undefined
    items?(data: Data): unknown[] | undefined

    defaultSitemap?(data: Data): SitemapData | undefined
    defaultGlobalNavigation?(data: Data): GlobalNavigationData | undefined
    defaultHelp?(data: Data): HelpData | undefined
    defaultLibrary?(data: Data): LibraryData | undefined
    defaultServiceDeclaration?(data: Data): ServiceDeclarationData | undefined
    defaultChapter?(data: Data): ChapterData | undefined
    defaultPart?(data: Data): PartData | undefined
    defaultHome?(data: Data): HomeData | undefined
    defaultDocument?(data: Data): PageData | undefined
  }
}

export function data(): Data {
  return {
    permalink(d) {
      if (!d.page) {
        return
      }
      let p = d.page.filePathStem
      if (d.slug) {
        [p] = cutSuffix(p, d.page.fileSlug)
        p += d.slug(d)
      }
      p = p.split("/")
        .map((s) => {
          return slug(s)
        })
        .join("/")
      p += `.${d.page.outputFileExtension}`
      return p
    },

    crosslink(d, s) {
      if (!d.page) {
        return
      }
      let p = d.page.filePathStem
      ;[p] = cutSuffix(p, d.page.fileSlug)
      p += s
      p = p.split("/")
        .map((s) => {
          return slug(s)
        })
        .join("/")
      return p
    },

    layout: "chapter",

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
        if (d.page) {
          m.url = d.page.url
          m.path = d.page.inputPath
        }
        if (d.order) {
          m.order = d.order
        }
        m.data = d
        return m
      },

      globalNavigation(d) {
        const a = d.defaultGlobalNavigation
        if (!a) {
          return
        }
        const b = d.globalNavigation
        if (!b) {
          return a
        }
        return GlobalNavigationDatum.merge(a, b)
      },

      defaultGlobalNavigation(d) {
        const m = new GlobalNavigationDatum()
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

      serviceDeclaration(d) {
        const a = d.defaultServiceDeclaration
        if (!a) {
          return
        }
        const b = d.serviceDeclaration
        if (!b) {
          return a
        }
        return ServiceDeclarationDatum.merge(a, b)
      },

      defaultServiceDeclaration() {
        return new ServiceDeclarationDatum()
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
