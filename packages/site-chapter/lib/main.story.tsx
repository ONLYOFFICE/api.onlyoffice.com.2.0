import type {Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Chapter, ChapterContent, ChapterNavigation} from "./main.tsx"

const meta: Meta = {
  title: "Site/Chapter"
}

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

export default meta
