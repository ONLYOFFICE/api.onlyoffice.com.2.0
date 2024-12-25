import {SpikyWow} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"

export default {
  title: "UI Assets / Mascots",
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
