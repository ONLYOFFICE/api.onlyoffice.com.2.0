import {type Text} from "hast"
import {test} from "uvu"
import {is} from "uvu/assert"
import {isNewlineText} from "./main.ts"

interface Is {
  (u: unknown): boolean
}

const pairs: [Is, Text][] = [
  [isNewlineText, {type: "text", value: "\n"}],
]

for (const [xi, xt] of pairs) {
  test(`${xi.name}(): returns true for the '${xt.value}' value`, () => {
    const a = xi(xt)
    is(a, true)
  })

  for (const [yi, yt] of pairs) {
    if (xi === yi) {
      continue
    }

    test(`${xi.name}(): returns false for the '${yt.value}' value`, () => {
      const a = xi(xt)
      is(a, false)
    })
  }
}

test.run()
