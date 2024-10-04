import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Picture404, type Picture404Properties} from "./main.tsx"

export default {
  title: "UI Assets / Pictures / 404",
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
    return <Picture404 />
  },
}

export const Playground: StoryObj<Picture404Properties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    size: {
      control: "select",
      options: ["default", "small", "medium", "large"],
    },
  },
  args: {
    label: "Picture of a 404 error",
    size: "default",
  },
  render(p) {
    return <Picture404 label={p.label} size={p.size} />
  },
}
