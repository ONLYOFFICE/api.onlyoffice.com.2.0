import {Signature} from "@onlyoffice/site-signature"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"
import {Content} from "./main.tsx"

export default {
  title: "Site Patterns / Content",
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
  args: {
    variant: "default",
    signature: [
      {type: "string", text: '"markdown"'},
      {type: "text", text: " | "},
      {type: "string", text: '"html"'},
    ],
  },
  render(p) {
    return <Content>
      <Signature variant="inline" signature={p.signature} />
    </Content>
  },
}
