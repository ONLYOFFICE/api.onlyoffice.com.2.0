import type {Data, Context} from "@onlyoffice/eleventy-types"
import {type JSX, Fragment, h} from "preact"
import {list} from "@/config/sitemap.ts"

export function data(): Data {
  return {
    permalink: "/sitemap.xml",
    layout: "xml",
    eleventyExcludeFromCollections: true
  }
}

export function render({config}: Context): JSX.Element {
  return <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    {list().map((p) => {
      if (p.url === undefined) {
        return <></>
      }
      return <url>
        <loc>{config.baseUrl}{p.url}</loc>
        <lastmod>{p.date.toISOString()}</lastmod>
      </url>
    })}
  </urlset>
}
