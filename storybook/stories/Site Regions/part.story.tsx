import {Part, PartChapter, PartChapters, PartHelp, PartHero} from "@onlyoffice/site-kit"
import {JavascriptSdkIcon as Icon32} from "@onlyoffice/ui-icons/rich/32.js"
import {JavascriptSdkIcon as Icon48} from "@onlyoffice/ui-icons/rich/48.js"
import {JavascriptSdkIcon as Icon64} from "@onlyoffice/ui-icons/rich/64.js"
import {SrOnly} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as HelpStory} from "../Site Patterns/Help/default.story.tsx"

export default {
  title: "Site Regions / Part",
} satisfies Meta

export function Default(): JSX.Element {
  return <Part>
    <PartHero>
      <h1>DocSpace</h1>
      <p>
        ONLYOFFICE DocSpace is a collaborative cloud platform that allows{" "}
        users to store, manage, edit, and collaborate on documents,{" "}
        spreadsheets, presentations, and forms in customizable rooms.
      </p>
    </PartHero>
    <PartChapters>
      <SrOnly><h2>Chapters</h2></SrOnly>
      {Array.from({length: 3}, (_, i) => <PartChapter key={i}>
        <Icon32 height={32} width={32} />
        <Icon48 height={48} width={48} />
        <Icon64 height={64} width={64} />
        <h3><a href="/">JavaScript SDK</a></h3>
        <p>
          In this section, you will learn how to connect DocSpace as a{" "}
          frame to your website using api.js. You can embed an entire{" "}
          DocSpace portal, a single room, or a document.
        </p>
      </PartChapter>)}
    </PartChapters>
    <PartHelp>
      <HelpStory />
    </PartHelp>
  </Part>
}
