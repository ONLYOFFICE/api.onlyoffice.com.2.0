import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {CodeEditor} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"

export default {
  title: "UI Foundation / Code Editor",
} satisfies Meta

export function Default(p: ChildrenIncludable): JSX.Element {
  return <CodeEditor>{p.children ?? 'console.log("Code editor")'}</CodeEditor>
}
