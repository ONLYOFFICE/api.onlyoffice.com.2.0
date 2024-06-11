import "@onlyoffice/ui-select/client.ts"
import colors from "@onlyoffice/ui-colors/main.css?inline"
import select from "@onlyoffice/ui-select/main.css?inline"
import {
  Select,
  SelectCombobox,
  SelectListbox,
  SelectOption
} from "@onlyoffice/ui-select"
import type {Meta} from "@storybook/preact"
import type {JSX} from "preact"
import {h} from "preact"
import formControl from "./main.css?inline"
import {FormControl, FormControlControl, FormControlLabel} from "./main.tsx"

const meta: Meta = {
  title: "UI/Form Control",
  parameters: {styles: [colors, formControl, select]}
}

export function Composition(): JSX.Element {
  return <p>
    <FormControl for="control">
      <FormControlLabel>Label</FormControlLabel>
      <FormControlControl>
        <Select>
          <SelectCombobox>Default option</SelectCombobox>
          <SelectListbox>
            <SelectOption value="default-option" selected={true}>Default option</SelectOption>
            <SelectOption value="first-option">First option</SelectOption>
          </SelectListbox>
        </Select>
      </FormControlControl>
    </FormControl>
  </p>
}

export default meta
