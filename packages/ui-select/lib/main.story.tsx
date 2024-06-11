import "./client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import select from "./main.css?inline"
import {Select, SelectCombobox, SelectListbox, SelectOption} from "./main.tsx"

const meta: Meta = {
  title: "UI/Select",
  parameters: {styles: [colors, select]}
}

export function Composition(): JSX.Element {
  return <p>
    <Select>
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
  </p>
}

export default meta
