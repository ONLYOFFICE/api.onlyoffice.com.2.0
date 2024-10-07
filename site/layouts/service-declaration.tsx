import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type Declaration} from "@onlyoffice/service-declaration"
import {
  ServiceDeclaration,
  ServiceDeclarationDescription,
  ServiceDeclarationSyntaxHighlight,
} from "@onlyoffice/site-kit"
import {Fragment, type JSX, h} from "preact"
import {Markdown} from "@/internal/markdown.tsx"
import {SyntaxHighlight} from "@/internal/syntax-highlight.tsx"
import {TableOfContents} from "@/internal/table-of-contents.tsx"

export function data(): Data {
  return {
    layout: "chapter",
  }
}

export function render(c: Context): JSX.Element {
  if (!c.pagination || !c.pagination.items) {
    throw new Error("No pagination")
  }

  const [d]: Declaration[] = c.pagination.items

  switch (d.type) {
  case "group":
    return <>
      {d.description && <Markdown>{d.description}</Markdown>}
      <TableOfContents url={c.page.url} depth={1} />
    </>
  case "operation":
    return <ServiceDeclaration declaration={d}>
      <ServiceDeclarationDescription>
        {Markdown}
      </ServiceDeclarationDescription>
      <ServiceDeclarationSyntaxHighlight>
        {SyntaxHighlight}
      </ServiceDeclarationSyntaxHighlight>
    </ServiceDeclaration>
  }

  // @ts-expect-error
  throw new Error(`Unknown declaration type: ${d.type}`)
}
