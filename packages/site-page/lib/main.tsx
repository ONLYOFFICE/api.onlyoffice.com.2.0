import {useSlots} from "@onlyoffice/preact-slots"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {SidebarIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {Fragment, type JSX, h, toChildArray} from "preact"

export function Page({children}: ChildrenIncludable): JSX.Element {
  const [slots, outer] = useSlots(children, {
    header: PageHeader,
    footer: PageFooter,
  })
  return <page-container class="page">
    <div class="page__header">{slots.header}</div>
    {outer}
    <div class="page__footer">{slots.footer}</div>
  </page-container>
}

export function PageHeader({children}: ChildrenIncludable): JSX.Element {
  const [slots, outer] = useSlots(children, {
    logo: PageHeaderLogo,
    menu: PageHeaderMenu,
    nav: PageHeaderNavToggler,
  })
  return <header role="banner" class="page-header">
    {outer}
    <div class="page-header__logo">{slots.logo}</div>
    <div class="page-header__menu">{slots.menu}</div>
    {slots.nav && <div class="page-header__nav-toggler">{slots.nav}</div>}
  </header>
}

export function PageHeaderLogo({children}: ChildrenIncludable): JSX.Element {
  return <>{children}</>
}

export function PageHeaderMenu({children}: ChildrenIncludable): JSX.Element {
  return <>{children}</>
}

export interface PageHeaderNavTogglerProperties {
  label?: string
}

export function PageHeaderNavToggler(p: PageHeaderNavTogglerProperties): JSX.Element {
  return <button class="page-header-nav-toggler" aria-label={p.label} data-page-container-chapter-navigation-toggler>
    <SidebarIcon height={24} width={24} />
  </button>
}

export function PageFooter({children}: ChildrenIncludable): JSX.Element {
  const [slots, outer] = useSlots(children, {
    links: [PageFooterLinkContainer],
    theme: PageFooterThemeSwitcher,
    copyright: PageFooterCopyright,
  })
  return <footer class="page-footer">
    {outer}
    <div class="page-footer__link-list">{slots.links}</div>
    <div class="page-footer__theme-switcher">{slots.theme}</div>
    <div class="page-footer__copyright">{slots.copyright}</div>
  </footer>
}

export interface PageFooterLinkContainerParameters extends ChildrenIncludable {
  label?: string
}

export function PageFooterLinkContainer(
  {children, label}: PageFooterLinkContainerParameters,
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    links: [<a />],
  })
  return <nav aria-label={label}>
    {outer}
    <ul>{toChildArray(slots.links).map((ln, i) => <li key={i}>{ln}</li>)}</ul>
  </nav>
}

export function PageFooterThemeSwitcher({children}: ChildrenIncludable): JSX.Element {
  return <>{children}</>
}

export function PageFooterCopyright({children}: ChildrenIncludable): JSX.Element {
  return <>{children}</>
}
