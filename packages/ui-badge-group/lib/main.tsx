import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX} from "preact"

export function BadgeGroup(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("badge-group", o.class)
  return <Elements.Div {...o} />
}
