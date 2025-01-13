import {type Data} from "@onlyoffice/eleventy-types"
import {Config} from "@onlyoffice/site-config"

export function data(): Data {
  return {
    layout: null,
    virtualPath: "../robots.txt",
    specificPath: "../robots.txt",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): string {
  const c = Config.shared

  // todo: use internal/Sitemap, do not hardcode

  let r = ""

  r += `Sitemap: ${new URL("sitemap.xml", c.baseUrl)}\n`
  r += "User-agent: *\n"

  if (!c.robots) {
    r += "Disallow: /\n"
  } else {
    r += "Disallow: /snapshot/index.html\n"
    r += "Disallow: /snapshot.json\n"
    r += "Disallow: /snapshot.schema.json\n"
  }

  return r
}
