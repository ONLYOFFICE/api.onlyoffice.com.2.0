import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {
  Part as SPart,
  PartChapter,
  PartChapters,
  PartHelp,
  PartHero,
} from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Help} from "./help.tsx"
import {Icon} from "./icon.tsx"
import {Link} from "./link.tsx"

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
  current: string
}

export function Part(p: PartParameters): JSX.Element {
  const s = Sitemap.shared

  const e = s.find(p.current, "url")
  if (!e) {
    throw new Error(`Entity not found: ${p.current}`)
  }
  if (e.type !== "page") {
    throw new Error(`Entity is not a page: ${p.current}`)
  }

  const d = e.data.part
  if (!d) {
    throw new Error(`Part data not found: ${e.id} (${e.url})`)
  }

  return <SPart>
    <PartHero>
      <h1>{d.title}</h1>
      <p>{d.description}</p>
    </PartHero>
    <PartChapters>
      <SrOnly><h2>Chapters</h2></SrOnly>
      {e.children.map((id) => {
        const e = s.find(id, "id")
        if (!e) {
          throw new Error(`Entity not found: ${id}`)
        }
        if (e.type !== "page") {
          throw new Error(`Entity is not a page: ${id}`)
        }

        const n = e.data.globalNavigation
        if (!n) {
          throw new Error(`Global navigation data not found: ${id}`)
        }

        return <PartChapter>
          <Icon src="rich64" name={n.icon} height={64} width={64} />
          <h3><Link href={n.path}>{n.title}</Link></h3>
          <p>{e.data.summary}</p>
        </PartChapter>
      })}
    </PartChapters>
    <PartHelp>
      <Help current={p.current} />
    </PartHelp>
  </SPart>
}
