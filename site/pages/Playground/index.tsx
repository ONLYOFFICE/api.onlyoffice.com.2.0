import type {Data, Context} from "@onlyoffice/eleventy-types"
import {SiteDocumentEditorPlayground} from "@onlyoffice/site-document-editor-playground"
import type {JSX} from "preact"
import {h} from "preact"

export function data(): Data {
  return {
    layout: "blank",
    eleventyExcludeFromCollections: true
  }
}

export function render({config}: Context): JSX.Element {
  return <SiteDocumentEditorPlayground config={config.playground} />
}
