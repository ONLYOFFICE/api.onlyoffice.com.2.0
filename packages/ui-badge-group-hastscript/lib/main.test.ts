import {type Component, h, render} from "@onlyoffice/hastscript"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {BadgeGroup} from "./main.ts"

test("BadgeGroup(): creates a badge group", () => {
  const a = h(BadgeGroup)
  const e = h("div", {class: "badge-group"})
  re(a, e)
})

test("BadgeGroup(): creates a badge group with properties", () => {
  const a = h(BadgeGroup, {id: "d", class: "c"})
  const e = h("div", {class: "badge-group c", id: "d"})
  re(a, e)
})

test("BadgeGroup(): creates a badge group with children", () => {
  const a = h(BadgeGroup, ["c"])
  const e = h("div", {class: "badge-group"}, ["c"])
  re(a, e)
})

test.run()

function re(a: Component, e: Component): void {
  eq(render(a), render(e))
}
