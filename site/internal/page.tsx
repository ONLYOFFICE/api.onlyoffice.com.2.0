import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Footer} from "./footer.tsx"
import {GlobalNavigation} from "./global-navigation.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    document?: PageData
  }

  interface EleventyComputed {
    document?(data: Data): PageData | undefined
  }
}

export interface PageData {
  chapterToggler?: boolean
}

export class PageDatum implements PageData {
  chapterToggler = false

  static merge(a: PageData, b: PageData): PageData {
    const c = new PageDatum()

    if (b.chapterToggler) {
      c.chapterToggler = b.chapterToggler
    } else if (a.chapterToggler) {
      c.chapterToggler = a.chapterToggler
    }

    return c
  }
}

export interface PageProperties extends ChildrenIncludable {
  url: string
}

export function Page(p: PageProperties): JSX.Element {
  // const s = Sitemap.shared

  // const e = s.find(p.url, "url")
  // if (!e) {
  //   throw new Error(`Entity not found: ${p.url}`)
  // }
  // if (e.type !== "page") {
  //   throw new Error(`Current entity is not a page: ${e.type} (${p.url})`)
  // }

  // const d = e.data.document
  // if (!d) {
  //   throw new Error(`Page data not found: ${e.url}`)
  // }

  return <Site.HeaderAccessor>
    <Site.Page>
      <Site.PageHeader>
        <Site.MenubarAccessor>
          <Site.Header>
            <SrOnly>
              <h2>Navigation Menu</h2>
            </SrOnly>
            <Site.HeaderLeading>
              <a href="/">
                <Site.Logo />
              </a>
              {(() => {
                // todo: A few pages utilize the eleventyExcludeFromCollections
                // property. This property, when present, excludes the page from the
                // Sitemap. Currently, we can not remove this property as some of the
                // page formation logic depends on it.

                try {
                  const s = Sitemap.shared

                  const e = s.find(p.url, "url")
                  if (!e) {
                    throw new Error(`Entity not found: ${p.url}`)
                  }
                  if (e.type !== "page") {
                    throw new Error(`Current entity is not a page: ${e.type} (${p.url})`)
                  }

                  const d = e.data.document
                  if (!d) {
                    throw new Error(`Page data not found: ${e.url}`)
                  }

                  if (d.chapterToggler) {
                    return <Site.PageHeaderNavToggler label="Chapter Navigation Toggler" />
                  }

                  return null
                } catch {
                  return null
                }
              })()}
              {/* {d.chapterToggler && <PageHeaderNavToggler label="Chapter Navigation Toggler" />} */}
            </Site.HeaderLeading>
            <Site.HeaderContent>
              <GlobalNavigation current={p.url} />
            </Site.HeaderContent>
            <Site.HeaderTrailing />
          </Site.Header>
        </Site.MenubarAccessor>
      </Site.PageHeader>
      <Site.PageContent>
        <main>
          {p.children}
        </main>
      </Site.PageContent>
      <Site.PageFooter>
        <Footer />
      </Site.PageFooter>
    </Site.Page>
  </Site.HeaderAccessor>
}
