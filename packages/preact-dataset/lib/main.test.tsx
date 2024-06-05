import {h} from "preact"
import {render} from "preact-render-to-string"
import {is} from "uvu/assert"
import {test} from "uvu"
import {useDataset} from "./main.ts"

test("returns an empty object when the dataset is not provided", () => {
  const d = useDataset({})
  const s = render(<div {...d} />)
  is(s, "<div></div>")
})

test("returns an empty object when the dataset is an empty object", () => {
  const d = useDataset({dataset: {}})
  const s = render(<div {...d} />)
  is(s, "<div></div>")
})

test("converts a single key-value pair to a data attribute", () => {
  const d = useDataset({dataset: {foo: "bar"}})
  const s = render(<div {...d} />)
  is(s, '<div data-foo="bar"></div>')
})

test("converts multiple key-value pairs to data attributes", () => {
  const d = useDataset({dataset: {foo: "bar", bar: "baz"}})
  const s = render(<div {...d} />)
  is(s, '<div data-foo="bar" data-bar="baz"></div>')
})

test.run()
