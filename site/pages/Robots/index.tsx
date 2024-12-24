import {type Data} from "@onlyoffice/eleventy-types"
import {Config} from "@onlyoffice/site-config"
import {data as postscript} from "../Postscript/index.tsx"
import {data as sitemap} from "../Sitemap/xml.tsx"

export function data(): Data {
  return {
    layout: null,
    permalink: "/robots.txt",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): string {
  const c = Config.shared
  const p = postscript()
  const s = sitemap()

  let r = ""

  if (typeof s.permalink === "string") {
    r += `Sitemap: ${c.baseUrl}`
    r += s.permalink.slice(1)
    r += "\n"
  }

  r += "User-agent: *\n"

  if (!c.robots) {
    r += "Disallow: /\n"
  } else if (typeof p.permalink === "string") {
    r += `Disallow: ${p.permalink}\n`
  }

  return r
}
