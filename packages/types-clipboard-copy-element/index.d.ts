declare namespace preact {
  import {type ClipboardCopyElement} from "@github/clipboard-copy-element"
  import {type HTMLAttributes} from "preact"

  namespace JSX {
    interface IntrinsicElements {
      "clipboard-copy": HTMLAttributes<ClipboardCopyElement>
    }
  }
}
