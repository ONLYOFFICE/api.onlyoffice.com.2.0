import * as Ui from "@onlyoffice/ui-kit"
import {Fragment, type JSX, h} from "preact"
import {type Entity, GroupEntity, Sitemap} from "./sitemap.ts"

export interface BreadcrumbProperties {
  sitemapUrl: string
}

export function Breadcrumb(p: BreadcrumbProperties): JSX.Element {
  const s = Sitemap.shared
  const b: JSX.Element[] = []

  let e: Entity = s.findPageByUrl(p.sitemapUrl)

  while (true) {
    while (e instanceof GroupEntity) {
      e = s.findById(e.parentId)
    }

    if (e.isRoot) {
      break
    }

    const c = <Ui.BreadcrumbCrumb href={e.canonicalUrl}>
      {e.title}
    </Ui.BreadcrumbCrumb>

    b.unshift(c)
    e = s.findById(e.parentId)
  }

  if (b.length === 0) {
    return <></>
  }

  return <Ui.Breadcrumb>{b}</Ui.Breadcrumb>
}
