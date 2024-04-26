import {Content} from "@onlyoffice/documentation-ui-kit"
import type {JSX} from "preact"
import {h} from "preact"
import {CodeDeclaration} from "../components/code-declaration/code-declaration.ts"
import {Markdown} from "../components/markdown/markdown.ts"
import {SyntaxHighlight} from "../components/syntax-highlight/syntax-highlight.ts"
import type {Eleventy} from "../config/eleventy.ts"
import {render as ChapterLayout} from "./chapter.tsx"

export function data() {
  return {
    layout: "html"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const d = ctx.pagination.items[0]
  return (
    <ChapterLayout {...ctx}>
      <Content>
        <CodeDeclaration
          declaration={d}
          onHighlightSyntax={SyntaxHighlight}
          onLink={ctx.onLink}
          onProcessMarkdown={Markdown}
          onRetrieve={ctx.onRetrieve}
        />
      </Content>
    </ChapterLayout>
  )
}
