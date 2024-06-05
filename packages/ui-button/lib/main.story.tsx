import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {Fragment, h} from "preact"
import button from "./main.css?inline"
import {Button} from "./main.tsx"

const meta: Meta = {
  title: "UI/Button",
  parameters: {styles: [colors, button]}
}

export function Composition(): JSX.Element {
  return <>
    <p><Button>Default</Button></p>
    <p><Button variant="neutral">Neutral</Button></p>
    <p><Button variant="accent">Accent</Button></p>
  </>
}

export default meta
