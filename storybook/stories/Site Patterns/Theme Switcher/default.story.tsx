import {ThemeSwitcher, ThemeSwitcherOption} from "@onlyoffice/site-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"

export default {
  title: "Site Patterns / Theme Switcher",
} satisfies Meta

export function Default(): JSX.Element {
  return <ThemeSwitcher label="Color Theme Switcher">
    <ThemeSwitcherOption value="light">light</ThemeSwitcherOption>
    <ThemeSwitcherOption value="auto">auto</ThemeSwitcherOption>
    <ThemeSwitcherOption value="dark">dark</ThemeSwitcherOption>
  </ThemeSwitcher>
}
