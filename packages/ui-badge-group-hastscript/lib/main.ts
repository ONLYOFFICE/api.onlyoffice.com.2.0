import {type Children, type Component, h} from "@onlyoffice/hastscript"
import type * as E from "@onlyoffice/hastscript/elements.js"
import {clsx} from "clsx"

export function BadgeGroup(p: E.DivProperties, ch: Children): Component {
  const {...o} = p
  o.class = clsx("badge-group", o.class)
  return h("div", o, ch)
}
