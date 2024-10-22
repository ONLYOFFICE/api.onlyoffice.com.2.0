import {CancelIcon, MagnifyingGlassIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {
  TextInput,
  TextInputAction,
  TextInputControl,
  TextInputLeading,
  TextInputPlaceholder,
  type TextInputProperties,
  TextInputTrailing,
} from "./main.tsx"

export default {
  title: "UI Foundation / Text Input",
} satisfies Meta

export function Default(): JSX.Element {
  const sizes: TextInputProperties["size"][] =
    ["small", "medium", "large", "xlarge", "default", undefined]

  return <div
    style={{
      display: "inline-flex",
      flexDirection: "column",
      rowGap: "var(--base-size-12)",
    }}
  >
    {sizes.map((size) => <div
      style={{
        alignItems: "center",
        columnGap: "var(--base-size-12)",
        display: "inline-flex",
      }}
    >
      <TextInput size={size}>
        <TextInputLeading>
          <MagnifyingGlassIcon />
        </TextInputLeading>
        <TextInputPlaceholder>
          placeholder
        </TextInputPlaceholder>
        <TextInputControl>
          <input type="text" />
        </TextInputControl>
        <TextInputTrailing>
          <TextInputAction>
            <button type="button">
              <CancelIcon />
            </button>
          </TextInputAction>
        </TextInputTrailing>
      </TextInput>
      <span>size: {String(size)}</span>
    </div>)}
  </div>
}
