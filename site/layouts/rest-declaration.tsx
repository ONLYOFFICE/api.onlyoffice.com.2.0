import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { Fragment, h } from "preact"
import { RESTDeclaration } from "../components/rest-declaration/rest-declaration.ts"
import { Markdown } from "../components/markdown/markdown.ts"
import { SyntaxHighlight } from "../components/syntax-highlight/syntax-highlight.ts"
import { TableOfContents } from "../components/table-of-contents/table-of-contents.ts"
import type { Eleventy } from "../config/eleventy.ts"
import { retrieve } from "../config/sitemap.ts"

export function data() {
  return {
    layout: "chapter"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  return (
    <Content>
      {ctx.pagination.items.map((d) => {
        switch (d.kind) {
        case "group":
          return (
            <>
              <h1>{d.title}</h1>
              <TableOfContents url={ctx.page.url} onRetrieve={retrieve} />
            </>
          )
        case "request":
          return (
            <RESTDeclaration
              declaration={d}
              onHighlightSyntax={SyntaxHighlight}
              onRenderDescription={Markdown}
              onRetrieve={ctx.onRetrieve}
            />
          )
        default:
          return ""
        }
      })}
    </Content>
  )
}
