import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {Page} from "../internal/page.tsx"

export function data(): Data {
  return {
    layout: "html",
  }
}

export function render(c: Context): JSX.Element {
  if (!c.isWritten) {
    return <div>This page should not be rendered</div>
  }

  const u = c.sitemapUrl

  if (!u) {
    throw new Error("Missing sitemap URL")
  }

  return <Page sitemapUrl={u}>{c.content}</Page>
}
