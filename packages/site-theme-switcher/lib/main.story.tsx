import "./client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import themeSwitcher from "./main.css?inline"
import {ThemeSwitcher, ThemeSwitcherOption} from "./main.tsx"

const meta: Meta = {
  title: "Site/Theme Switcher",
  parameters: {
    styles: [colors, themeSwitcher]
  }
}

export function Composition(): JSX.Element {
  return <ThemeSwitcher label="Color Theme Switcher">
    <ThemeSwitcherOption value="light">light</ThemeSwitcherOption>
    <ThemeSwitcherOption value="auto">auto</ThemeSwitcherOption>
    <ThemeSwitcherOption value="dark">dark</ThemeSwitcherOption>
  </ThemeSwitcher>
}

export default meta
