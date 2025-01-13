import {
  HeaderAccessor,
  Page,
  PageContent,
  PageFooter,
  PageHeader,
} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Default as FooterStory} from "../../Site Composites/Footer/default.story.tsx"
import {FullFeatured as HeaderStory} from "../../Site Composites/Header/full-featured.story.tsx"
import {ChapterWithAnArticle as ChapterStory} from "../Chapter/use.story.tsx"

export default {
  title: "Site Regions / Page / Use Cases",
} satisfies Meta

export const PageWithHeaderAndFooter: StoryObj = {
  name: "With Header and Footer",
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render(_, ctx) {
    return <HeaderAccessor>
      <Page>
        <PageHeader>
          {HeaderStory.render && HeaderStory.render(_, ctx)}
        </PageHeader>
        <PageContent>
          content
        </PageContent>
        <PageFooter>
          {FooterStory.render && FooterStory.render(_, ctx)}
        </PageFooter>
      </Page>
    </HeaderAccessor>
  },
}

export const PageWithChapter: StoryObj = {
  name: "With Chapter",
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render(_, ctx) {
    return <HeaderAccessor>
      <Page>
        <PageHeader>
          {HeaderStory.render && HeaderStory.render(_, ctx)}
        </PageHeader>
        <PageContent>
          {ChapterStory.render && ChapterStory.render(_, ctx)}
        </PageContent>
        <PageFooter>
          {FooterStory.render && FooterStory.render(_, ctx)}
        </PageFooter>
      </Page>
    </HeaderAccessor>
  },
}
