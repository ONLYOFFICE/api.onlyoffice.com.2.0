import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {cloneConfig} from "@onlyoffice/document-server-utils"
import {toString} from "@onlyoffice/object-to-string"

export function html(url: string, config: DocEditorConfig): string {
  if (url === "") {
    throw new Error("The 'url' parameter is required, but it is missing")
  }
  if (!url.endsWith("/")) {
    throw new Error("The 'url' parameter must have a trailing slash, but it does not")
  }

  const u = new URL("web-apps/apps/api/documents/api.js", url)
  const s = js(config)

  return `<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ONLYOFFICE Document Editor Code Sample</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style>body {height: 100vh; margin: 0}</style>
    <script src="${u}"></script>
  </head>
  <body>
    <div id="placeholder"></div>
    <script type="module">
${indent(s, 4, " ")}
    </script>
  </body>
</html>`
}

export function js(config: DocEditorConfig): string {
  const c = cloneConfig(config)
  return `const config = ${toString(c)}
const editor = new DocsAPI.DocEditor("placeholder", config)`
}

export function json(config: DocEditorConfig): string {
  const c = cloneConfig(config)
  if (c.events) {
    delete c.events
  }
  return JSON.stringify(c, null, 2)
}

function indent(s: string, n: number, c: string): string {
  const a = s.split("\n")
  const b: string[] = []
  for (let l of a) {
    if (l.length !== 0) {
      const p = c.repeat(n)
      l = p + l
    }
    b.push(l)
  }
  return b.join("\n")
}
