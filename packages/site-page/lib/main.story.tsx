import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Page, PageContent, PageFooter, PageHeader} from "./main.tsx"

export default {
  title: "Site Regions / Page",
} satisfies Meta

export const Default: StoryObj = {
  parameters: {
    controls: {
      disable: true,
    },
    actions: {
      disable: true,
    },
  },
  render() {
    return <Page>
      <PageHeader>
        header
      </PageHeader>
      <PageContent>
        content
      </PageContent>
      <PageFooter>
        footer
      </PageFooter>
    </Page>
  },
}
