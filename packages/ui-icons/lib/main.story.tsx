import type {Meta} from "@storybook/preact"
import {type JSX, Fragment, h} from "preact"
import * as icons from "../dist/main.tsx"

const meta: Meta = {
  title: "UI/Icons"
}

export function Composition(): JSX.Element {
  return <>{Object.values(icons)
    .map((DistIcon) => <div style={{width: "120px"}}><DistIcon /></div>)}</>
}

export default meta
