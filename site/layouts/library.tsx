import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {Library} from "@/internal/library.tsx"

export function data(): Data {
  return {
    layout: "chapter",
  }
}

export function render(c: Context): JSX.Element {
  return <Library url={c.page.url} />
}
