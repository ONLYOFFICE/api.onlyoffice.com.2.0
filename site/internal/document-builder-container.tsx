import {documentBuilder} from "@onlyoffice/document-builder-hast-element"
import {type DocumentEditorConfig} from "@onlyoffice/document-editor-html-element"
import {mergeConfig, normalizeConfig} from "@onlyoffice/document-server-utils"
import {Config} from "@onlyoffice/site-config"
import {template} from "@onlyoffice/template-hast-element"
import {type Element, type Root} from "hast"
import {toText} from "hast-util-to-text"
import {visit} from "unist-util-visit"

declare module "hast" {
  interface Metaobject {
    "document-builder"?: DocumentEditorConfig
  }
}

export interface RehypeDocumentBuilderContainerTransform {
  (tree: Root): void
}

export function rehypeDocumentBuilderContainer(): RehypeDocumentBuilderContainerTransform {
  const c = Config.shared

  return function transform(t) {
    visit(t, "element", (n, i, p) => {
      if (n.tagName !== "pre" || i === undefined || !p) {
        return
      }

      const [e] = n.children
      if (!e || e.type !== "element" || e.tagName !== "code") {
        return
      }

      const m = e.properties.metaobject
      if (!m) {
        return
      }

      const b = m["document-builder"]
      if (!b) {
        return
      }

      const dc = documentBuilderContainer()
      const te = template()

      const db = documentBuilder()
      db.data.documentServerUrl = c.playground.documentEditor.documentServerUrl
      db.data.config = config()
      db.data.config = mergeConfig(db.data.config, b)
      db.data.config = normalizeConfig(db.data.config)
      db.data.command = toText(e, {whitespace: "pre-wrap"}).trim()

      te.children = [db]
      dc.children = [n, te]
      p.children[i] = dc
    })
  }
}

interface DocumentBuilderContainerElement extends Element {
  tagName: "document-builder-container"
}

function documentBuilderContainer(): DocumentBuilderContainerElement {
  return {
    type: "element",
    tagName: "document-builder-container",
    properties: {},
    children: [],
  }
}

function config(): DocumentEditorConfig {
  return {
    document: {
      fileType: "",
      key: "",
      title: "",
      url: "",
    },
    editorConfig: {
      customization: {
        anonymous: {
          request: false,
          label: "Guest",
        },
        compactHeader: true,
        compactToolbar: true,
        hideRightMenu: true,
        hideRulers: true,
        integrationMode: "embed",
        toolbarHideFileName: true,
        toolbarNoTabs: true,
      },
      callbackUrl: "",
    },
  }
}
