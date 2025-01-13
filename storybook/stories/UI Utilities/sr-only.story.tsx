import {SrOnly} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {Fragment, type JSX, h} from "preact"

export default {
  title: "UI Utilities / Screen Reader Only",
} satisfies Meta

export function Composition(): JSX.Element {
  return <>
    <p>The paragraph below should be hidden from sight, but still read by screen readers.</p>
    <SrOnly>
      <p>This paragraph should be hidden from sight, but still read by screen readers.</p>
    </SrOnly>
  </>
}
