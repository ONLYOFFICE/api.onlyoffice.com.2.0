import type {Data, Context} from "@onlyoffice/eleventy-types"
import {SiteDocumentEditorPlayground} from "@onlyoffice/site-document-editor-playground"
import {
  SitePage,
  SitePageFooter,
  SitePageFooterCopyright,
  SitePageFooterLinkContainer,
  SitePageFooterThemeSwitcher,
  SitePageHeader,
  SitePageHeaderLogo,
  SitePageHeaderMenu
} from "@onlyoffice/site-page"
import {
  SitePlaygroundLayout,
  SitePlaygroundLayoutBefore,
  SitePlaygroundLayoutPlayground
} from "@onlyoffice/site-playground-layout"
import {ThemeSwitcher, ThemeSwitcherOption} from "@onlyoffice/site-theme-switcher"
import {SrOnly} from "@onlyoffice/ui-sr-only"
import {Content} from "@onlyoffice/ui-content"
import {type JSX, h} from "preact"

export function data(): Data {
  return {
    layout: "html",
    order: -7
  }
}

export function render({config}: Context): JSX.Element {
  return <SitePage>
    <SitePageHeader>
      <SrOnly>
        <h2>Navigation Menu</h2>
      </SrOnly>
      <SitePageHeaderLogo>
        {/* <a href="/"><OnlyofficeLogo /></a> */}
      </SitePageHeaderLogo>
      <SitePageHeaderMenu label="Global Navigation">
        {/* <a href="/docspace/">DocSpace</a>
        <a href="/docs/">Docs</a>
        <a href="/workspace/">Workspace</a> */}
      </SitePageHeaderMenu>
    </SitePageHeader>
    <main>
      <SitePlaygroundLayout>
        <SitePlaygroundLayoutBefore>
          <Content>
            <h1>Document Editor Playground</h1>
          </Content>
        </SitePlaygroundLayoutBefore>
        <SitePlaygroundLayoutPlayground>
          <SiteDocumentEditorPlayground config={config.playground} />
        </SitePlaygroundLayoutPlayground>
      </SitePlaygroundLayout>
    </main>
    <SitePageFooter>
      <SrOnly>
        <h2>Site-wide Links</h2>
      </SrOnly>
      <SitePageFooterLinkContainer label="Links related to">
        <h3>Get Information</h3>
        <a href="/">Get information</a>
        <a href="/">Blog for developers</a>
        <a href="/">For contributors</a>
        <a href="/">Legal notice</a>
      </SitePageFooterLinkContainer>
      <SitePageFooterLinkContainer label="Links related to">
        <h3>Get Help</h3>
        <a href="/">Forum</a>
        <a href="/">Code on GitHub</a>
        <a href="/">Installation guides</a>
        <a href="/">Support contact form</a>
      </SitePageFooterLinkContainer>
      <SitePageFooterLinkContainer label="Links related to">
        <h3>Try Now</h3>
        <a href="/">Developer Profile</a>
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
