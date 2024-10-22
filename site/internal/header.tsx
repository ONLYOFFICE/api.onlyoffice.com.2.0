import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import * as Site from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Menubar, MenubarAccessor} from "./menubar.tsx"

export {HeaderAccessor} from "@onlyoffice/site-kit"

export interface HeaderProperties {
  url: string
}

export function Header(p: HeaderProperties): JSX.Element {
  const s = Sitemap.shared

  return <MenubarAccessor>
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
        <Menubar current={p.url} />
      </Site.HeaderContent>
      <Site.HeaderTrailing />
    </Site.Header>
  </MenubarAccessor>
}
