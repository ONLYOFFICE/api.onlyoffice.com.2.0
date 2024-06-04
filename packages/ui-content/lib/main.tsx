import type {JSX} from "preact"
import {h} from "preact"

export interface ContentParameters {
  children: any
}

export function Content({children}: ContentParameters): JSX.Element {
  return <div class="content">{children}</div>
}
