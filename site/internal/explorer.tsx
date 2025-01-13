import {Fragment, type JSX, h} from "preact"
import {Tree, TreeGroup, TreeItem, TreeLink} from "../components/tree/tree.tsx"
import {type Entity, GroupEntity, PageEntity, Sitemap} from "./sitemap.ts"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    explorer?: ExplorerData
  }

  interface EleventyComputed {
    explorer?(data: Data): ExplorerData | undefined
  }
}

export interface ExplorerData {
  title?: string
  url?: string
  blank?: boolean
}

export class ExplorerDatum implements ExplorerData {
  title = ""
  url = ""
  blank = false

  static merge(a: ExplorerData, b: ExplorerData): ExplorerData {
    const e = new ExplorerDatum()

    if (b.title) {
      e.title = b.title
    } else if (a.title) {
      e.title = a.title
    }

    if (b.url) {
      e.url = b.url
    } else if (a.url) {
      e.url = a.url
    }

    if (b.blank) {
      e.blank = b.blank
    } else if (a.blank) {
      e.blank = a.blank
    }

    return e
  }
}

export interface ExplorerProperties {
  sitemapUrl: string
  level: number
}

export function Explorer(p: ExplorerProperties): JSX.Element {
  const s = Sitemap.shared
  const e = s.findRoot(p.sitemapUrl, p.level)

  return <Tree>
    {e.children.map((id) => {
      const e = s.findPageById(id)
      return <TreeGroup>
        <TreeLink href={e.canonicalUrl} active={p.sitemapUrl === e.sitemapUrl}>
          {e.title}
        </TreeLink>
        {e.children.length !== 0 && <Sub e={e} />}
      </TreeGroup>
    })}
  </Tree>

  function Sub({e}: {e: Entity}): JSX.Element | null {
    return <>{e.children.map((id) => {
      const e = s.findById(id)

      if (e instanceof GroupEntity) {
        return <TreeItem expanded={p.sitemapUrl.startsWith(e.sitemapUrl)}>
          <TreeLink href="" active={false}>
            {e.title}
          </TreeLink>
          {e.children.length !== 0 && <Sub e={e} />}
        </TreeItem>
      }

      if (e instanceof PageEntity) {
        const d = e.explorer
        return <TreeItem expanded={p.sitemapUrl.startsWith(e.sitemapUrl)}>
          <TreeLink href={d.url} active={p.sitemapUrl === e.sitemapUrl} blank={d.blank}>
            {d.title}
          </TreeLink>
          {e.children.length !== 0 && <Sub e={e} />}
        </TreeItem>
      }

      throw new Error(`Unknown entity type: ${e}`)
    })}</>
  }
}
