import {type Component, h, render} from "@onlyoffice/hastscript"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Badge, BadgeCaption} from "./main.ts"

test("BadgeCaption(): creates a badge caption", () => {
  const a = h(BadgeCaption)
  const e = h("span", {class: "badge__caption"})
  re(a, e)
})

test("BadgeCaption(): creates a badge caption with properties", () => {
  const a = h(BadgeCaption, {id: "d", class: "c"})
  const e = h("span", {class: "badge__caption c", id: "d"})
  re(a, e)
})

test("BadgeCaption(): creates a badge caption with children", () => {
  const a = h(BadgeCaption, ["c"])
  const e = h("span", {class: "badge__caption"}, ["c"])
  re(a, e)
})

test("Badge(): creates a badge", () => {
  const a = h(Badge)
  const e = h("span", {class: "badge"})
  re(a, e)
})

test("Badge(): creates a badge with properties", () => {
  const a = h(Badge, {id: "d", class: "c"})
  const e = h("span", {class: "badge c", id: "d"})
  re(a, e)
})

test("Badge(): creates a badge with children", () => {
  const a = h(Badge, ["c"])
  const e = h("span", {class: "badge"}, ["c"])
  re(a, e)
})

test("Badge(): creates a badge with a variant", () => {
  const a = h(Badge, {variant: "default"})
  const e = h("span", {class: "badge badge_variant_default"})
  re(a, e)
})

test.run()

function re(a: Component, e: Component): void {
  eq(render(a), render(e))
}
