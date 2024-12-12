import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {Service} from "@/internal/service.tsx"

export function data(): Data {
  return {
    layout: "article",
  }
}

export function render(c: Context): JSX.Element {
  const u = c.sitemapUrl

  if (!u) {
    throw new Error("Missing sitemap URL")
  }

  return <Service sitemapUrl={u} />
}
