import type {Data} from "@onlyoffice/eleventy-types"
import {Content} from "@onlyoffice/documentation-ui-kit"
import {type JSX, h} from "preact"
import {TableOfContents} from "@/components/table-of-contents/table-of-contents.ts"
import {retrieve} from "@/config/sitemap.ts"

export function data(): Data {
  return {
    layout: "page",
    eleventyExcludeFromCollections: true
  }
}

export function render(): JSX.Element {
  return <Content>
    <TableOfContents url="/" depth={-1} onRetrieve={retrieve} />
  </Content>
}
