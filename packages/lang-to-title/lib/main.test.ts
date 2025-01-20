import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {langToTitle} from "./main.ts"

test("langToTitle(): converts language to title", () => {
  const t = langToTitle("javascript")
  eq(t, "JavaScript")
})

test("langToTitle(): returns an empty string for an unknown language", () => {
  const t = langToTitle("unknown")
  eq(t, "")
})

test.run()
