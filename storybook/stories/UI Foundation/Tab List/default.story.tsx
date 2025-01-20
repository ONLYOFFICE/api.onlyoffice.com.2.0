import {
  TabList,
  TabListExtra,
  TabListExtraList,
  TabListTab,
  TabListTabList,
  TabListTabListWrapper,
  TabListTabPanel,
} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "UI Foundation / Tab List",
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
    return <TabList>
      <TabListTabListWrapper>
        <TabListTabList label="List of Tabs">
          <TabListTab id="tab">Tab</TabListTab>
        </TabListTabList>
        <TabListExtraList label="List of Extras">
          <TabListExtra>
            Tab Extra
          </TabListExtra>
        </TabListExtraList>
      </TabListTabListWrapper>
      <TabListTabPanel labelledby="tab">
        Tab panel
      </TabListTabPanel>
    </TabList>
  },
}
