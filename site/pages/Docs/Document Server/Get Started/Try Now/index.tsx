import type {Data, Context} from "@onlyoffice/eleventy-types"
import {SiteDocumentEditorPlayground} from "@onlyoffice/site-document-editor-playground"
import {
  SitePlaygroundLayout,
  SitePlaygroundLayoutBefore,
  SitePlaygroundLayoutPlayground
} from "@onlyoffice/site-playground-layout"
import {Content} from "@onlyoffice/ui-content"
import {type JSX, h} from "preact"

export function data(): Data {
  return {
    layout: "page",
    order: -7
  }
}

export function render({config}: Context): JSX.Element {
  return <SitePlaygroundLayout>
    <SitePlaygroundLayoutBefore>
      <Content>
        <h1>Document Editor Playground</h1>
      </Content>
    </SitePlaygroundLayoutBefore>
    <SitePlaygroundLayoutPlayground>
      <SiteDocumentEditorPlayground config={config.playground} />
    </SitePlaygroundLayoutPlayground>
  </SitePlaygroundLayout>
}
