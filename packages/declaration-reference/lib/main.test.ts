import {equal as eq, is} from "uvu/assert"
import {test} from "uvu"
import {reference} from "./main.ts"

test("creates a reference with correct order of keys", () => {
  const r = reference("")
  const a = Object.keys(r)
  eq(a, ["id"])
})

test("creates a reference with id", () => {
  const r = reference("id")
  is(r.id, "id")
})

test.run()
