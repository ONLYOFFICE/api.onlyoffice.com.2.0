import type {Root} from "mdast"
import rehypeStringify from "rehype-stringify"
import remarkParse from "remark-parse"
import remarkRehype from "remark-rehype"
import {unified} from "unified"
import {visit} from "unist-util-visit"
import {is, unreachable} from "uvu/assert"
import {test} from "uvu"
import {remarkDocumentBuilder} from "./main.ts"

test("does nothing if no option is specified", async () => {
  const c = "```\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(through)
    .process(c)
  const r = f.result as Root
  const [code] = r.children
  is(code.data, undefined)
})

test("does nothing if no language is specified", async () => {
  const c = "``` use-document-builder\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(through)
    .process(c)
  const r = f.result as Root
  const [code] = r.children
  is(code.data, undefined)
})

test("does not exposes the data property if not language is specified", async () => {
  const c = "``` use-document-builder\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(remarkRehype)
    .use(rehypeStringify)
    .process(c)
  is(f.value, '<pre><code class="language-use-document-builder"></code></pre>')
})

test("populates hProperties if a language is specified", async () => {
  const c = "```js use-document-builder\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(through)
    .process(c)

  const r = f.result as Root
  const [code] = r.children

  const d = code.data
  if (!d) {
    unreachable("Expected data on code node")
    return
  }

  const p = d.hProperties
  if (!p) {
    unreachable("Expected hProperties on code node")
    return
  }

  is(p.dataUseDocumentBuilder, true)
})

test("does not overrides hProperties if they already exist", async () => {
  const c = "```js use-document-builder\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(() => {
      return function transform(tree: Root) {
        visit(tree, "code", (node) => {
          node.data = {hProperties: {a: "b"}}
        })
      }
    })
    .use(remarkDocumentBuilder)
    .use(through)
    .process(c)

  const r = f.result as Root
  const [code] = r.children

  const d = code.data
  if (!d) {
    unreachable("Expected data on code node")
    return
  }

  const p = d.hProperties
  if (!p) {
    unreachable("Expected hProperties on code node")
    return
  }

  is(p.a, "b")
})

test("exposes the data property if a language is specified", async () => {
  const c = "```js use-document-builder\n\n```"
  const f = await unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(remarkRehype)
    .use(rehypeStringify)
    .process(c)
  is(f.value, '<pre><code class="language-js" data-use-document-builder></code></pre>')
})

test.run()

// Defining types for this is quite difficult, but it is not essential.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
function through(this: any): void {
  this.compiler = function compiler(tree: unknown): unknown {
    return tree
  }
}
