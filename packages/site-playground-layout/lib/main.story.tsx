import "@onlyoffice/ui-select/client.ts"
import "@onlyoffice/site-document-editor-playground/client.ts"
import {Client} from "@onlyoffice/server-client"
import {ConfigFixture} from "@onlyoffice/site-config-fixtures"
import siteDocumentEditorPlayground from "@onlyoffice/site-document-editor-playground/main.css?inline"
import {SiteDocumentEditorPlayground} from "@onlyoffice/site-document-editor-playground"
import button from "@onlyoffice/ui-button/main.css?inline"
import codeEditor from "@onlyoffice/ui-code-editor/main.css?inline"
import codeListing from "@onlyoffice/ui-code-listing/main.css?inline"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import {Content} from "@onlyoffice/ui-content"
import contentCodeEditor from "@onlyoffice/ui-content-code-editor/main.css?inline"
import contentCodeListing from "@onlyoffice/ui-content-code-listing/main.css?inline"
import contentTabContainer from "@onlyoffice/ui-content-tab-container/main.css?inline"
import formControl from "@onlyoffice/ui-form-control/main.css?inline"
import select from "@onlyoffice/ui-select/main.css?inline"
import type {Meta} from "@storybook/preact"
import {useEffect} from "preact/hooks"
import type {JSX} from "preact"
import {h} from "preact"
import sitePlaygroundLayout from "./main.css?inline"
import {
  SitePlaygroundLayout,
  SitePlaygroundLayoutBefore,
  SitePlaygroundLayoutPlayground
} from "./main.tsx"

const meta: Meta = {
  title: "Site/Playground Layout",
  parameters: {styles: [
    colors,
    button,
    formControl,
    select,
    content,
    contentTabContainer,
    codeEditor,
    contentCodeEditor,
    codeListing,
    contentCodeListing,
    sitePlaygroundLayout,
    siteDocumentEditorPlayground
  ]}
}

export function Composition(): JSX.Element {
  document.addEventListener("documentbuildererror", console.error)
  document.addEventListener("documenteditorerror", console.error)
  document.addEventListener("sitedocumenteditorplaygrounderror", console.error)

  useEffect(() => {
    setup()
  }, [])

  const c = new ConfigFixture()

  return <SitePlaygroundLayout>
    <SitePlaygroundLayoutBefore>
      <Content>
        <h1>Document Editor Playground</h1>
      </Content>
    </SitePlaygroundLayoutBefore>
    <SitePlaygroundLayoutPlayground>
      <SiteDocumentEditorPlayground config={c.playground} />
    </SitePlaygroundLayoutPlayground>
  </SitePlaygroundLayout>
}

async function setup(): Promise<void> {
  const c = new Client()
  c.baseURL = "http://0.0.0.0:4000/"

  const sp = document.querySelector("site-document-editor-playground")
  if (!sp) {
    throw new Error("site-document-editor-playground not found")
  }

  sp.client = c
  await sp.connectedCallback()
}

export default meta
