import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX, h} from "preact"

export function Toc(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("toc", o.class)

  return <toc-container>
    <Elements.Div {...o} />
  </toc-container>
}

export function TocHeading(p: Elements.H2Properties): JSX.Element {
  const {...o} = p
  o.class = clsx("toc__heading", o.class)
  return <Elements.H2 {...o} />
}

export function TocList(p: Elements.UlProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("toc__list", o.class)
  return <Elements.Ul {...o} />
}

export function TocItem(p: Elements.LiProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("toc__item", o.class)
  return <Elements.Li {...o} />
}

export function TocLink(p: Elements.AProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("toc__link", o.class)
  return <Elements.A {...o} />
}
