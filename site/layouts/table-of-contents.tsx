import {type Context, type Data} from "@onlyoffice/eleventy-types"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import {TableOfContents} from "@internal/table-of-contents.ts"

export function data(): Data {
  return {
    layout: "chapter"
  }
}

export function render(ctx: Context): JSX.Element {
  return (
    <>
      {ctx.content}
      <TableOfContents url={ctx.page.url} />
    </>
  )
}
