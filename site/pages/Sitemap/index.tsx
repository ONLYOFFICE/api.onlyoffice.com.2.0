import { Content } from "@onlyoffice/documentation-ui-kit"
import { TableOfContents } from "@/components/table-of-contents/table-of-contents.ts"
import { retrieve } from "@/config/sitemap.ts"
import type { JSX } from "preact"
import { h } from "preact"

export function data() {
  return {
    layout: "page",
    eleventyExcludeFromCollections: true
  }
}

export function render(): JSX.Element {
  return (
    <Content>
      <TableOfContents url="/" depth={-1} onRetrieve={retrieve} />
    </Content>
  )
}
