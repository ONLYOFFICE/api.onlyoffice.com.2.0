import * as Elements from "@onlyoffice/preact-elements"
import {OnlyofficeBetaLogo} from "@onlyoffice/ui-logos"
import {clsx} from "clsx"
import {type JSX} from "preact"

export interface LogoProperties extends Omit<Elements.SpanProperties, "size"> {
  size?: "default" | "small" | "medium"
}

export function Logo(p: LogoProperties): JSX.Element {
  const {children, size, ...o} = p
  o.class = clsx("logo", size && `logo_size_${size}`, o.class)

  return <Elements.Span {...o}>
    <OnlyofficeBetaLogo width={38} />
  </Elements.Span>
}
