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

export interface PlaygroundProperties {
  tabList: PlaygroundTag[]
  extraList: PlaygroundExtra[]
  panelList: PlaygroundPanel[]
}

export interface PlaygroundTag {
  id: string
  label: string
  extras: string[]
}

export interface PlaygroundExtra {
  id: string
  label: string
}

export interface PlaygroundPanel {
  labelledby: string
  content: string
}

export const Playground: StoryObj<PlaygroundProperties> = {
  parameters: {
    actions: {
      disable: true,
    },
  },
  argTypes: {
    tabList: {
      control: {
        type: "object",
      },
    },
    extraList: {
      control: {
        type: "object",
      },
    },
  },
  args: {
    tabList: [
      {
        id: "hedgehog",
        label: "Hedgehog",
        extras: ["spines", "apples"],
      },
      {
        id: "fox",
        label: "Fox",
        extras: ["tail", "orange"],
      },
      {
        id: "wolf",
        label: "Wolf",
        extras: ["pack", "howl"],
      },
    ],
    extraList: [
      {
        id: "spines",
        label: "Spines",
      },
      {
        id: "apples",
        label: "Apples",
      },
      {
        id: "tail",
        label: "Tail",
      },
      {
        id: "orange",
        label: "Orange",
      },
      {
        id: "pack",
        label: "Pack",
      },
      {
        id: "howl",
        label: "Howl",
      },
    ],
    panelList: [
      {
        labelledby: "hedgehog",
        content: "Hedgehog content",
      },
      {
        labelledby: "fox",
        content: "Fox content",
      },
      {
        labelledby: "wolf",
        content: "Wolf content",
      },
    ],
  },
  render(p) {
    return <TabList>
      <TabListTabListWrapper>
        <TabListTabList label="List of Tabs">
          {p.tabList.map((t) => <TabListTab id={t.id} controls={t.extras.join(" ")}>
            {t.label}
          </TabListTab>)}
        </TabListTabList>
        <TabListExtraList label="List of Extras">
          {p.extraList.map((e) => <TabListExtra id={e.id}>
            {e.label}
          </TabListExtra>)}
        </TabListExtraList>
      </TabListTabListWrapper>
      {p.panelList.map((p) => <TabListTabPanel labelledby={p.labelledby}>
        {p.content}
      </TabListTabPanel>)}
    </TabList>
  },
}
