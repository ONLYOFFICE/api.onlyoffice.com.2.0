import "@onlyoffice/ui-code-listing/client.ts"
import codeEditor from "@onlyoffice/ui-code-editor/main.css?inline"
import {CodeEditor} from "@onlyoffice/ui-code-editor"
import codeListing from "@onlyoffice/ui-code-listing/main.css?inline"
import {
  CodeListing,
  CodeListingAction,
  CodeListingActionList,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel
} from "@onlyoffice/ui-code-listing"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import codeListingCodeEditor from "./main.css?inline"

const meta: Meta = {
  title: "UI/Code Listing/Code Editor",
  parameters: {styles: [colors, codeListing, codeEditor, codeListingCodeEditor]}
}

export function Composition(): JSX.Element {
  return <CodeListing>
    <CodeListingTabListWrapper>
      <CodeListingTabList label="List of Tabs">
        <CodeListingTab id="first">First Tab</CodeListingTab>
        <CodeListingTab id="second">Second Tab</CodeListingTab>
      </CodeListingTabList>
      <CodeListingActionList label="List of Actions">
        <CodeListingAction>
          <button type="button">@</button>
        </CodeListingAction>
        <CodeListingAction>
          <button type="button">@</button>
        </CodeListingAction>
      </CodeListingActionList>
    </CodeListingTabListWrapper>
    <CodeListingTabPanel by="first">
      <CodeEditor>console.log("First Tab Content")</CodeEditor>
    </CodeListingTabPanel>
    <CodeListingTabPanel by="second">
      <CodeEditor>console.log("Second Tab Content")</CodeEditor>
    </CodeListingTabPanel>
  </CodeListing>
}

export default meta
