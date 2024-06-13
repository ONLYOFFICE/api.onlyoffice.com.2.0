import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {Fragment, h} from "preact"
import srOnly from "./main.css?inline"
import {SrOnly} from "./main.tsx"

const meta: Meta = {
  title: "UI/Screen Reader Only",
  parameters: {styles: [srOnly]}
}

export function Composition(): JSX.Element {
  return <>
    <p>The paragraph below should be hidden from sight, but still read by screen readers.</p>
    <SrOnly>
      <p>This paragraph should be hidden from sight, but still read by screen readers.</p>
    </SrOnly>
  </>
}

export default meta
