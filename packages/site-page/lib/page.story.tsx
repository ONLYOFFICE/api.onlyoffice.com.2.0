import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {OnlyofficeLogo, SrOnly} from "@onlyoffice/ui-kit"
import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as ChapterDefault} from "../../site-chapter/lib/main.story.tsx"
import {Default as HomeDefault} from "../../site-home/lib/main.story.tsx"
import {Default as PartDefault} from "../../site-part/lib/part.story.tsx"
import {
  Default as PlaygroundDefault,
  DocumentEditor as PlaygroundDocumentEditorDefault
} from "../../site-playground/lib/main.story.tsx"
import {Default as ThemeSwitcher} from "../../site-theme-switcher/lib/main.story.tsx"
import {
  Page,
  PageFooter,
  PageFooterCopyright,
  PageFooterLinkContainer,
  PageFooterThemeSwitcher,
  PageHeader,
  PageHeaderLogo,
  PageHeaderMenu
} from "./main.tsx"

const meta: Meta = {
  title: "Site/Page"
}

export function Default({children}: ChildrenIncludable): JSX.Element {
  return <Page>
    <PageHeader>
      <SrOnly>
        <h2>Navigation Menu</h2>
      </SrOnly>
      <PageHeaderLogo>
        <a href="/">
          <OnlyofficeLogo height={38} style={{display: "block"}} />
        </a>
      </PageHeaderLogo>
      <PageHeaderMenu label="Global">
        {/* <a href="/docspace/">DocSpace</a>
        <a href="/docs/">Docs</a>
        <a href="/workspace/">Workspace</a> */}
      </PageHeaderMenu>
    </PageHeader>
    <main>
      {children ?? Array.from({length: 12}).map((_, i) => <p key={i}>{i}</p>)}
    </main>
    <PageFooter>
      <SrOnly>
        <h2>Site-wide Links</h2>
      </SrOnly>
      <PageFooterLinkContainer label="Links related to">
        <h3>Get Help</h3>
        <a href="/">home</a>
        <a href="/">too looooooooooooooooong</a>
      </PageFooterLinkContainer>
      <PageFooterLinkContainer label="Links related to">
        <h3>Try Now</h3>
        <a href="/">home</a>
      </PageFooterLinkContainer>
      <PageFooterThemeSwitcher>
        <ThemeSwitcher />
      </PageFooterThemeSwitcher>
      <PageFooterCopyright>
        <a href="/">onlyoffice.com</a>
        <p>(c) Ascensio System SIA 2023. All right reserved</p>
      </PageFooterCopyright>
    </PageFooter>
  </Page>
}

export function Home(): JSX.Element {
  return <Default><HomeDefault /></Default>
}

export function Part(): JSX.Element {
  return <Default><PartDefault /></Default>
}

export function Chapter(): JSX.Element {
  return <Default><ChapterDefault /></Default>
}

export function Playground(): JSX.Element {
  return <Default><PlaygroundDefault /></Default>
}

export function PlaygroundDocumentEditor(): JSX.Element {
  return <Default><PlaygroundDocumentEditorDefault /></Default>
}

export default meta
