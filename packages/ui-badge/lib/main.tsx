import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, h} from "preact"

export interface BadgeProperties extends ChildrenIncludable {
  variant?: "danger" | "default" | "support"
}

export function Badge({children, variant}: BadgeProperties): JSX.Element {
  return <span class={cls()}>{children}</span>

  function cls(): string {
    let s = "badge"
    switch (variant) {
    case "danger":
      s += " badge_danger"
      break
    case "default":
      break
    case "support":
      s += " badge_support"
      break
    }
    return s
  }
}
