import {MenubarAccessor} from "@onlyoffice/site-menubar"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Default as LogoStory} from "../../site-logo/lib/main.story.tsx"
import {Default as MenubarStory} from "../../site-menubar/lib/main.story.tsx"
import {Header, HeaderContent, HeaderLeading, HeaderTrailing} from "./main.tsx"

export default {
  title: "Site Composites / Header / Use Cases",
} satisfies Meta

export const HeaderWithEverything: StoryObj = {
  name: "Header with everything",
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render(_, ctx) {
    return <MenubarAccessor>
      <Header>
        <HeaderLeading>
          <a href={location.href}>
            {LogoStory.render && LogoStory.render({}, ctx)}
          </a>
        </HeaderLeading>
        <HeaderContent>
          {MenubarStory.render && MenubarStory.render({}, ctx)}
        </HeaderContent>
        <HeaderTrailing>
          {/* trailing */}
        </HeaderTrailing>
      </Header>
    </MenubarAccessor>
  },
}
