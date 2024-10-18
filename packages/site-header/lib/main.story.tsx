import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Header, HeaderContent, HeaderLeading, HeaderTrailing} from "./main.tsx"

export default {
  title: "Site Composites / Header",
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
    return <Header>
      <HeaderLeading>
        leading
      </HeaderLeading>
      <HeaderContent>
        content
      </HeaderContent>
      <HeaderTrailing>
        {/* trailing */}
      </HeaderTrailing>
    </Header>
  },
}
