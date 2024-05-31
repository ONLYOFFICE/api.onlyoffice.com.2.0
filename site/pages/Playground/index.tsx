import type {Data, Context} from "@onlyoffice/eleventy-types"
import {SitePlayground} from "@onlyoffice/site-playground"
import type {JSX} from "preact"
import {h} from "preact"

export function data(): Data {
  return {
    layout: "blank",
    eleventyExcludeFromCollections: true
  }
}

export function render({config}: Context): JSX.Element {
  return <SitePlayground config={config.playground}/>
}
