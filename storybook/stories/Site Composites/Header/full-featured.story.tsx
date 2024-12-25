import {
  Header,
  HeaderContent,
  HeaderLeading,
  HeaderTrailing,
  MenubarAccessor,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Default as LogoStory} from "../../Site Patterns/Logo/default.story.tsx"
import {Default as MenubarStory} from "../../Site Patterns/Menubar/default.story.tsx"

export default {
  title: "Site Composites / Header",
} satisfies Meta

export const FullFeatured: StoryObj = {
  name: "Full Featured",
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
