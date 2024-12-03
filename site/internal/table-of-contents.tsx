import {Callback} from "@onlyoffice/preact-callback"
import {Fragment, type JSX, h} from "preact"
import {type Entity, GroupEntity, PageEntity, Sitemap} from "./sitemap.ts"

export interface TableOfContentsProperties {
  sitemapUrl: string
  depth?: number
}

export function TableOfContents(p: TableOfContentsProperties): JSX.Element {
  const s = Sitemap.shared
  const {depth = -1} = p
  const e = s.findByUrl(p.sitemapUrl)
  let c = -1
  return <List e={e} />

  function List({e}: {e: Entity}): JSX.Element {
    if (c === depth && depth !== -1 || e.children.length === 0) {
      return <></>
    }
    c += 1
    return <ul>
      {e.children.map((id) => <Item id={id} />)}
      <Callback>{() => {c -= 1}}</Callback>
    </ul>
  }

  function Item({id}: {id: number}): JSX.Element {
    const e = s.findById(id)
    if (e instanceof GroupEntity) {
      return <li>
        <span>{e.title}</span>
        <List e={e} />
      </li>
    }
    if (e instanceof PageEntity) {
      return <li>
        <a href={e.canonicalUrl}>{e.title}</a>
        <List e={e} />
      </li>
    }
    // @ts-expect-error
    throw new Error(`Unexpected entity type: ${e.type}`)
  }
}
