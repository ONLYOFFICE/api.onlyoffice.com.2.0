import {ESLint} from "@onlyoffice/eslint-config"
import {langToExt} from "@onlyoffice/lang-to-ext"
import {type Code, type Nodes} from "mdast"
import {visit} from "unist-util-visit"

const e = new ESLint({fix: true})

export async function eslint(n: Nodes): Promise<void> {
  const a: Promise<void>[] = []

  visit(n, "code", (n) => {
    const p = lint(n)
    a.push(p)
  })

  await Promise.all(a)
}

async function lint(n: Code): Promise<void> {
  if (!n.lang || !n.value) {
    return
  }

  const x = langToExt(n.lang)
  // It is too complicated to cover this branch with tests.
  /* c8 ignore next */
  if (!x) {
    return
  }

  const a = await e.lintText(n.value, {filePath: `.md/${x}`})
  // It is too complicated to cover this branch with tests.
  /* c8 ignore next */
  if (a.length === 0) {
    return
  }

  const [r] = a
  // It is too complicated to cover this branch with tests.
  /* c8 ignore next */
  if (!r.output) {
    return
  }

  n.value = r.output.trimEnd()
}
