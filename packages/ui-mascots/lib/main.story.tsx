import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {SpikyWow} from "../dist/main.tsx"

export default {
  title: "UI/Mascots",
} satisfies Meta

export function Default(): JSX.Element {
  return <div
    style={{
      alignItems: "start",
      display: "flex",
      flexDirection: "column",
      gap: 20,
    }}
  >
    <SpikyWow height={203} />
  </div>
}
