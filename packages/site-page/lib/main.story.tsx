import "@onlyoffice/site-theme-switcher/client.ts"
import themeSwitcher from "@onlyoffice/site-theme-switcher/main.css?inline"
import {ThemeSwitcher, ThemeSwitcherOption} from "@onlyoffice/site-theme-switcher"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import sizes from "@onlyoffice/ui-sizes/main.css?inline"
import srOnly from "@onlyoffice/ui-sr-only/main.css?inline"
import {SrOnly} from "@onlyoffice/ui-sr-only"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import page from "./main.css?inline"
import {
  SitePage,
  SitePageFooter,
  SitePageFooterCopyright,
  SitePageFooterLinkContainer,
  SitePageFooterThemeSwitcher,
  SitePageHeader,
  SitePageHeaderLogo,
  SitePageHeaderMenu
} from "./main.tsx"

const meta: Meta = {
  title: "Site/Page",
  parameters: {
    styles: [colors, sizes, srOnly, page, themeSwitcher]
  }
}

export function Composition(): JSX.Element {
  return <SitePage>
    <SitePageHeader>
      <SrOnly>
        <h2>Navigation Menu</h2>
      </SrOnly>
      <SitePageHeaderLogo>
        {/* <a href="/"><OnlyofficeLogo /></a> */}
      </SitePageHeaderLogo>
      <SitePageHeaderMenu label="Global">
        {/* <a href="/docspace/">DocSpace</a>
        <a href="/docs/">Docs</a>
        <a href="/workspace/">Workspace</a> */}
      </SitePageHeaderMenu>
    </SitePageHeader>
    <main>
      {Array.from({length: 12})
        .map((_, i) => <p key={i}>{i}</p>)}
    </main>
    <SitePageFooter>
      <SrOnly>
        <h2>Site-wide Links</h2>
      </SrOnly>
      <SitePageFooterLinkContainer label="Links related to">
        <h3>Get Help</h3>
        <a href="/">home</a>
        <a href="/">too looooooooooooooooong</a>
      </SitePageFooterLinkContainer>
      <SitePageFooterLinkContainer label="Links related to">
        <h3>Try Now</h3>
        <a href="/">home</a>
      </SitePageFooterLinkContainer>
      <SitePageFooterThemeSwitcher>
        <ThemeSwitcher>
          <ThemeSwitcherOption value="light">Light</ThemeSwitcherOption>
          <ThemeSwitcherOption value="dark">Dark</ThemeSwitcherOption>
          <ThemeSwitcherOption value="auto">Auto</ThemeSwitcherOption>
        </ThemeSwitcher>
      </SitePageFooterThemeSwitcher>
      <SitePageFooterCopyright>
        <a href="/">onlyoffice.com</a>
        <p>(c) Ascensio System SIA 2023. All right reserved</p>
      </SitePageFooterCopyright>
    </SitePageFooter>
  </SitePage>
}

export default meta
