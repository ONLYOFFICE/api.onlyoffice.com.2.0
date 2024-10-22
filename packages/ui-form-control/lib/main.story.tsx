import {CloseIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {Default as SelectStory} from "../../ui-select/lib/main.story.tsx"
import {
  FormControl,
  FormControlAction,
  FormControlControl,
  FormControlLabel,
} from "./main.tsx"

export default {
  title: "UI Foundation / Form Control",
} satisfies Meta

export function Default(): JSX.Element {
  return <FormControl for="control">
    <FormControlLabel>Label</FormControlLabel>
    <FormControlAction>
      <button type="button">
        <CloseIcon height={16} width={16} />
      </button>
    </FormControlAction>
    <FormControlControl>
      <SelectStory />
    </FormControlControl>
  </FormControl>
}
