import {clsx} from "clsx"
import type {JSX} from "preact"
import {h} from "preact"

export interface ButtonParameters {
  children?: any
  variant?: "accent" | "neutral"
}

export function Button({children, variant}: ButtonParameters): JSX.Element {
  const cv = ["button"]
  if (variant !== undefined) {
    const c = vc(variant)
    cv.push(c)
  }
  return <button class={clsx(cv)} type="button">{children}</button>
}

function vc(v: Exclude<ButtonParameters["variant"], undefined>): string {
  switch (v) {
  case "accent":
    return "button_accent"
  case "neutral":
    return ""
  default:
    throw new Error(`Unknown variant: ${v}`)
  }
}
