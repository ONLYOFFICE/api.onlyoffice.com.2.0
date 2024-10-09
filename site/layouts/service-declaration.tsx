import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {type JSX, h} from "preact"
import {ServiceDeclaration} from "@/internal/service-declaration.tsx"

export function data(): Data {
  return {
    layout: "chapter",
  }
}

export function render(c: Context): JSX.Element {
  return <ServiceDeclaration url={c.page.url} />
}
