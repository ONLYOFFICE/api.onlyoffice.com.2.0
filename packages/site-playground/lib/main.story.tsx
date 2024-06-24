import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {Content} from "@onlyoffice/ui-kit"
import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as DocumentEditorPlayground} from "../../site-document-editor-playground/lib/main.story.tsx"
import {Playground, PlaygroundBefore, PlaygroundContent} from "./main.tsx"

const meta: Meta = {
  title: "Site/Playground"
}

export function Default({children}: ChildrenIncludable): JSX.Element {
  return <Playground>
    <PlaygroundBefore>
      <Content>
        <h1>Playground</h1>
      </Content>
    </PlaygroundBefore>
    <PlaygroundContent>
      {children ?? "content"}
      {/* <SiteDocumentEditorPlayground config={c.playground} /> */}
    </PlaygroundContent>
  </Playground>
}

export function DocumentEditor(): JSX.Element {
  return <Default><DocumentEditorPlayground /></Default>
}

export default meta
