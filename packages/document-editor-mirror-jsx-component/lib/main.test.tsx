import {render} from "preact-render-to-string"
import {h} from "preact"
import {is} from "uvu/assert"
import {test} from "uvu"
import {DocumentEditorMirror} from "./main.tsx"

test("renders an empty document-editor-mirror element", () => {
  const m = <DocumentEditorMirror />
  const s = render(m)
  is(s, "<document-editor-mirror></document-editor-mirror>")
})

test("renders a document-editor-mirror element with children", () => {
  const m = <DocumentEditorMirror>hi</DocumentEditorMirror>
  const s = render(m)
  is(s, "<document-editor-mirror>hi</document-editor-mirror>")
})

test("renders a document-editor-mirror element with attributes", () => {
  const m = <DocumentEditorMirror class="foo" />
  const s = render(m)
  is(s, '<document-editor-mirror class="foo"></document-editor-mirror>')
})

test.run()
