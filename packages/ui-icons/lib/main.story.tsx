import type {Meta} from "@storybook/preact"
import {type JSX, Fragment, h} from "preact"
import * as poor24 from "../dist/poor/24.tsx"
import * as rich24 from "../dist/rich/24.tsx"
import * as rich32 from "../dist/rich/32.tsx"
import * as rich48 from "../dist/rich/48.tsx"
import * as rich64 from "../dist/rich/64.tsx"

const meta: Meta = {
  title: "UI/Icons"
}

export function Composition(): JSX.Element {
  return <>{[
    ["Poor", 24, poor24],
    ["Rich", 24, rich24],
    ["Rich", 32, rich32],
    ["Rich", 48, rich48],
    ["Rich", 64, rich64]
  ].map(([title, w, icons]) => <>
    <h2>{title} {w}x{w}</h2>
    <div style={{display: "flex", gap: 20}}>
      {Object.values(icons).map((Icon) => <Icon width={w} height={w} />)}
    </div>
  </>)}</>
}

export default meta
