import {
  CodeListing,
  CodeListingAction,
  CodeListingActionList,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel,
} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as CodeEditorStory} from "./code-editor.story.tsx"

export default {
  title: "UI Foundation / Code Listing",
} satisfies Meta

export function Default(): JSX.Element {
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
      <pre><code>console.log("First Tab Content")</code></pre>
    </CodeListingTabPanel>
    <CodeListingTabPanel by="second">
      <pre><code>console.log("Second Tab Content")</code></pre>
    </CodeListingTabPanel>
  </CodeListing>
}

export function WithCodeEditor(): JSX.Element {
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
      <CodeEditorStory>console.log("First Tab Content")</CodeEditorStory>
    </CodeListingTabPanel>
    <CodeListingTabPanel by="second">
      <CodeEditorStory>console.log("Second Tab Content")</CodeEditorStory>
    </CodeListingTabPanel>
  </CodeListing>
}
