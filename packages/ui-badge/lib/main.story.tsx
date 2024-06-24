import type {Meta} from "@storybook/preact"
import {type JSX, Fragment, h} from "preact"
import {Badge} from "./main.tsx"

const meta: Meta = {
  title: "UI/Badge"
}

export function Default(): JSX.Element {
  return <>
    <Badge>default</Badge>
    <Badge variant="danger">danger</Badge>
    <Badge variant="support">support</Badge>
  </>
}

export default meta
