import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {Fragment, h} from "preact"
import codeEditor from "./main.css?inline"
import {CodeEditor} from "./main.tsx"

const meta: Meta = {
  title: "UI/Code Editor",
  parameters: {styles: [colors, codeEditor]}
}

export function Composition(): JSX.Element {
  return <>
    <p>Paragraph before code editor</p>
    <CodeEditor>console.log("Code editor")</CodeEditor>
    <p>Paragraph after code editor</p>
  </>
}

export default meta
