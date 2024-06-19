import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { TableOfContents } from "../components/table-of-contents/table-of-contents.ts"
import type { Eleventy } from "../config/eleventy.ts"
import { useChildren } from "../config/eleventy.ts"
import { retrieve } from "../config/sitemap.ts"

export function data() {
  return {
    layout: "article"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const children = useChildren(ctx)
  return (
    <>
      {children}
      <TableOfContents url={ctx.page.url} onRetrieve={retrieve} />
    </>
  )
}
