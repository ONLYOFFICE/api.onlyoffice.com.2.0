import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as SearchStory} from "../../site-search/lib/main.story.tsx"
import {Chapter, ChapterContent, ChapterNavigation} from "./main.tsx"

export default {
  title: "Site Regions / Chapter",
} satisfies Meta

export function Default(): JSX.Element {
  return <Chapter>
    <ChapterNavigation>
      {Array.from({length: 100}, (_, i) => <div><a key={i} href="/">{i}</a></div>)}
    </ChapterNavigation>
    <ChapterContent>
      {Array.from({length: 100}, (_, i) => <p key={i} >{i}</p>)}
    </ChapterContent>
  </Chapter>
}

export function WithSearch(): JSX.Element {
  return <Chapter>
    <ChapterNavigation>
      <SearchStory />
      {Array.from({length: 100}, (_, i) => <div><a key={i} href="/">{i}</a></div>)}
    </ChapterNavigation>
    <ChapterContent>
      {Array.from({length: 100}, (_, i) => <p key={i} >{i}</p>)}
    </ChapterContent>
  </Chapter>
}
