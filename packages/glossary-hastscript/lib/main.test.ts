import {type Component, h, render} from "@onlyoffice/hastscript"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  Glossary,
  GlossaryDetails,
  GlossaryName,
  GlossaryTail,
  GlossaryTerm,
} from "./main.ts"

test("GlossaryDetails(): creates a glossary details", () => {
  const a = h(GlossaryDetails)
  const e = h("dd", {class: "glossary__details"})
  re(a, e)
})

test("GlossaryDetails(): creates a glossary details with properties", () => {
  const a = h(GlossaryDetails, {id: "d", class: "c"})
  const e = h("dd", {class: "glossary__details c", id: "d"})
  re(a, e)
})

test("GlossaryDetails(): creates a glossary details with children", () => {
  const a = h(GlossaryDetails, ["c"])
  const e = h("dd", {class: "glossary__details"}, ["c"])
  re(a, e)
})

test("GlossaryTail(): creates a glossary tail", () => {
  const a = h(GlossaryTail)
  const e = h("span", {class: "glossary__tail"})
  re(a, e)
})

test("GlossaryTail(): creates a glossary tail with properties", () => {
  const a = h(GlossaryTail, {id: "d", class: "c"})
  const e = h("span", {class: "glossary__tail c", id: "d"})
  re(a, e)
})

test("GlossaryTail(): creates a glossary tail with children", () => {
  const a = h(GlossaryTail, ["c"])
  const e = h("span", {class: "glossary__tail"}, ["c"])
  re(a, e)
})

test("GlossaryName(): creates a glossary name", () => {
  const a = h(GlossaryName)
  const e = h("span", {class: "glossary__name"})
  re(a, e)
})

test("GlossaryName(): creates a glossary name with properties", () => {
  const a = h(GlossaryName, {id: "d", class: "c"})
  const e = h("span", {class: "glossary__name c", id: "d"})
  re(a, e)
})

test("GlossaryName(): creates a glossary name with children", () => {
  const a = h(GlossaryName, ["c"])
  const e = h("span", {class: "glossary__name"}, ["c"])
  re(a, e)
})

test("GlossaryTerm(): creates a glossary term", () => {
  const a = h(GlossaryTerm)
  const e = h("dt", {class: "glossary__term"})
  re(a, e)
})

test("GlossaryTerm(): creates a glossary term with properties", () => {
  const a = h(GlossaryTerm, {id: "d", class: "c"})
  const e = h("dt", {class: "glossary__term c", id: "d"})
  re(a, e)
})

test("GlossaryTerm(): creates a glossary term with children", () => {
  const a = h(GlossaryTerm, ["c"])
  const e = h("dt", {class: "glossary__term"}, ["c"])
  re(a, e)
})

test("Glossary(): creates a glossary", () => {
  const a = h(Glossary)
  const e = h("dl", {class: "glossary"})
  re(a, e)
})

test("Glossary(): creates a glossary with properties", () => {
  const a = h(Glossary, {id: "d", class: "c"})
  const e = h("dl", {class: "glossary c", id: "d"})
  re(a, e)
})

test("Glossary(): creates a glossary with children", () => {
  const a = h(Glossary, ["c"])
  const e = h("dl", {class: "glossary"}, ["c"])
  re(a, e)
})

test.run()

function re(a: Component, e: Component): void {
  eq(render(a), render(e))
}
