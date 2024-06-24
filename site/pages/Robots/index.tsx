import type {Context, Data} from "@onlyoffice/eleventy-types"
import {h} from "preact"
import {data as sitemap} from "../Sitemap/xml.tsx"

export function data(): Data {
  return {
    layout: null,
    permalink: "/robots.txt",
    eleventyExcludeFromCollections: true
  }
}

export function render({config}: Context): string {
  const s = sitemap()
  return `Sitemap: ${config.baseUrl}${s.permalink}\nUser-agent: *`
}
