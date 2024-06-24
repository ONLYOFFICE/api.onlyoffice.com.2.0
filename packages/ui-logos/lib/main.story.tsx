import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {OnlyofficeLogo} from "./main.tsx"

const meta: Meta = {
  title: "UI/Logos"
}

export function Composition(): JSX.Element {
  return <OnlyofficeLogo height={38} />
}

export default meta
