import {Config} from "@onlyoffice/site-config"
import * as Site from "@onlyoffice/site-kit"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"

interface Navigation {
  title: string
  items: NavigationItem[]
}

interface NavigationItem {
  title: string
  href: string
}

export function Footer(): JSX.Element {
  const c = Config.shared
  const a: Navigation[] = [
    {
      title: "Get Information",
      items: [
        {title: "Blog for developers", href: "https://www.onlyoffice.com/blog/category/for-developers?from=api"},
        {title: "For contributors", href: "https://www.onlyoffice.com/contribute.aspx?from=api"},
        {title: "Legal notice", href: "https://www.onlyoffice.com/legalterms.aspx?from=api"},
        {title: "Legacy version", href: c.legacyBaseUrl},
      ],
    },
    {
      title: "Get Help",
      items: [
        {title: "Forum", href: "https://forum.onlyoffice.com"},
        {title: "Code on GitHub", href: "https://github.com/ONLYOFFICE/"},
        {title: "Installation guides", href: "https://helpcenter.onlyoffice.com/installation/docs-developer-index.aspx?from=api"},
        {title: "Support contact form", href: "https://www.onlyoffice.com/support-contact-form.aspx?from=api"},
      ],
    },
  ]

  return <Site.Footer>
    <SrOnly>
      <h2>Site-wide Links</h2>
    </SrOnly>
    <Site.FooterContainer>
      {a.map((n) => <Site.FooterNavigation>
        <h3>{n.title}</h3>
        <Site.FooterList>
          {n.items.map((t) => <Site.FooterListItem>
            <a href={t.href} target="_blank">{t.title}</a>
          </Site.FooterListItem>)}
        </Site.FooterList>
      </Site.FooterNavigation>)}
    </Site.FooterContainer>
    <Site.FooterThemeSwitcher>
      <Site.ThemeSwitcher>
        <Site.ThemeSwitcherOption value="light">Light</Site.ThemeSwitcherOption>
        <Site.ThemeSwitcherOption value="dark">Dark</Site.ThemeSwitcherOption>
        <Site.ThemeSwitcherOption value="auto">Auto</Site.ThemeSwitcherOption>
      </Site.ThemeSwitcher>
    </Site.FooterThemeSwitcher>
    <Site.FooterCopyright>
      <a href="https://onlyoffice.com/">onlyoffice.com</a>
      <p>© Ascensio System SIA 2024. All right reserved</p>
    </Site.FooterCopyright>
  </Site.Footer>
}
