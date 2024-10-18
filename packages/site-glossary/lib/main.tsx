import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX, h} from "preact"

export function Glossary(p: Elements.DlProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("glossary", o.class)
  return <Elements.Dl {...o} />
}

export function GlossaryTerm(p: Elements.DtProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("glossary__term", o.class)
  return <Elements.Dt {...o} />
}

export function GlossaryName(p: Elements.SpanProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("glossary__name", o.class)
  return <Elements.Span {...o} />
}

export function GlossaryDetails(p: Elements.DdProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("glossary__details", o.class)
  return <Elements.Dd {...o} />
}
