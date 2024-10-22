import {Sitemap, type SitemapEntity} from "@onlyoffice/eleventy-sitemap"
import {Fragment, type JSX, h} from "preact"
import {Tree, TreeGroup, TreeItem, TreeLink} from "../components/tree/tree.tsx"

export interface ExplorerProperties {
  level: number
  url: string
}

export function Explorer(p: ExplorerProperties): JSX.Element {
  const s = Sitemap.shared

  let l = p.level
  let e = s.find("/", "url")
  while (true) {
    if (!e || l === 0) {
      break
    }
    for (const id of e.children) {
      const c = s.find(id, "id")
      if (!c) {
        continue
      }
      let u = ""
      if (c.type === "group") {
        const b = s.find(c.parent, "id")
        if (!b || b.type !== "page") {
          continue
        }
        u = b.url
      } else if (c.type === "page") {
        u = c.url
      } else {
        // @ts-expect-error
        throw new Error(`Unexpected entity type: ${c.type}`)
      }
      if (p.url.startsWith(u)) {
        e = c
        l -= 1
        break
      }
    }
  }

  if (!e) {
    return <></>
  }

  return <Tree>
    {e.children.map((id) => {
      const e = s.find(id, "id")
      if (!e || e.type !== "page") {
        return null
      }
      return <TreeGroup>
        <TreeLink href={e.url} active={p.url === e.url}>{e.title}</TreeLink>
        <Sub e={e} />
      </TreeGroup>
    })}
  </Tree>

  function Sub({e}: {e: SitemapEntity}): JSX.Element | null {
    return <>{e.children.map((id) => {
      const e = s.find(id, "id")
      if (!e) {
        return null
      }
      if (e.type === "group") {
        if (e.children.length === 0) {
          return null
        }
        const r = s.find(e.parent, "id")
        if (!r) {
          return null
        }
        if (r.type !== "page") {
          throw new Error(`Nested group is not supported: ${e.id}`)
        }
        const b = s.find(p.url, "url")
        if (!b) {
          return null
        }
        return <TreeItem expanded={e.children.includes(b.id)}>
          <TreeLink href="" active={false}>{e.title}</TreeLink>
          <Sub e={e} />
        </TreeItem>
      }
      if (e.type === "page") {
        return <TreeItem expanded={p.url.startsWith(e.url)}>
          <TreeLink href={e.url} active={p.url === e.url} blank={e.data.blank}>{e.title}</TreeLink>
          {e.children.length !== 0 && <Sub e={e} />}
        </TreeItem>
      }
      // @ts-expect-error
      throw new Error(`Unexpected entity type: ${e.type}`)
    })}</>
  }
}
