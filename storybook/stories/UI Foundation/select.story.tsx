import {Select, SelectCombobox, SelectListbox, SelectOption} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"

export default {
  title: "UI Foundation / Select",
} satisfies Meta

export function Default(): JSX.Element {
  return <Select>
    <SelectCombobox>Default option</SelectCombobox>
    <SelectListbox>
      <SelectOption value="default-option" selected={true}>Default option</SelectOption>
      <SelectOption value="first-option">First option</SelectOption>
      <SelectOption value="second-option">Second option</SelectOption>
      <SelectOption value="third-option">Third option</SelectOption>
      <SelectOption value="fourth-option">Fourth option</SelectOption>
      <SelectOption value="fifth-option">Fifth option</SelectOption>
      <SelectOption value="sixth-option">Sixth option</SelectOption>
      <SelectOption value="seventh-option">Seventh option</SelectOption>
      <SelectOption value="eighth-option">Eighth option</SelectOption>
      <SelectOption value="ninth-option">Ninth option</SelectOption>
      <SelectOption value="tenth-option">Tenth option</SelectOption>
    </SelectListbox>
  </Select>
}
