import "./client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {Fragment, h} from "preact"
import codeListing from "./main.css?inline"
import {
  CodeListing,
  CodeListingAction,
  CodeListingActionList,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel
} from "./main.tsx"

const meta: Meta = {
  title: "UI/Code Listing",
  parameters: {styles: [colors, codeListing]}
}

export function Composition(): JSX.Element {
  return <>
    <p>Paragraph before code listing</p>
    <CodeListing>
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
    <p>Paragraph after code listing</p>
  </>
}

export default meta
