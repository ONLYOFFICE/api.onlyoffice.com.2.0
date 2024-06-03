import type {DocEditorConfig} from "@onlyoffice/document-server-types"
import {assert} from "@open-wc/testing"
import {html, js, json} from "./main.ts"

const {fail: un, strictEqual: is} = assert

it("html(): includes the url parameter", () => {
  const s = html("http://localhost/", {})
  is(s, `<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ONLYOFFICE Document Editor Code Sample</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style>body {height: 100vh; margin: 0}</style>
    <script src="http://localhost/web-apps/apps/api/documents/api.js"></script>
  </head>
  <body>
    <div id="placeholder"></div>
    <script type="module">
    const config = {}
    const editor = new DocsAPI.DocEditor("placeholder", config)
    </script>
  </body>
</html>`)
})

it("html(): throws an error if the url parameter is empty", () => {
  try {
    const s = html("", {})
    un(`Expected an error, but got ${s}`)
  } catch (e) {
    is(e instanceof Error && e.message, "The 'url' parameter is required, but it is missing")
  }
})

it("html(): throws an error if the url parameter does not have a trailing slash", () => {
  try {
    const s = html("http://localhost", {})
    un(`Expected an error, but got ${s}`)
  } catch (e) {
    is(e instanceof Error && e.message, "The 'url' parameter must have a trailing slash, but it does not")
  }
})

it("html(): includes config properties", () => {
  const p = properties()
  const s = html("http://localhost/", p)
  is(s, `<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ONLYOFFICE Document Editor Code Sample</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style>body {height: 100vh; margin: 0}</style>
    <script src="http://localhost/web-apps/apps/api/documents/api.js"></script>
  </head>
  <body>
    <div id="placeholder"></div>
    <script type="module">
    const config = {
      documentType: "word",
      height: "100%",
      width: "100%",
      document: {
        fileType: "docx",
        key: "xxx",
        title: "Untitled document",
        url: "http://localhost/document.docx"
      }
    }
    const editor = new DocsAPI.DocEditor("placeholder", config)
    </script>
  </body>
</html>`)
})

it("html(): includes config events", () => {
  const e = events()
  const s = html("http://localhost/", e)
  is(s, `<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ONLYOFFICE Document Editor Code Sample</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <style>body {height: 100vh; margin: 0}</style>
    <script src="http://localhost/web-apps/apps/api/documents/api.js"></script>
  </head>
  <body>
    <div id="placeholder"></div>
    <script type="module">
    const config = {
      events: {
        onAppReady() {
          console.log("Document Editor is ready")
        },
        onError(...args) {
          console.error("Document Editor error:", ...args)
        }
      }
    }
    const editor = new DocsAPI.DocEditor("placeholder", config)
    </script>
  </body>
</html>`)
})

it("js(): includes config properties", () => {
  const p = properties()
  const s = js(p)
  is(s, `const config = {
  documentType: "word",
  height: "100%",
  width: "100%",
  document: {
    fileType: "docx",
    key: "xxx",
    title: "Untitled document",
    url: "http://localhost/document.docx"
  }
}
const editor = new DocsAPI.DocEditor("placeholder", config)`)
})

it("js(): includes config events", () => {
  const e = events()
  const s = js(e)
  is(s, `const config = {
  events: {
    onAppReady() {
      console.log("Document Editor is ready")
    },
    onError(...args) {
      console.error("Document Editor error:", ...args)
    }
  }
}
const editor = new DocsAPI.DocEditor("placeholder", config)`)
})

it("json(): includes config properties", () => {
  const p = properties()
  const s = json(p)
  is(s, JSON.stringify(p, null, 2))
})

it("json(): does not include config events", () => {
  const e = events()
  const s = json(e)
  is(s, "{}")
})

function properties(): DocEditorConfig {
  return {
    documentType: "word",
    height: "100%",
    width: "100%",
    document: {
      fileType: "docx",
      key: "xxx",
      title: "Untitled document",
      url: "http://localhost/document.docx"
    }
  }
}

function events(): DocEditorConfig {
  return {
    events: {
      onAppReady() {
        console.log("Document Editor is ready")
      },
      onError(...args) {
        console.error("Document Editor error:", ...args)
      }
    }
  }
}
