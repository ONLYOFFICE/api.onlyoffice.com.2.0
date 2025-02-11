import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {Article} from "../internal/article.tsx"

export function data(): Data {
  return {
    layout: "chapter",
  }
}

export function render(c: Context): JSX.Element {
  return <Article url={c.page.url}>{c.content}</Article>
}
