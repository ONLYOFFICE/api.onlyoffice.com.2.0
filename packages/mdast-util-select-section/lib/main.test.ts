import {fromMarkdown} from "mdast-util-from-markdown"
import {toMarkdown} from "mdast-util-to-markdown"
import {test} from "uvu"
import {is} from "uvu/assert"
import {selectSection} from "./main.ts"

const cs: [string, string, string][] = [
  ["", "", ""],
  ["", "h", ""],
  ["h", "h", ""],
  ["## h", "h", ""],
  [j("## h", "a"), "h", "a"],
  [j("## H", "a"), "h", "a"],
  [j("## h", "a"), " h ", "a"],
  [j("## h", "a", "b"), "h", j("a", "b")],
  [j("## h", "a", "## h", "b"), "h", "a"],
  [j("# h", "a", "## h", "b"), "h", "b"],
]

for (const [a, h, e] of cs) {
  test(`selectSection(): selects section '${h}' from '${a}'`, () => {
    const x = fromMarkdown(a)
    const y = selectSection(h, x)
    let z = toMarkdown(y)
    if (z.endsWith("\n")) {
      z = z.slice(0, -1)
    }
    is(z, e)
  })
}

test.run()

function j(...a: string[]): string {
  return a.join("\n\n")
}
