import {Badge, BadgeGroup} from "@onlyoffice/ui-kit"
import {type Meta, type StoryObj} from "@storybook/preact"
import {h} from "preact"

export default {
  title: "UI Foundation / Badge Group",
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
    return <BadgeGroup>
      <Badge>first</Badge>
      <Badge>second</Badge>
      <Badge>third</Badge>
      <Badge>fourth</Badge>
      <Badge>fifth</Badge>
      <Badge>sixth</Badge>
      <Badge>seventh</Badge>
      <Badge>eighth</Badge>
      <Badge>ninth</Badge>
      <Badge>tenth</Badge>
      <Badge>eleventh</Badge>
      <Badge>twelfth</Badge>
      <Badge>thirteenth</Badge>
      <Badge>fourteenth</Badge>
      <Badge>fifteenth</Badge>
      <Badge>sixteenth</Badge>
    </BadgeGroup>
  },
}
