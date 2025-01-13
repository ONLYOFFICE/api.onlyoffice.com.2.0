import {type Children, type Component, h} from "@onlyoffice/hastscript"
import type * as E from "@onlyoffice/hastscript/elements.js"
import {clsx} from "clsx"

export function Glossary(p: E.DlProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("glossary", o.class)
  return h("dl", o, ch)
}

export function GlossaryTerm(p: E.DtProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("glossary__term", o.class)
  return h("dt", o, ch)
}

export function GlossaryName(p: E.SpanProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("glossary__name", o.class)
  return h("span", o, ch)
}

export function GlossaryTail(p: E.SpanProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("glossary__tail", o.class)
  return h("span", o, ch)
}

export function GlossaryDetails(p: E.DdProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("glossary__details", o.class)
  return h("dd", o, ch)
}
