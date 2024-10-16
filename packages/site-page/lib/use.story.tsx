import {HeaderAccessor} from "@onlyoffice/site-header"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {ChapterWithAnArticle as ChapterStory} from "../../site-chapter/lib/use.story.tsx"
import {Default as FooterStory} from "../../site-footer/lib/main.story.tsx"
import {HeaderWithEverything as HeaderStory} from "../../site-header/lib/use.story.tsx"
import {Page, PageContent, PageFooter, PageHeader} from "./main.tsx"

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
