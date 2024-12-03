import {type Context} from "@onlyoffice/eleventy-types"
import {h} from "preact"
import {Html} from "../internal/html.tsx"
import {renderToString} from "../internal/preact.ts"
import {isWritten} from "../internal/url.ts"

export async function render(c: Context): Promise<string> {
  if (!isWritten(c)) {
    return "This page should not be rendered"
  }
  const e = <Html
    title={c.title}
    description={c.description}
    generator={c.eleventy.generator}
  >
    {c.content}
  </Html>
  const s = await renderToString(e)
  return `<!DOCTYPE html>${s}`
}
