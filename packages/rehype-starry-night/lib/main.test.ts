import {all, createStarryNight} from "@wooorm/starry-night"
import rehypeParse from "rehype-parse"
import rehypeStringify from "rehype-stringify"
import remarkParse from "remark-parse"
import remarkRehype from "remark-rehype"
import {unified} from "unified"
import {is, unreachable} from "uvu/assert"
import {test} from "uvu"
import {rehypeStarryNight} from "./main.js"

const sn = await createStarryNight(all)

test("does not highlight an empty string", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("")
  is(f.toString(), "")
})

test("does not highlight a non-code element", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("<p></p>")
  is(f.toString(), "<p></p>")
})

test("does not highlight the pre element without a code element", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("<pre></pre>")
  is(f.toString(), "<pre></pre>")
})

test("does not highlight the code element without a pre element", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("<code></code>")
  is(f.toString(), "<code></code>")
})

test("does not highlight the code without a language", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("<pre><code></code></pre>")
  is(f.toString(), "<pre><code></code></pre>")
})

test("highlights the code with the language", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process('<pre><code class="language-js">"s"</code></pre>')
  is(f.toString(), '<pre><code class="language-js"><span class="pl-s"><span class="pl-pds">"</span>s<span class="pl-pds">"</span></span></code></pre>')
})

test("does not highlight the code with an unknown language", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process('<pre><code class="language-unknown">"s"</code></pre>')
  is(f.toString(), '<pre><code class="language-unknown">"s"</code></pre>')
})

test("fills in the messages when the language is unknown", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process('<pre><code class="language-unknown">"s"</code></pre>')
  const [m] = f.messages
  is(m.reason, "Cannot highlight 'unknown' syntax, grammar not available")
  is(m.ruleId, "missing-grammar")
  is(m.source, "@onlyoffice/rehype-starry-night")
})

test("does not highlight the code with a no-highlight option", async () => {
  const f = await unified()
    .data("settings", {fragment: true})
    .use(rehypeParse)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process('<pre><code class="language-js no-highlight">"s"</code></pre>')
  is(f.toString(), '<pre><code class="language-js no-highlight">"s"</code></pre>')
})

test("throws an error when Starry Night throws an error", async () => {
  const sn = await createStarryNight(all)
  sn.highlight = () => {
    throw new Error("Not implemented")
  }
  try {
    const f = await unified()
      .data("settings", {fragment: true})
      .use(rehypeParse)
      .use(rehypeStarryNight, sn)
      .use(rehypeStringify)
      .process('<pre><code class="language-js">"s"</code></pre>')
    unreachable(`Expected an error, got ${f}`)
  } catch (e) {
    if (!(e instanceof Error)) {
      unreachable(`Expected an error, got ${e}`)
      return
    }
    is(e.message, "Not implemented")
  }
})

test("integrates with remark", async () => {
  const f = await unified()
    .use(remarkParse)
    .use(remarkRehype)
    .use(rehypeStarryNight, sn)
    .use(rehypeStringify)
    .process("```js\n\"s\"\n```")
  is(f.toString(), '<pre><code class="language-js"><span class="pl-s"><span class="pl-pds">"</span>s<span class="pl-pds">"</span></span>\n</code></pre>')
})

test.run()
