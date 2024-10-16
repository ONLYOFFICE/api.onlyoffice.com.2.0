import {test} from "uvu"
import {is} from "uvu/assert"
import {calc} from "./main.ts"

test("calc: calculates zero value for an empty string", () => {
  const v = calc("")
  is(v, 0)
})

test("calc: calculates zero value for an invalid string", () => {
  const v = calc("invalid")
  is(v, 0)
})

test("calc: calculates zero value for an empty calc statement", () => {
  const v = calc("calc()")
  is(v, 0)
})

test("calc: calculates calc statement with an integer value", () => {
  const v = calc("calc(1)")
  is(v, 1)
})

test("calc: calculates calc statement with a float value", () => {
  const v = calc("calc(1.1)")
  is(v, 1.1)
})

test("calc: calculates calc statement with a pixel value", () => {
  const v = calc("calc(1px)")
  is(v, 1)
})

test("calc: calculates calc statement with the plus operator", () => {
  const v = calc("calc(1px + 1px)")
  is(v, 2)
})

test("calc: calculates calc statement with the minus operator", () => {
  const v = calc("calc(1px - 1px)")
  is(v, 0)
})

test.run()
