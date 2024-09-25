import {test} from "uvu"
import {is, unreachable as un} from "uvu/assert"
import {toJsxFile} from "./main.ts"

test("toJsxFile: throws an error if the name of the SVG component is missing", async () => {
  try {
    await toJsxFile("", "")
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The name of the SVG component is required")
  }
})

test("toJsxFile: throws an error if the content of the SVG file is missing", async () => {
  try {
    await toJsxFile("s", "")
    un("Expected an error")
  } catch (e) {
    is(e instanceof Error && e.message, "The content of the SVG file is required")
  }
})

test("toJsxFile: converts an SVG file to a JSX component", async () => {
  const a = await toJsxFile("s", `
    <svg width="11" height="12" viewBox="0 0 11 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M3.5 10L7.5 6L3.5 2" stroke="currentColor" stroke-linecap="round" />
    </svg>
  `)

  const e = `import {type JSX, h} from "preact";

export function s({
  title,
  titleId,
  desc,
  descId,
  ...props
}: JSX.SVGAttributes<SVGSVGElement> & {title?: string, titleId?: string, desc?: string, descId?: string}): JSX.Element {
  // @ts-ignore i have no idea how to fix this properly
  return h("svg", Object.assign({
    xmlns: "http://www.w3.org/2000/svg",
    fill: "none",
    viewBox: "0 0 11 12",
    "aria-hidden": "true",
    "aria-labelledby": titleId,
    "aria-describedby": descId
  }, props), desc ? h("desc", {
    id: descId
  }, desc) : null, title ? h("title", {
    id: titleId
  }, title) : null, h("path", {
    stroke: "currentColor",
    "stroke-linecap": "round",
    d: "M3.5 10L7.5 6L3.5 2"
  }));
}
`

  is(a, e)
})

test.run()
