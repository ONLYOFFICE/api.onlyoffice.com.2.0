// todo: resuscitate stories
// Add a step to generate service fixtures for the browser environment.

import {Service} from "@onlyoffice/site-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "Site Composites / Service",
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
    // @ts-ignore todo
    return <Service declaration={{}} />
  },
}
