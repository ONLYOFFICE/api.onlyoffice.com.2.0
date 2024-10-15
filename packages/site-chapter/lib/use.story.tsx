import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Default as ArticleStory} from "../../site-article/lib/main.story.tsx"
import {Chapter, ChapterContent, ChapterNavigation} from "./main.tsx"

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
