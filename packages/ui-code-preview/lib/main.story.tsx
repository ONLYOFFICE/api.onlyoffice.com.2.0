import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import codePreview from "./main.css?inline"
import {CodePreview} from "./main.tsx"

const meta: Meta = {
  title: "UI/Code Preview",
  parameters: {
    styles: [colors, codePreview]
  }
}

export function Composition(): JSX.Element {
  return <CodePreview aria-hidden="true">
    <pre><code>const a = {}</code></pre>
  </CodePreview>
}

export default meta
