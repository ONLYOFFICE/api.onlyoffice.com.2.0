import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX, h} from "preact"

export function Chapter(p: Elements.DivProperties): JSX.Element {
  const {children, ...o} = p
  o.class = clsx("chapter", o.class)
  return <chapter-container>
    <Elements.Div {...o}>{children}</Elements.Div>
  </chapter-container>
}

export function ChapterNavigation(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("chapter__navigation", o.class)
  return <Elements.Div {...o} />
}

export function ChapterContent(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("chapter__content", o.class)
  return <Elements.Div {...o} />
}
