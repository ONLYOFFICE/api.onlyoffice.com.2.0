import type {HTMLAttributes} from "preact/compat"
import {type JSX, h} from "preact"

export interface CodePreviewParameters extends HTMLAttributes<HTMLDivElement> {
  children?: any
}

export function CodePreview({children, ...a}: CodePreviewParameters): JSX.Element {
  return <div class="code-preview" {...a}>{children}</div>
}
