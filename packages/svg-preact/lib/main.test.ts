import {test} from "uvu"
import {equal as eq, unreachable as un} from "uvu/assert"
import {toJsFile, toTdsFile} from "./main.ts"

test("toJsFile(): throws an error if the name of the SVG component is missing", async () => {
  try {
    await toJsFile("", "")
    un("Expected an error")
  } catch (e) {
    eq(e instanceof Error && e.message, "The name of the SVG component is required")
  }
})

test("toJsFile(): converts an SVG file to a JS file", async () => {
  const a = await toJsFile("s", `<svg width="11" height="12" viewBox="0 0 11 12" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M3.5 10L7.5 6L3.5 2" stroke="currentColor" stroke-linecap="round" />
  </svg>`)

  const e = `import {h} from "preact";

export function s({
  title,
  titleId,
  desc,
  descId,
  ...props
}) {
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

  eq(a, e)
})

test("toDeclarationFile(): throws an error if the name of the SVG component is missing", () => {
  try {
    toTdsFile("")
    un("Expected an error")
  } catch (e) {
    eq(e instanceof Error && e.message, "The name of the SVG component is required")
  }
})

test("toDeclarationFile(): converts an SVG file to a TypeScript Declaration file", () => {
  const a = toTdsFile("s")

  const e = `import {type JSX} from "preact";

export interface sProperties extends JSX.SVGAttributes<SVGSVGElement> {
  title?: string;
  titleId?: string;
  desc?: string;
  descId?: string;
}

export declare function s(p: sProperties): JSX.Element;
`

  eq(a, e)
})

test.run()
