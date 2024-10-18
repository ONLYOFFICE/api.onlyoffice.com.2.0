import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Logo, type LogoProperties} from "./main.tsx"

export default {
  title: "Site Patterns / Logo",
} satisfies Meta

export const Default: StoryObj = {
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render() {
    return <Logo />
  },
}

export const Playground: StoryObj<LogoProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    size: {
      control: "select",
      options: ["default", "small", "medium"],
    },
  },
  args: {
    size: "default",
  },
  render(p) {
    return <Logo size={p.size} />
  },
}
