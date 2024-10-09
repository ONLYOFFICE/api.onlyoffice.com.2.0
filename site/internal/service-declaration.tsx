import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type Declaration} from "@onlyoffice/service-declaration"
import * as Site from "@onlyoffice/site-kit"
import {Fragment, type JSX, h} from "preact"
import {Markdown} from "./markdown.tsx"
import {SyntaxHighlight} from "./syntax-highlight.tsx"
import {TableOfContents} from "./table-of-contents.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    serviceDeclaration?: ServiceDeclarationData
  }

  interface EleventyComputed {
    serviceDeclaration?(data: Data): ServiceDeclarationData | undefined
  }
}

export interface ServiceDeclarationData {
  declaration: Declaration
}

export class ServiceDeclarationDatum implements ServiceDeclarationData {
  // @ts-ignore todo: add noop declaration in the service-declaration package
  declaration: Declaration = {}

  static merge(
    a: ServiceDeclarationData,
    b: ServiceDeclarationData,
  ): ServiceDeclarationData {
    const d = new ServiceDeclarationDatum()

    if (b.declaration) {
      d.declaration = b.declaration
    } else if (a.declaration) {
      d.declaration = a.declaration
    }

    return d
  }
}

export interface ServiceDeclarationProperties {
  url: string
}

export function ServiceDeclaration(p: ServiceDeclarationProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find(p.url, "url")
  if (!e) {
    throw new Error(`Service Declaration site entity not found: ${p.url}`)
  }
  if (e.type !== "page") {
    throw new Error(`Service Declaration site entity is not a page: ${e.type}`)
  }

  const d = e.data.serviceDeclaration
  if (!d) {
    throw new Error(`Service Declaration data not found: ${p.url}`)
  }

  if (d.declaration.type === "group") {
    return <>
      {d.declaration.description && <Markdown>
        {d.declaration.description}
      </Markdown>}
      <TableOfContents url={e.url} depth={1} />
    </>
  }

  if (d.declaration.type === "operation") {
    return <Site.ServiceDeclaration declaration={d.declaration}>
      <Site.ServiceDeclarationHeading for="Authorization">
        <h3>Authorization</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Body">
        <h3>Body</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Cookies">
        <h3>Cookies</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Examples">
        <h3>Examples</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Headers">
        <h3>Headers</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Path">
        <h3>Path</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Query">
        <h3>Query</h3>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Request">
        <h2>Request</h2>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationHeading for="Responses">
        <h2>Responses</h2>
      </Site.ServiceDeclarationHeading>
      <Site.ServiceDeclarationDescription>
        {Markdown}
      </Site.ServiceDeclarationDescription>
      <Site.ServiceDeclarationSyntaxHighlight>
        {SyntaxHighlight}
      </Site.ServiceDeclarationSyntaxHighlight>
    </Site.ServiceDeclaration>
  }

  return <></>
}
