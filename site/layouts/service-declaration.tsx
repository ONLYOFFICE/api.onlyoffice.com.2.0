import type {Data, Context} from "@onlyoffice/eleventy-types"
import {ServiceDeclaration} from "@onlyoffice/site-kit"
import {type JSX, Fragment, h} from "preact"
import {Markdown} from "../components/markdown/markdown.ts"
import {SyntaxHighlight} from "../components/syntax-highlight/syntax-highlight.ts"
import {TableOfContents} from "../components/table-of-contents/table-of-contents.ts"
import {retrieve} from "../config/sitemap.ts"

export function data(): Data {
  return {
    layout: "chapter"
  }
}

export function render(ctx: Context): JSX.Element {
  const [d] = ctx.pagination.items

  switch (d.kind) {
  case "group":
    // todo: move to the ServiceDeclaration
    return <TableOfContents url={ctx.page.url} onRetrieve={retrieve} />
  case "request":
    return <ServiceDeclaration
      declaration={d}
      onHighlightSyntax={SyntaxHighlight}
      onRenderDescription={Markdown}
      onRetrieve={ctx.onRetrieve}
    />
  }

  return <></>
}
