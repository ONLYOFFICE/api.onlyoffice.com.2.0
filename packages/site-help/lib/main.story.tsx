import {GithubIcon} from "@onlyoffice/ui-icons/rich/24.tsx"
import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Help} from "./main.tsx"

const meta: Meta = {
  title: "Site/Help"
}

export function Default(): JSX.Element {
  return <Help>
    <GithubIcon width={24} height={24} />
    <h2>Get Help</h2>
    <ul>
      <li>If you have any questions about ONLYOFFICE DocSpace, try the <a href="/">FAQ</a> section first.</li>
      <li>You can request a feature or report a bug by posting an issue on <a href="/">GitHub</a>.</li>
      <li>You can also ask our developers on <a href="/">ONLYOFFICE forum</a> (registration required).</li>
    </ul>
  </Help>
}

export default meta
