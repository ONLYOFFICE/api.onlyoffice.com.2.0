declare namespace preact {
  import {type TabContainerElement} from "@github/tab-container-element"
  import {type HTMLAttributes} from "preact"

  namespace JSX {
    interface IntrinsicElements {
      "tab-container": HTMLAttributes<TabContainerElement>
    }
  }
}
