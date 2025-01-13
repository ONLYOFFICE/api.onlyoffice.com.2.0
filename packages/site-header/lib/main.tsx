import * as Elements from "@onlyoffice/preact-elements"
import {Slot, type SlotProperties} from "@onlyoffice/preact-slots"
import {clsx} from "clsx"
import {type JSX} from "preact"

export function HeaderAccessor(p: SlotProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("header-accessor", o.class)
  return <Slot {...o} />
}

export function Header(p: Elements.HeaderProperties): JSX.Element {
  const {children, ...o} = p
  o.class = clsx("header", o.class)

  return <Elements.Header {...o}>
    <div class="header__inner">{children}</div>
  </Elements.Header>
}

export function HeaderLeading(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("header__leading", o.class)
  return <Elements.Div {...o} />
}

export function HeaderContent(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("header__content", o.class)
  return <Elements.Div {...o} />
}

export function HeaderTrailing(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("header__trailing", o.class)
  return <Elements.Div {...o} />
}
