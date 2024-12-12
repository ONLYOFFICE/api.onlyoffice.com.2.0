import * as Site from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Menubar, MenubarAccessor} from "./menubar.tsx"
import {Sitemap} from "./sitemap.ts"

export {HeaderAccessor} from "@onlyoffice/site-kit"

export interface HeaderProperties {
  sitemapUrl: string
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
            const e = s.findPageByUrl(p.sitemapUrl)
            const d = e.document

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
        <Menubar sitemapUrl={p.sitemapUrl} />
      </Site.HeaderContent>
      <Site.HeaderTrailing />
    </Site.Header>
  </MenubarAccessor>
}
