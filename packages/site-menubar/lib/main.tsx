import * as Elements from "@onlyoffice/preact-elements"
import {Slot, type SlotProperties} from "@onlyoffice/preact-slots"
import {clsx} from "clsx"
import {type JSX, h} from "preact"

export function MenubarAccessor(p: SlotProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar-accessor", o.class)
  return <Slot {...o} />
}

export function Menubar(p: Elements.DivProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar", o.class)

  return <menubar-container>
    <Elements.Div {...o} />
  </menubar-container>
}

export function MenubarToggle(p: Elements.ButtonProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__toggle", o.class)

  if (!o.type) {
    o.type = "button"
  }

  return <Elements.Button {...o} />
}

export function MenubarNavigation(p: Elements.NavProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__navigation", o.class)
  return <Elements.Nav {...o} />
}

export function MenubarMenu(p: Elements.UlProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__menu", o.class)
  return <Elements.Ul {...o} />
}

export function MenubarMenuItem(p: Elements.LiProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__menu-item", o.class)
  return <Elements.Li {...o} />
}

export interface MenubarMenuLinkProperties extends Elements.AProperties {
  active?: boolean
}

export function MenubarMenuLink(p: MenubarMenuLinkProperties): JSX.Element {
  const {active, ...o} = p

  o.class = clsx(
    "menubar__menu-link",
    active && "menubar__menu-link_active",
    o.class,
  )

  return <Elements.A {...o} />
}

export function MenubarSubmenu(p: Elements.UlProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__submenu", o.class)
  return <Elements.Ul {...o} />
}

export function MenubarSubmenuItem(p: Elements.LiProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__submenu-item", o.class)
  return <Elements.Li {...o} />
}

export function MenubarSubmenuLink(p: Elements.AProperties): JSX.Element {
  const {...o} = p
  o.class = clsx("menubar__submenu-link", o.class)
  return <Elements.A {...o} />
}
