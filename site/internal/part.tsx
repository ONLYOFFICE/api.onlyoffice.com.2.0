import {
  PartChapter,
  PartChapters,
  PartHelp,
  PartHero,
  Part as SPart,
} from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Help} from "./help.tsx"
import {Icon} from "./icon.tsx"
import {Link} from "./link.tsx"
import {Sitemap} from "./sitemap.ts"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    part?: PartData
  }

  interface EleventyComputed {
    part?(data: Data): PartData | undefined
  }
}

export interface PartData {
  title: string
  description: string
}

export class PartDatum implements PartData {
  title = ""
  description = ""

  static merge(a: PartData, b: PartData): PartData {
    const c = new PartDatum()

    if (b.title) {
      c.title = b.title
    } else if (a.title) {
      c.title = a.title
    }

    if (b.description) {
      c.description = b.description
    } else if (a.description) {
      c.description = a.description
    }

    return c
  }
}

export interface PartParameters {
  sitemapUrl: string
}

export function Part(p: PartParameters): JSX.Element {
  const s = Sitemap.shared
  const e = s.findPageByUrl(p.sitemapUrl)
  const d = e.part

  return <SPart>
    <PartHero>
      <h1>{d.title}</h1>
      <p>{d.description}</p>
    </PartHero>
    <PartChapters>
      <SrOnly><h2>Chapters</h2></SrOnly>
      {e.children.map((id) => {
        const e = s.findPageById(id)
        const d = e.menubar

        return <PartChapter>
          <Icon src="rich32" name={d.icon} height={32} width={32} />
          <Icon src="rich48" name={d.icon} height={48} width={48} />
          <Icon src="rich64" name={d.icon} height={64} width={64} />
          <h3><Link href={d.path}>{d.title}</Link></h3>
          <p>{e.summary}</p>
        </PartChapter>
      })}
    </PartChapters>
    <PartHelp>
      <Help sitemapUrl={p.sitemapUrl} />
    </PartHelp>
  </SPart>
}
