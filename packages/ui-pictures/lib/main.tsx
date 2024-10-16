import * as Elements from "@onlyoffice/preact-elements"
import {SpikyWow} from "@onlyoffice/ui-mascots"
import {clsx} from "clsx"
import {type JSX, h} from "preact"
import {Picture404Overflow, Picture404Underflow} from "../dist/main.tsx"

export interface Picture404Properties extends Omit<Elements.DivProperties, "size"> {
  label?: string
  size?: "default" | "small" | "medium" | "large"
}

export function Picture404(p: Picture404Properties): JSX.Element {
  const {label, size, ...o} = p

  if (label) {
    o["aria-label"] = label
  } else {
    o["aria-label"] = "Picture of a 404 error"
  }

  o.class = clsx("picture-404", size && `picture-404_size_${size}`, o.class)

  return <Elements.Div {...o}>
    <Picture404Underflow width={587} />
    <SpikyWow width={165} />
    <Picture404Overflow width={587} />
  </Elements.Div>
}
