import {
  type Configurable,
  type DocumentEditorConfigurable,
  type PlaygroundConfigurable,
  type PropertyConfigurable,
  type ServerConfigurable,
  type TabConfigurable,
  EnumType,
  FunctionType,
  LiteralType,
  PropertyConfig,
  StringType,
  TabConfig,
  BooleanType
} from "@onlyoffice/site-config"

export class ConfigFixture implements Configurable {
  baseUrl = ""
  server = new ServerConfigFixture()
  playground = new PlaygroundConfigFixture()
}

export class ServerConfigFixture implements ServerConfigurable {
  baseUrl = "http://0.0.0.0:4000/"
}

export class PlaygroundConfigFixture implements PlaygroundConfigurable {
  documentEditor = new DocumentEditorConfigFixture()
  tabs: TabConfigurable[] = []

  constructor() {
    let t = new TabConfig()
    t.id = "base"
    t.label = "Base"
    this.tabs.push(t)

    t = new TabConfig()
    t.id = "document"
    t.label = "Document"
    this.tabs.push(t)

    t = new TabConfig()
    t.id = "customization"
    t.label = "Editor Config: Customization"
    this.tabs.push(t)

    t = new TabConfig()
    t.id = "events"
    t.label = "Events"
    this.tabs.push(t)
  }
}

export class DocumentEditorConfigFixture implements DocumentEditorConfigurable {
  documentServerUrl = "http://0.0.0.0:3000/"
  config: PropertyConfigurable[] = []

  constructor() {
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
    this.config.push(pr)

    pr = new PropertyConfig()
    pr.path = "height"
    pr.tab = "base"
    pr.href = "#height"
    pr.type = new StringType()
    pr.default = "100%"
    this.config.push(pr)

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
    this.config.push(pr)

    pr = new PropertyConfig()
    pr.path = "editorConfig.customization.compactHeader"
    pr.tab = "customization"
    pr.href = "#compactHeader"
    pr.type = new BooleanType()
    pr.default = false
    this.config.push(pr)

    pr = new PropertyConfig()
    pr.path = "events.onAppReady"
    pr.tab = "events"
    pr.href = "#onAppReady"
    pr.type = new FunctionType()
    this.config.push(pr)
  }
}
