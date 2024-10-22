import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {CodeEditor} from "./main.tsx"

export default {
  title: "UI Foundation / Code Editor",
} satisfies Meta

export function Default(p: ChildrenIncludable): JSX.Element {
  return <CodeEditor>{p.children ?? 'console.log("Code editor")'}</CodeEditor>
}
