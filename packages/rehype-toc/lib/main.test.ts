import {type Root} from "hast"
import rehypeParse from "rehype-parse"
import rehypeStringify from "rehype-stringify"
import {type Processor, unified} from "unified"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {TocHeading, rehypeToc} from "./main.ts"

test("ignores an empty document", async () => {
  const p = setup()
  const f = await p.process("")
  eq(f.data, {})
})

test("does not create a toc for a document without headings", async () => {
  const p = setup()
  const f = await p.process("<p>foo</p>")
  eq(f.data, {})
})

test("creates a toc for a document with headings", async () => {
  const p = setup()

  const f = await p.process(`
    <h1>x1</h1>
    <h2 id="2">x2</h2>
    <h3>x3</h3>
    <h4 id="4">x4</h4>
    <h5>x5</h5>
    <h6 id="6">x6</h6>
  `)

  const e: TocHeading[] = []

  let h = new TocHeading()
  h.level = 1
  h.text = "x1"
  e.push(h)

  h = new TocHeading()
  h.level = 2
  h.id = "2"
  h.text = "x2"
  e.push(h)

  h = new TocHeading()
  h.level = 3
  h.text = "x3"
  e.push(h)

  h = new TocHeading()
  h.level = 4
  h.id = "4"
  h.text = "x4"
  e.push(h)

  h = new TocHeading()
  h.level = 5
  h.text = "x5"
  e.push(h)

  h = new TocHeading()
  h.level = 6
  h.id = "6"
  h.text = "x6"
  e.push(h)

  eq(f.data.toc, e)
})

function setup(): Processor<Root, undefined, undefined, Root, string> {
  return unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeToc)
    .use(rehypeStringify)
    .freeze()
}

test.run()
