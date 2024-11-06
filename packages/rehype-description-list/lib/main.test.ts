import {readFile, readdir} from "node:fs/promises"
import path from "node:path"
import rehypeParse from "rehype-parse"
import rehypeStringify from "rehype-stringify"
import {unified} from "unified"
import {test} from "uvu"
import {is} from "uvu/assert"
import {rehypeDescriptionList} from "./main.js"

for (const [n, v, e] of await list()) {
  test(n, async () => {
    const f = await unified()
      .data("settings", {fragment: true})
      .use(rehypeParse)
      .use(rehypeDescriptionList)
      .use(rehypeStringify)
      .process(v)
    is(f.toString(), e)
  })
}

test.run()

type TestCase = [string, string, string]

async function list(): Promise<TestCase[]> {
  const a: TestCase[] = []
  const d = await readdir("fixtures")
  for (const n of d) {
    const e = path.extname(n)
    const p = path.basename(n, e)
    const s = await readFile(`fixtures/${n}`, "utf8")
    const c = create(p, s)
    a.push(c)
  }
  return a
}

function create(p: string, s: string): TestCase {
  let [n, m, h] = s.split("\n---\n")
  n = n.slice(0, -1)
  m = m.slice(1).slice(0, -1)
  h = h.slice(1).slice(0, -1)
  return [`${p}: ${n}`, m, h]
}
