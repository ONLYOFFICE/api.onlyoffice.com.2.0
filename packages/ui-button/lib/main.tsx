import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX} from "preact"

export interface ButtonProperties extends Omit<Elements.ButtonProperties, "size"> {
  size?: "default" | "small" | "medium" | "large"
  variant?: "default" | "accent" | "neutral"
}

export function Button(p: ButtonProperties): JSX.Element {
  const {size, variant, ...o} = p

  o.class = clsx(
    "button",
    size && `button_size_${size}`,
    variant && `button_variant_${variant}`,
    o.class,
  )

  return <Elements.Button {...o} />
}
