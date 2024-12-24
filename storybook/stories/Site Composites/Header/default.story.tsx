import {
  Header,
  HeaderContent,
  HeaderLeading,
  HeaderTrailing,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

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
