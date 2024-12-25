import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {langToExt} from "./main.ts"

test("langToExt(): converts language to file extension", () => {
  const e = langToExt("javascript")
  eq(e, ".js")
})

test("langToExt(): returns an empty string for an unknown language", () => {
  const e = langToExt("unknown")
  eq(e, "")
})

test.run()
