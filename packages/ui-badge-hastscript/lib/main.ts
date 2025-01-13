import {type Children, type Component, h} from "@onlyoffice/hastscript"
import type * as E from "@onlyoffice/hastscript/elements.js"
import {clsx} from "clsx"

export interface BadgeProperties extends E.SpanProperties {
  variant?:
    "default" |
    "calm" |
    "critical" |
    "innovative" |
    "neutral" |
    "transparent" |
    "vibrant"
}

export function Badge(p: BadgeProperties, ch: Children): Component {
  const {variant, ...o} = p
  o.class = clsx("badge", variant && `badge_variant_${variant}`, o.class)
  return h("span", o, ch)
}

export function BadgeCaption(p: E.SpanProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("badge__caption", o.class)
  return h("span", o, ch)
}
