import * as Elements from "@onlyoffice/preact-elements"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {Button, type ButtonProperties, SrOnly} from "@onlyoffice/ui-kit"
import {clsx} from "clsx"
import {Fragment, type JSX, h} from "preact"

export interface StatusProperties extends Omit<Elements.DivProperties, "size"> {
  size?: "default" | "small" | "medium" | "large"
}

export function Status(p: StatusProperties): JSX.Element {
  const {children, size, ...o} = p

  o.class = clsx("status", size && `status_size_${size}`, o.class)

  return <Elements.Div {...o}>
    <div class="status__inner">{children}</div>
  </Elements.Div>
}

export function StatusHeading(p: ChildrenIncludable): JSX.Element {
  return <SrOnly>{p.children}</SrOnly>
}

export function StatusPicture(p: ChildrenIncludable): JSX.Element {
  return <>{p.children}</>
}

export function StatusDescription(p: Elements.PProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("status__description", o.class)
  return <Elements.P {...o} />
}

export function StatusButton(p: ButtonProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("status__button", o.class)
  return <Button variant="accent" {...o} />
}
