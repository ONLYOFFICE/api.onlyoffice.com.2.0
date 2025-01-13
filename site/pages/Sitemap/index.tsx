import {type Data} from "@onlyoffice/eleventy-types"
import {Content} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {TableOfContents} from "@/internal/table-of-contents.tsx"

export function data(): Data {
  return {
    layout: "page",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): JSX.Element {
  return <Content>
    <TableOfContents sitemapUrl="/" />
  </Content>
}
