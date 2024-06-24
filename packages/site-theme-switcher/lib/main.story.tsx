import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {ThemeSwitcher, ThemeSwitcherOption} from "./main.tsx"

const meta: Meta = {
  title: "Site/Theme Switcher"
}

export function Default(): JSX.Element {
  return <ThemeSwitcher label="Color Theme Switcher">
    <ThemeSwitcherOption value="light">light</ThemeSwitcherOption>
    <ThemeSwitcherOption value="auto">auto</ThemeSwitcherOption>
    <ThemeSwitcherOption value="dark">dark</ThemeSwitcherOption>
  </ThemeSwitcher>
}

export default meta
