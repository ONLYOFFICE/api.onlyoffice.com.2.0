import {is} from "uvu/assert"
import {test} from "uvu"
import {substringPosition} from "./main.ts"

test("returns the zero position for an empty string", () => {
  const [c, l] = substringPosition("", "")
  is(c, 1)
  is(l, 0)
})

test("returns the negative position for a string that does not contain the substring", () => {
  const [c, l] = substringPosition("foo", "bar")
  is(c, -1)
  is(l, -1)
})

test("returns the position for a string that contains the substring", () => {
  const [c, l] = substringPosition("foo", "o")
  is(c, 1)
  is(l, 1)
})

test("returns the position for a multiline string that contains the substring", () => {
  const [c, l] = substringPosition("foo\nbar", "a")
  is(c, 2)
  is(l, 1)
})

test.run()
