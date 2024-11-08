import {fromMarkdown} from "mdast-util-from-markdown"
import {toMarkdown} from "mdast-util-to-markdown"
import {test} from "uvu"
import {is} from "uvu/assert"
import {firstSentence} from "./main.ts"

const cs: [string, string][] = [
  ["", ""],
  ["# h\n\na", ""],
  ["a", "a."],
  ["a. b", "a."],
  ["a\n\nb", "a."],
  ["a. b\n\nc. d", "a."],
  ["**a. b**", "**a.**"],
  ["**a*b. c*d**", "**a*b.***"],
]

for (const [a, e] of cs) {
  test(`firstSentence(): from '${a}' to '${e}'`, () => {
    const x = fromMarkdown(a)
    const y = firstSentence(x)
    let z = toMarkdown(y)
    if (z.endsWith("\n")) {
      z = z.slice(0, -1)
    }
    is(z, e)
  })
}

test.run()
