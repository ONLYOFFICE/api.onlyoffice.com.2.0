import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Footer} from "./footer.tsx"
import {Header, HeaderAccessor} from "./header.tsx"

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
  return <HeaderAccessor>
    <Site.Page>
      <Site.PageHeader>
        <Header url={p.url} />
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
  </HeaderAccessor>
}
