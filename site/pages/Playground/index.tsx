import type {Context} from "@onlyoffice/eleventy-types"
import {SitePlayground} from "@onlyoffice/site-playground"
import type {JSX} from "preact"
import {h} from "preact"

export function data(): unknown {
  return {
    layout: "blank"
  }
}

export function render(ctx: Context): JSX.Element {
  return <SitePlayground config={ctx.playground}/>
}
