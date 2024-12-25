import * as Elements from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX} from "preact"

export function Footer(p: Elements.FooterProperties): JSX.Element {
  const {children, ...o} = p
  o.class = clsx("footer", o.class)

  return <Elements.Footer {...o}>
    <div class="footer__inner">{children}</div>
  </Elements.Footer>
}

export function FooterContainer(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__container", o.class)
  return <Elements.Div {...o} />
}

export function FooterNavigation(p: Elements.NavProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__navigation", o.class)
  return <Elements.Nav {...o} />
}

export function FooterList(p: Elements.UlProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__list", o.class)
  return <Elements.Ul {...o} />
}

export function FooterListItem(p: Elements.LiProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__list-item", o.class)
  return <Elements.Li {...o} />
}

export function FooterThemeSwitcher(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__theme-switcher", o.class)
  return <Elements.Div {...o} />
}

export function FooterCopyright(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("footer__copyright", o.class)
  return <Elements.Div {...o} />
}
