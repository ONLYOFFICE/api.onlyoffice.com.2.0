import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {Library} from "@/internal/library.tsx"
import {isWritten} from "../internal/url.ts"

export function data(): Data {
  return {
    layout: "article",
  }
}

export function render(c: Context): JSX.Element {
  if (!isWritten(c)) {
    return <div>This page should not be rendered</div>
  }

  const u = c.sitemapUrl

  if (!u) {
    throw new Error("Missing sitemap URL")
  }

  return <Library sitemapUrl={u} />
}
