import type {JSX} from "preact"
import {h} from "preact"

export function DocumentEditorMirror(
  {children, ...args}: JSX.IntrinsicElements["document-editor-mirror"]
): JSX.Element {
  return <document-editor-mirror {...args}>{children}</document-editor-mirror>
}
