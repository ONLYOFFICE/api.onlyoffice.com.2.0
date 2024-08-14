import {type Meta} from "@storybook/preact"
import {Fragment, type JSX, h} from "preact"
import {SrOnly} from "./main.tsx"

export default {
  title: "UI/Screen Reader Only",
} satisfies Meta

export function Composition(): JSX.Element {
  return <>
    <p>The paragraph below should be hidden from sight, but still read by screen readers.</p>
    <SrOnly>
      <p>This paragraph should be hidden from sight, but still read by screen readers.</p>
    </SrOnly>
  </>
}
