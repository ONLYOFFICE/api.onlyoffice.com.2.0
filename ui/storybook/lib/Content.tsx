import type { JSX } from "preact"
import { h } from "preact"
import "./content.css"

export interface RootParameters {
  children: any
}

export function Root(
  {
    children
  }: RootParameters
): JSX.Element {
  return (
    <div class="storybook-content">
      {children}
    </div>
  )
}
