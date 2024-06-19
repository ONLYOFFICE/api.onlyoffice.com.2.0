import { Content } from "@onlyoffice/documentation-ui-kit"
import type { JSX } from "preact"
import { h } from "preact"
import type { Eleventy } from "../config/eleventy.ts"
import { useChildren } from "../config/eleventy.ts"

export function data() {
  return {
    layout: "chapter"
  }
}

export function render(ctx: Eleventy.Context): JSX.Element {
  const children = useChildren(ctx)
  return (
    <Content>
      {ctx.title && <h1>{ctx.title}</h1>}
      {children}
    </Content>
  )
}
