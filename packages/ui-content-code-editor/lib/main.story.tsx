import codeEditor from "@onlyoffice/ui-code-editor/main.css?inline"
import {CodeEditor} from "@onlyoffice/ui-code-editor"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import {Content} from "@onlyoffice/ui-content"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import contentCodeEditor from "./main.css?inline"

const meta: Meta = {
  title: "UI/Content/Code Editor",
  parameters: {styles: [colors, content, codeEditor, contentCodeEditor]}
}

export function Composition(): JSX.Element {
  return <Content>
    <h1>Code Editor</h1>
    <p>Paragraph before code editor</p>
    <CodeEditor>console.log("Code editor")</CodeEditor>
    <p>Paragraph after code editor</p>
  </Content>
}

export default meta
