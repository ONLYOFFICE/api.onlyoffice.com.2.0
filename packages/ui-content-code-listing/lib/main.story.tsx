import "@onlyoffice/ui-code-listing/client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import {Content} from "@onlyoffice/ui-content"
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
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import contentCodeListing from "./main.css?inline"

const meta: Meta = {
  title: "UI/Content/Code Listing",
  parameters: {styles: [colors, content, codeListing, contentCodeListing]}
}

export function Composition(): JSX.Element {
  return <Content>
    <h1>Code Listing</h1>
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
  </Content>
}

export default meta
