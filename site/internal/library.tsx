import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import {type Declaration} from "@onlyoffice/library-declaration"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Markdown} from "./markdown.tsx"
import {SyntaxHighlight} from "./syntax-highlight.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    library?: LibraryData
  }

  interface EleventyComputed {
    library?(data: Data): LibraryData | undefined
  }
}

export interface LibraryData {
  declaration: Declaration
  onLink: Site.LibraryProperties["onLink"]
  onRetrieve: Site.LibraryProperties["onRetrieve"]
}

export class LibraryDatum implements LibraryData {
  /* eslint-disable unicorn/no-useless-undefined */
  // @ts-ignore todo: add noop declaration similar to the service declaration
  declaration: Declaration = {}
  onLink: Site.LibraryProperties["onLink"] = () => ""
  onRetrieve: Site.LibraryProperties["onRetrieve"] = () => undefined
  /* eslint-enable unicorn/no-useless-undefined */

  static merge(a: LibraryData, b: LibraryData): LibraryData {
    const d = new LibraryDatum()

    if (b.declaration) {
      d.declaration = b.declaration
    } else if (a.declaration) {
      d.declaration = a.declaration
    }

    if (b.onLink) {
      d.onLink = b.onLink
    } else if (a.onLink) {
      d.onLink = a.onLink
    }

    if (b.onRetrieve) {
      d.onRetrieve = b.onRetrieve
    } else if (a.onRetrieve) {
      d.onRetrieve = a.onRetrieve
    }

    return d
  }
}

export interface LibraryProperties {
  url: string
}

export function Library(p: LibraryProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find(p.url, "url")
  if (!e) {
    throw new Error(`Library site entity not found: ${p.url}`)
  }
  if (e.type !== "page") {
    throw new Error(`Library site entity is not a page: ${e.type}`)
  }

  const d = e.data.library
  if (!d) {
    throw new Error(`Library data not found: ${p.url}`)
  }

  return <Site.Library {...d}>
    <Site.LibraryHeading for="Constructors">
      <h2>Constructors</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Description">
      <h2>Description</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Events">
      <h2>Events</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Examples">
      <h2>Examples</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Extends By">
      <h2>Extends By</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Extends">
      <h2>Extends</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Instance Methods">
      <h2>Instance Methods</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Instance Properties">
      <h2>Instance Properties</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Overloads By">
      <h2>Overloads By</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Overloads">
      <h2>Overloads</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Parameters">
      <h2>Parameters</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Properties">
      <h2>Properties</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Returns">
      <h2>Returns</h2>
    </Site.LibraryHeading>
    <Site.LibraryHeading for="Try It">
      <h2>Try It</h2>
    </Site.LibraryHeading>
    <Site.LibraryDescription>
      {Markdown}
    </Site.LibraryDescription>
    <Site.LibrarySyntaxHighlight>
      {SyntaxHighlight}
    </Site.LibrarySyntaxHighlight>
  </Site.Library>
}
