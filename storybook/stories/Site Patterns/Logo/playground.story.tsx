import {Logo, type LogoProperties} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Patterns / Logo",
} satisfies Meta

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
