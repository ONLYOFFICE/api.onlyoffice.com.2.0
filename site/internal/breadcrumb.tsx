import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import * as Ui from "@onlyoffice/ui-kit"
import {Fragment, type JSX, h} from "preact"

export interface BreadcrumbProperties {
  url: string
}

export function Breadcrumb(p: BreadcrumbProperties): JSX.Element {
  const s = Sitemap.shared
  const a: JSX.Element[] = []

  let e = s.find(p.url, "url")

  while (true) {
    while (e && e.type === "group") {
      e = s.find(e.parent, "id")
    }

    if (!e || e.url === "/") {
      break
    }

    a.unshift(<Ui.BreadcrumbCrumb href={e.url}>{e.title}</Ui.BreadcrumbCrumb>)
    e = s.find(e.parent, "id")
  }

  if (a.length === 0) {
    return <></>
  }

  return <Ui.Breadcrumb>{a}</Ui.Breadcrumb>
}
