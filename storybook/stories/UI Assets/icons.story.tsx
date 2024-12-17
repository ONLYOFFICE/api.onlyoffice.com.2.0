import * as poor12 from "@onlyoffice/ui-icons/poor/12.js"
import * as poor24 from "@onlyoffice/ui-icons/poor/24.js"
import * as rich24 from "@onlyoffice/ui-icons/rich/24.js"
import * as rich32 from "@onlyoffice/ui-icons/rich/32.js"
import * as rich48 from "@onlyoffice/ui-icons/rich/48.js"
import * as rich64 from "@onlyoffice/ui-icons/rich/64.js"
import {type Meta} from "@storybook/preact"
import {Fragment, type JSX, h} from "preact"

export default {
  title: "UI Assets / Icons",
} satisfies Meta

export function Default(): JSX.Element {
  return <>{[
    ["Poor", 12, poor12],
    ["Poor", 24, poor24],
    ["Rich", 24, rich24],
    ["Rich", 32, rich32],
    ["Rich", 48, rich48],
    ["Rich", 64, rich64],
  ].map(([title, w, icons]) => <>
    <h2>{title} {w}x{w}</h2>
    <div style={{display: "flex", gap: 20}}>
      {Object.values(icons).map((Icon) => <Icon width={w} height={w} />)}
    </div>
  </>)}</>
}
