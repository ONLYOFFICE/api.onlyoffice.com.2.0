import {Button, type ButtonProperties} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "UI Foundation / Button",
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
    return <Button>Button</Button>
  },
}

export const Playground: StoryObj<ButtonProperties> = {
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
    variant: {
      control: "select",
      options: ["default", "accent", "neutral"],
    },
  },
  args: {
    size: "default",
    variant: "default",
    children: "Button",
  },
  render(p) {
    return <Button
      size={p.size}
      variant={p.variant}
    >
      {p.children}
    </Button>
  },
}
