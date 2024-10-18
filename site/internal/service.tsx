import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type Declaration} from "@onlyoffice/service-declaration"
import * as Site from "@onlyoffice/site-kit"
import {Fragment, type JSX, h} from "preact"
import {Markdown} from "./markdown.tsx"
import {SyntaxHighlight} from "./syntax-highlight.tsx"
import {TableOfContents} from "./table-of-contents.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    service?: ServiceData
  }

  interface EleventyComputed {
    service?(data: Data): ServiceData | undefined
  }
}

export interface ServiceData {
  declaration: Declaration
}

export class ServiceDatum implements ServiceData {
  // @ts-ignore todo: add noop declaration in the service-declaration package
  declaration: Declaration = {}

  static merge(a: ServiceData, b: ServiceData): ServiceData {
    const d = new ServiceDatum()

    if (b.declaration) {
      d.declaration = b.declaration
    } else if (a.declaration) {
      d.declaration = a.declaration
    }

    return d
  }
}

export interface ServiceProperties {
  url: string
}

export function Service(p: ServiceProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find(p.url, "url")
  if (!e) {
    throw new Error(`Service site entity not found: ${p.url}`)
  }
  if (e.type !== "page") {
    throw new Error(`Service site entity is not a page: ${e.type}`)
  }

  const d = e.data.service
  if (!d) {
    throw new Error(`Service data not found: ${p.url}`)
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
    return <Site.Service declaration={d.declaration}>
      <Site.ServiceHeading for="Authorization">
        <h3>Authorization</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Body">
        <h3>Body</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Cookies">
        <h3>Cookies</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Examples">
        <h3>Examples</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Headers">
        <h3>Headers</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Path">
        <h3>Path</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Query">
        <h3>Query</h3>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Request">
        <h2 id="request">Request</h2>
      </Site.ServiceHeading>
      <Site.ServiceHeading for="Responses">
        <h2 id="responses">Responses</h2>
      </Site.ServiceHeading>
      <Site.ServiceDescription>
        {Markdown}
      </Site.ServiceDescription>
      <Site.ServiceSyntaxHighlight>
        {SyntaxHighlight}
      </Site.ServiceSyntaxHighlight>
    </Site.Service>
  }

  return <></>
}

export function ServiceToc(): JSX.Element {
  return <Site.Toc>
    <Site.TocHeading>In this article</Site.TocHeading>
    <Site.TocList>
      <Site.TocItem>
        <Site.TocLink href="#request">Request</Site.TocLink>
      </Site.TocItem>
      <Site.TocItem>
        <Site.TocLink href="#responses">Responses</Site.TocLink>
      </Site.TocItem>
    </Site.TocList>
  </Site.Toc>
}
