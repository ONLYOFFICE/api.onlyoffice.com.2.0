import {type Meta} from "@storybook/preact"
import {type JSX, h} from "preact"
import {OnlyofficeBetaLogo, OnlyofficeLogo} from "../dist/main.tsx"

export default {
  title: "UI/Logos",
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
    <OnlyofficeLogo height={38} />
    <OnlyofficeBetaLogo height={38} />
  </div>
}
