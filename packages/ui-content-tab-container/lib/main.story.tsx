import "./client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import content from "@onlyoffice/ui-content/main.css?inline"
import {Content} from "@onlyoffice/ui-content"
import type {JSX} from "preact"
import {Fragment, h} from "preact"
import css from "./main.css?inline"
import {ContentTab, ContentTabContainer, ContentTabList, ContentTabPanel} from "./main.tsx"

const styles: string[] = [colors, content, css]

export default {
  title: "UI/Content Tab Container",
  decorators: [
    (Story: () => JSX.Element): JSX.Element => <>
      {styles.map((s) => <style key={s} dangerouslySetInnerHTML={{__html: s}} />)}
      <Story />
    </>
  ]
}

export function Composition(): JSX.Element {
  return <Content>
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
  </Content>
}
