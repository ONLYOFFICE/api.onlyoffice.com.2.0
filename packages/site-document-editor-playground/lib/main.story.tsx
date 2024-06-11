import "@onlyoffice/ui-select/client.ts"
import "./client.ts"
import {Client} from "@onlyoffice/server-client"
import {
  BooleanType,
  EnumType,
  FunctionType,
  LiteralType,
  PlaygroundConfig,
  PropertyConfig,
  StringType,
  TabConfig
} from "@onlyoffice/site-config"
import button from "@onlyoffice/ui-button/main.css?inline"
import codeEditor from "@onlyoffice/ui-code-editor/main.css?inline"
import codeListing from "@onlyoffice/ui-code-listing/main.css?inline"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import contentCodeEditor from "@onlyoffice/ui-content-code-editor/main.css?inline"
import contentCodeListing from "@onlyoffice/ui-content-code-listing/main.css?inline"
import contentTabContainer from "@onlyoffice/ui-content-tab-container/main.css?inline"
import formControl from "@onlyoffice/ui-form-control/main.css?inline"
import select from "@onlyoffice/ui-select/main.css?inline"
import type {Meta} from "@storybook/preact"
import {useEffect} from "preact/hooks"
import type {JSX} from "preact"
import {h} from "preact"
import siteDocumentEditorPlayground from "./main.css?inline"
import {SiteDocumentEditorPlayground} from "./main.tsx"

const meta: Meta = {
  title: "Site/Document Editor Playground",
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

  const config = new PlaygroundConfig()

  config.documentEditor.documentServerUrl = "http://0.0.0.0:3000/"

  let pr = new PropertyConfig()
  pr.path = "documentType"
  pr.tab = "base"
  pr.href = "#documentType"
  let et = new EnumType()
  let lt = new LiteralType()
  lt.base = new StringType()
  lt.const = "word"
  et.cases.push(lt)
  lt = new LiteralType()
  lt.base = new StringType()
  lt.const = "cell"
  et.cases.push(lt)
  pr.type = et
  pr.default = "word"
  config.documentEditor.config.push(pr)

  pr = new PropertyConfig()
  pr.path = "document.fileType"
  pr.tab = "document"
  pr.href = "#fileType"
  et = new EnumType()
  lt = new LiteralType()
  lt.base = new StringType()
  lt.const = "docx"
  et.cases.push(lt)
  lt = new LiteralType()
  lt.base = new StringType()
  lt.const = "xlsx"
  et.cases.push(lt)
  pr.type = et
  pr.default = "docx"
  config.documentEditor.config.push(pr)

  pr = new PropertyConfig()
  pr.path = "editorConfig.customization.compactHeader"
  pr.tab = "customization"
  pr.href = "#compactHeader"
  pr.type = new BooleanType()
  pr.default = false
  config.documentEditor.config.push(pr)

  pr = new PropertyConfig()
  pr.path = "events.onAppReady"
  pr.tab = "events"
  pr.href = "#onAppReady"
  pr.type = new FunctionType()
  config.documentEditor.config.push(pr)

  let ta = new TabConfig()
  ta.id = "base"
  ta.label = "Base"
  config.tabs.push(ta)

  ta = new TabConfig()
  ta.id = "document"
  ta.label = "Document"
  config.tabs.push(ta)

  ta = new TabConfig()
  ta.id = "customization"
  ta.label = "Editor Config: Customization"
  config.tabs.push(ta)

  ta = new TabConfig()
  ta.id = "events"
  ta.label = "Events"
  config.tabs.push(ta)

  return <SiteDocumentEditorPlayground config={config} />
}

async function setup(): Promise<void> {
  const c = new Client()
  c.baseURL = "http://0.0.0.0:4000/"

  const sp = document.querySelector("site-document-editor-playground")
  if (sp) {
    sp.client = c
    await sp.connectedCallback()
  }
}

export default meta
