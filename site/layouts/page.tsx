import type {Data, Context} from "@onlyoffice/eleventy-types"
import {
  Page,
  PageFooter,
  PageFooterCopyright,
  PageFooterLinkContainer,
  PageFooterThemeSwitcher,
  PageHeader,
  PageHeaderLogo,
  PageHeaderMenu
} from "@onlyoffice/site-page"
import {ThemeSwitcher, ThemeSwitcherOption} from "@onlyoffice/site-theme-switcher"
import {OnlyofficeLogo} from "@onlyoffice/ui-logos"
import {SrOnly} from "@onlyoffice/ui-sr-only"
import {type JSX, h} from "preact"

export function data(): Data {
  return {
    layout: "html"
  }
}

export function render({collections, content}: Context): JSX.Element {
  return <Page>
    <PageHeader>
      <SrOnly>
        <h2>Navigation Menu</h2>
      </SrOnly>
      <PageHeaderLogo>
        <a href="/"><OnlyofficeLogo height={38} /></a>
      </PageHeaderLogo>
      <PageHeaderMenu label="Global Navigation">
        {collections.navigation
          .map((item) => <a href={item.link}>{item.title}</a>)}
      </PageHeaderMenu>
    </PageHeader>
    <main>{content}</main>
    <PageFooter>
      <SrOnly>
        <h2>Site-wide Links</h2>
      </SrOnly>
      <PageFooterLinkContainer label="Links related to">
        <h3>Get Information</h3>
        <a href="/">Get information</a>
        <a href="/">Blog for developers</a>
        <a href="/">For contributors</a>
        <a href="/">Legal notice</a>
      </PageFooterLinkContainer>
      <PageFooterLinkContainer label="Links related to">
        <h3>Get Help</h3>
        <a href="/">Forum</a>
        <a href="/">Code on GitHub</a>
        <a href="/">Installation guides</a>
        <a href="/">Support contact form</a>
      </PageFooterLinkContainer>
      <PageFooterLinkContainer label="Links related to">
        <h3>Try Now</h3>
        <a href="/">Developer Profile</a>
      </PageFooterLinkContainer>
      <PageFooterThemeSwitcher>
        <ThemeSwitcher>
          <ThemeSwitcherOption value="light">Light</ThemeSwitcherOption>
          <ThemeSwitcherOption value="dark">Dark</ThemeSwitcherOption>
          <ThemeSwitcherOption value="auto">Auto</ThemeSwitcherOption>
        </ThemeSwitcher>
      </PageFooterThemeSwitcher>
      <PageFooterCopyright>
        <a href="/">onlyoffice.com</a>
        <p>(c) Ascensio System SIA 2023. All right reserved</p>
      </PageFooterCopyright>
    </PageFooter>
  </Page>
}
