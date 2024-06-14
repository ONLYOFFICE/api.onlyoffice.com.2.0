import {useSlots} from "@onlyoffice/ui-slots"
import type {JSX} from "preact"
import {Fragment, h, toChildArray} from "preact"

export interface SitePageParameters {
  children?: any
}

export function SitePage(
  {children}: SitePageParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    header: SitePageHeader,
    footer: SitePageFooter
  })
  return <div class="page">
    <div class="page__header">{slots.header}</div>
    {outer}
    <div class="page__footer">{slots.footer}</div>
  </div>
}

export interface SitePageHeaderParameters {
  children?: any
}

export function SitePageHeader(
  {children}: SitePageHeaderParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    logo: SitePageHeaderLogo,
    menu: SitePageHeaderMenu
  })
  return <header role="banner" class="page-header">
    {outer}
    <div class="page-header__logo">{slots.logo}</div>
    <div class="page-header__menu">{slots.menu}</div>
  </header>
}

export interface SitePageHeaderLogoParameters {
  children?: any
}

export function SitePageHeaderLogo(
  {children}: SitePageHeaderLogoParameters
): JSX.Element {
  return <>{children}</>
}

export interface SitePageHeaderMenuParameters {
  children?: any
  label?: string
}

export function SitePageHeaderMenu(
  {children, label}: SitePageHeaderMenuParameters
): JSX.Element {
  return <nav class="page-header-menu" aria-label={label}>{children}</nav>
}

export interface SitePageFooterParameters {
  children?: any
}

export function SitePageFooter(
  {children}: SitePageFooterParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    links: [SitePageFooterLinkContainer],
    theme: SitePageFooterThemeSwitcher,
    copyright: SitePageFooterCopyright
  })
  return <footer class="page-footer">
    {outer}
    <div class="page-footer__link-list">{slots.links}</div>
    <div class="page-footer__theme-switcher">{slots.theme}</div>
    <div class="page-footer__copyright">{slots.copyright}</div>
  </footer>
}

export interface SitePageFooterLinkContainerParameters {
  children?: any
  label?: string
}

export function SitePageFooterLinkContainer(
  {children, label}: SitePageFooterLinkContainerParameters
): JSX.Element {
  const [slots, outer] = useSlots(children, {
    links: [<a />]
  })
  return <nav aria-label={label}>
    {outer}
    <ul>{toChildArray(slots.links)
      .map((ln, i) => <li key={i}>{ln}</li>)}</ul>
  </nav>
}

export interface SitePageFooterThemeSwitcherParameters {
  children?: any
}

export function SitePageFooterThemeSwitcher(
  {children}: SitePageFooterThemeSwitcherParameters
): JSX.Element {
  return <>{children}</>
}

export interface SitePageFooterCopyrightParameters {
  children?: any
}

export function SitePageFooterCopyright(
  {children}: SitePageFooterCopyrightParameters
): JSX.Element {
  return <>{children}</>
}
