import "./client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import {Content} from "@onlyoffice/ui-content"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import contentTabContainer from "./main.css?inline"
import {ContentTab, ContentTabContainer, ContentTabList, ContentTabPanel} from "./main.tsx"

const meta: Meta = {
  title: "UI/Content Tab Container",
  parameters: {styles: [colors, content, contentTabContainer]}
}

export function Composition(): JSX.Element {
  return <Content>
    <h1>Content Tab Container</h1>
    <p>Paragraph before tabs</p>
    <ContentTabContainer>
      <ContentTabList label="Group of Tabs">
        <ContentTab id="first">First Tab</ContentTab>
        <ContentTab id="second">Second Tab</ContentTab>
      </ContentTabList>
      <ContentTabPanel by="first">
        <p>First Tab Content</p>
      </ContentTabPanel>
      <ContentTabPanel by="second">
        <p>Second Tab Content</p>
      </ContentTabPanel>
    </ContentTabContainer>
    <p>Paragraph after tabs</p>
  </Content>
}

export default meta
