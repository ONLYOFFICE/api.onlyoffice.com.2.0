import type { Eleventy } from "@/config/eleventy.ts"
import { list } from "@/config/sitemap.ts"
import type { JSX } from "preact"
import { Fragment, h } from "preact"

export function data() {
  return {
    permalink: "/sitemap.xml",
    layout: "xml",
    eleventyExcludeFromCollections: true
  }
}

export function render({config}: Eleventy.Context): JSX.Element {
  return (
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      {list().map((p) => {
        if (p.url === undefined) {
          return <></>
        }
        return (
          <url>
            <loc>{config.baseUrl}{p.url}</loc>
            <lastmod>{p.date.toISOString()}</lastmod>
          </url>
        )
      })}
    </urlset>
  )
}
