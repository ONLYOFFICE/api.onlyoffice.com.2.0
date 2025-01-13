import {CodePreview} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"

export default {
  title: "UI Foundation / Code Preview",
} satisfies Meta

export function Default(): JSX.Element {
  return <CodePreview aria-hidden="true">
    <pre><code>const a = {}</code></pre>
  </CodePreview>
}
