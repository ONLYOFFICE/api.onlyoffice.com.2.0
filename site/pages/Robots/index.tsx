import type { Eleventy } from "@/config/eleventy.ts"
import { h } from "preact"
import { data as sitemapData } from "../Sitemap/xml.tsx"

export function data() {
  return {
    layout: null,
    permalink: "/robots.txt",
    eleventyExcludeFromCollections: true
  }
}

export function render({ site }: Eleventy.Context): string {
  const sitemap = sitemapData()
  return (
`Sitemap: ${site.baseurl}${sitemap.permalink}
User-agent: *`
  )
}
