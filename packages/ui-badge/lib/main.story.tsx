import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Badge, BadgeCaption, type BadgeProperties} from "./main.tsx"

export default {
  title: "UI / Badge",
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
    return <Badge>Default</Badge>
  },
}

interface PlaygroundProperties extends BadgeProperties {
  caption: string
  text: string
}

export const Playground: StoryObj<PlaygroundProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    variant: {
      control: "select",
      options: [
        "default",
        "calm",
        "critical",
        // "innovative",
        "neutral",
        "transparent",
        // "vibrant",
      ],
    },
  },
  args: {
    variant: "default",
    caption: "Story",
    text: "Playground",
  },
  render(p) {
    return <Badge variant={p.variant}>
      <BadgeCaption>
        {p.caption}
      </BadgeCaption>
      {p.text}
    </Badge>
  },
}
