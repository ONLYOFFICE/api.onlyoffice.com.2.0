import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type ComponentChild, type JSX, cloneElement, toChildArray} from "preact"

export interface BadgeProperties extends Elements.SpanProperties {
  variant?:
    "default" |
    "calm" |
    "critical" |
    "innovative" |
    "neutral" |
    "transparent" |
    "vibrant"
}

export function Badge(p: BadgeProperties): JSX.Element {
  const {children, variant, ...o} = p
  const c: ComponentChild[] = []

  o.class = clsx("badge", variant && `badge_variant_${variant}`, o.class)

  const a = toChildArray(children)
  for (let e of a) {
    if (typeof e === "object" && e.type === BadgeCaption) {
      e = cloneElement(e, {children: <>{e.props.children}{":"}</>})
      c.unshift(<>{e}{" "}</>)
      continue
    }
    c.push(e)
  }

  return <Elements.Span {...o}>{c}</Elements.Span>
}

export function BadgeCaption(p: Elements.SpanProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("badge__caption", o.class)
  return <Elements.Span {...o} />
}
