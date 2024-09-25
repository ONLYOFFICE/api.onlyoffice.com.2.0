import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {
  PageFooter,
  PageFooterCopyright,
  PageFooterLinkContainer,
  PageFooterThemeSwitcher,
  PageHeader,
  PageHeaderLegacy,
  PageHeaderLogo,
  PageHeaderMenu,
  PageHeaderNavToggler,
  Page as SPage,
  ThemeSwitcher,
  ThemeSwitcherOption,
} from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {OnlyofficeBetaLogo} from "@onlyoffice/ui-logos"
import {type JSX, h} from "preact"
import {GlobalNavigation} from "./global-navigation.tsx"
import {Legacy} from "./legacy.tsx"

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

  return <SPage>
    <PageHeader>
      <SrOnly>
        <h2>Navigation Menu</h2>
      </SrOnly>
      <PageHeaderLogo>
        <a href="/"><OnlyofficeBetaLogo /></a>
      </PageHeaderLogo>
      <PageHeaderMenu>
        <GlobalNavigation current={p.url} />
      </PageHeaderMenu>
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
            return <PageHeaderNavToggler label="Chapter Navigation Toggler" />
          }

          return null
        } catch {
          return null
        }
      })()}
      {/* {d.chapterToggler && <PageHeaderNavToggler label="Chapter Navigation Toggler" />} */}
      <PageHeaderLegacy>
        <Legacy />
      </PageHeaderLegacy>
    </PageHeader>
    <main>
      {p.children}
    </main>
    <PageFooter>
      <SrOnly>
        <h2>Site-wide Links</h2>
      </SrOnly>
      <PageFooterLinkContainer label="Links related to">
        <h3>Get Information</h3>
        <a href="https://www.onlyoffice.com/blog/category/for-developers?from=api" target="_blank">Blog for developers</a>
        <a href="https://www.onlyoffice.com/contribute.aspx?from=api" target="_blank">For contributors</a>
        <a href="https://www.onlyoffice.com/legalterms.aspx?from=api" target="_blank">Legal notice</a>
      </PageFooterLinkContainer>
      <PageFooterLinkContainer label="Links related to">
        <h3>Get Help</h3>
        <a href="https://forum.onlyoffice.com" target="_blank">Forum</a>
        <a href="https://github.com/ONLYOFFICE/" target="_blank">Code on GitHub</a>
        <a href="https://helpcenter.onlyoffice.com/installation/docs-developer-index.aspx?from=api" target="_blank">Installation guides</a>
        <a href="https://www.onlyoffice.com/support-contact-form.aspx?from=api" target="_blank">Support contact form</a>
      </PageFooterLinkContainer>
      <PageFooterThemeSwitcher>
        <ThemeSwitcher>
          <ThemeSwitcherOption value="light">Light</ThemeSwitcherOption>
          <ThemeSwitcherOption value="dark">Dark</ThemeSwitcherOption>
          <ThemeSwitcherOption value="auto">Auto</ThemeSwitcherOption>
        </ThemeSwitcher>
      </PageFooterThemeSwitcher>
      <PageFooterCopyright>
        <a href="https://onlyoffice.com/">onlyoffice.com</a>
        <p>© Ascensio System SIA 2024. All right reserved</p>
      </PageFooterCopyright>
    </PageFooter>
  </SPage>
}
