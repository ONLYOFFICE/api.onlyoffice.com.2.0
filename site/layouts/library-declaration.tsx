import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {LibraryDeclaration} from "@/internal/library-declaration.tsx"

export function data(): Data {
  return {
    layout: "chapter",
  }
}

export function render(c: Context): JSX.Element {
  return <LibraryDeclaration url={c.page.url} />
}
