import type {JSX} from "preact"
import {h} from "preact"

export interface CodeEditorParameters {
  children?: any
}

export function CodeEditor({children}: CodeEditorParameters): JSX.Element {
  return <textarea
    class="code-editor"
    rows={4}
    autocomplete="off"
    autocorrect="off"
    autocapitalize="none"
    spellcheck={false}
  >
    {children}
  </textarea>
}
