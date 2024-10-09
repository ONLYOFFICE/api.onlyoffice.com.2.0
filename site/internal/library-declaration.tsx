import {Sitemap} from "@onlyoffice/eleventy-sitemap"
import * as Site from "@onlyoffice/site-kit"
import {type JSX, h} from "preact"
import {Markdown} from "./markdown.tsx"
import {SyntaxHighlight} from "./syntax-highlight.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    libraryDeclaration?: LibraryDeclarationData
  }

  interface EleventyComputed {
    libraryDeclaration?(data: Data): LibraryDeclarationData | undefined
  }
}

export interface LibraryDeclarationData {
  declaration: Site.LibraryDeclarationProperties["declaration"]
  onLink: Site.LibraryDeclarationProperties["onLink"]
  onRetrieve: Site.LibraryDeclarationProperties["onRetrieve"]
}

export class LibraryDeclarationDatum implements LibraryDeclarationData {
  /* eslint-disable unicorn/no-useless-undefined */
  // @ts-ignore todo: add noop declaration similar to the service declaration
  declaration: Site.LibraryDeclarationProperties["declaration"] = {}
  onLink: Site.LibraryDeclarationProperties["onLink"] = () => undefined
  onRetrieve: Site.LibraryDeclarationProperties["onRetrieve"] = () => undefined
  /* eslint-enable unicorn/no-useless-undefined */

  static merge(
    a: LibraryDeclarationData,
    b: LibraryDeclarationData,
  ): LibraryDeclarationData {
    const d = new LibraryDeclarationDatum()

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

export interface LibraryDeclarationProperties {
  url: string
}

export function LibraryDeclaration(p: LibraryDeclarationProperties): JSX.Element {
  const s = Sitemap.shared

  const e = s.find(p.url, "url")
  if (!e) {
    throw new Error(`Library Declaration site entity not found: ${p.url}`)
  }
  if (e.type !== "page") {
    throw new Error(`Library Declaration site entity is not a page: ${e.type}`)
  }

  const d = e.data.libraryDeclaration
  if (!d) {
    throw new Error(`Library Declaration data not found: ${p.url}`)
  }

  return <Site.LibraryDeclaration {...d}>
    <Site.LibraryDeclarationHeading for="Constructors">
      <h2>Constructors</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Description">
      <h2>Description</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Events">
      <h2>Events</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Examples">
      <h2>Examples</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Extends By">
      <h2>Extends By</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Extends">
      <h2>Extends</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Instance Methods">
      <h2>Instance Methods</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Instance Properties">
      <h2>Instance Properties</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Overloads By">
      <h2>Overloads By</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Overloads">
      <h2>Overloads</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Parameters">
      <h2>Parameters</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Properties">
      <h2>Properties</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Returns">
      <h2>Returns</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationHeading for="Try It">
      <h2>Try It</h2>
    </Site.LibraryDeclarationHeading>
    <Site.LibraryDeclarationDescription>
      {Markdown}
    </Site.LibraryDeclarationDescription>
    <Site.LibraryDeclarationSyntaxHighlight>
      {SyntaxHighlight}
    </Site.LibraryDeclarationSyntaxHighlight>
  </Site.LibraryDeclaration>
}
