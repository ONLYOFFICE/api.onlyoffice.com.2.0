import type {HTMLAttributes} from "preact/compat"
import type {JSX} from "preact"
import {h} from "preact"

export interface CodeEditorParameters extends HTMLAttributes<HTMLTextAreaElement> {
  children?: any
}

export function CodeEditor({children, ...props}: CodeEditorParameters): JSX.Element {
  return <textarea
    class="code-editor"
    rows={4}
    autocomplete="off"
    autocorrect="off"
    autocapitalize="none"
    spellcheck={false}
    {...props}
  >
    {children}
  </textarea>
}
