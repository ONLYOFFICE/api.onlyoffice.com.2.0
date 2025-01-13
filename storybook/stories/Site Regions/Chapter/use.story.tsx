import {Chapter, ChapterContent, ChapterNavigation} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Default as ArticleStory} from "../../Site Composites/Article/default.story.tsx"

export default {
  title: "Site Regions / Chapter / Use Cases",
} satisfies Meta

export const ChapterWithAnArticle: StoryObj = {
  name: "Chapter with an article",
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render(_, ctx) {
    return <Chapter>
      <ChapterNavigation>
        {Array.from({length: 100}, (_, i) => <div><a key={i} href="/">{i}</a></div>)}
      </ChapterNavigation>
      <ChapterContent>
        {ArticleStory.render && ArticleStory.render({}, ctx)}
      </ChapterContent>
    </Chapter>
  },
}
