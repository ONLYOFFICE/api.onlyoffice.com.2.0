import {h} from "hastscript"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {
  type Children,
  type Component,
  Fragment as F,
  Spacer as S,
  c,
  isComponent,
  h as j,
  render,
} from "./builder.ts"

test("isComponent(): returns true for a component with a primitive source", () => {
  const d = c("div", {}, [])
  const a = isComponent(d)
  eq(a, true)
})

test("isComponent(): returns true for a component with a component source", () => {
  const d = c(D, {}, [])
  const a = isComponent(d)
  eq(a, true)
})

test("Fragment(): creates a root unist node", () => {
  // eslint-disable-next-line new-cap
  const a = F({}, [])
  const e = c("root", {}, [])
  eq(a, e)
})

test("Fragment(): ignores properties", () => {
  // eslint-disable-next-line new-cap
  const a = F({id: "f"}, [])
  const e = c("root", {}, [])
  eq(a, e)
})

test("Fragment(): creates a root node with children", () => {
  // eslint-disable-next-line new-cap
  const a = F({}, [j("div")])
  const e = c("root", {}, [c("div", {}, [])])
  eq(a, e)
})

test("h(): creates a div component by default", () => {
  // @ts-ignore the error is valid, the signature is not
  const a = j()
  const e = c("div", {}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source", () => {
  const a = j("div")
  const e = c("div", {}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source and empty properties", () => {
  const a = j("div", {})
  const e = c("div", {}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source and empty children", () => {
  const a = j("div", [])
  const e = c("div", {}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source, empty properties, and empty children", () => {
  const a = j("div", {}, [])
  const e = c("div", {}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source and non-empty properties", () => {
  const a = j("div", {id: "d"})
  const e = c("div", {id: "d"}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source, non-empty properties, and empty children", () => {
  const a = j("div", {id: "d"}, [])
  const e = c("div", {id: "d"}, [])
  eq(a, e)
})

test("h(): creates a component with a primitive source and non-empty children", () => {
  const a = j("div", [j("span")])
  const e = c("div", {}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a primitive source, empty properties, and non-empty children", () => {
  const a = j("div", {}, [j("span")])
  const e = c("div", {}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a primitive source, non-empty properties, and non-empty children", () => {
  const a = j("div", {id: "d"}, [j("span")])
  const e = c("div", {id: "d"}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a component source", () => {
  const a = j(D)
  const e = c(D, {}, [])
  eq(a, e)
})

test("h(): creates a component with a component source and empty properties", () => {
  const a = j(D, {})
  const e = c(D, {}, [])
  eq(a, e)
})

test("h(): creates a component with a component source and empty children", () => {
  const a = j(D, [])
  const e = c(D, {}, [])
  eq(a, e)
})

test("h(): creates a component with a component source, empty properties, and empty children", () => {
  const a = j(D, {}, [])
  const e = c(D, {}, [])
  eq(a, e)
})

test("h(): creates a component with a component source and non-empty properties", () => {
  const a = j(D, {id: "d"})
  const e = c(D, {id: "d"}, [])
  eq(a, e)
})

test("h(): creates a component with a component source, non-empty properties, and empty children", () => {
  const a = j(D, {id: "d"}, [])
  const e = c(D, {id: "d"}, [])
  eq(a, e)
})

test("h(): creates a component with a component source and non-empty children", () => {
  const a = j(D, [j("span")])
  const e = c(D, {}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a component source, empty properties, and non-empty children", () => {
  const a = j(D, {}, [j("span")])
  const e = c(D, {}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a component source, non-empty properties, and non-empty children", () => {
  const a = j(D, {id: "d"}, [j("span")])
  const e = c(D, {id: "d"}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with a primitive child", () => {
  const a = j("div", ["s"])
  const e = c("div", {}, ["s"])
  eq(a, e)
})

test("h(): creates a component with a component child", () => {
  const a = j("div", [j("span")])
  const e = c("div", {}, [c("span", {}, [])])
  eq(a, e)
})

test("h(): creates a component with an element child", () => {
  const a = j("div", [h("span")])
  const e = c("div", {}, [h("span")])
  eq(a, e)
})

test("h(): passes empty properties to the component source by default", () => {
  const a = j(D)
  const e = c(D, {}, [])
  eq(a, e)

  function D(p: object): Component {
    eq(p, {})
    return c("div", p, [])
  }
})

test("h(): passes empty children to the component source by default", () => {
  const a = j(D)
  const e = c(D, {}, [])
  eq(a, e)

  function D(_: object, ch: Children): Component {
    eq(ch, [])
    return c("div", {}, ch)
  }
})

test("h(): passes the properties to the component source", () => {
  const a = j(D, {id: "d"})
  const e = c(D, {id: "d"}, [])
  eq(a, e)

  function D(p: object): Component {
    eq(p, {id: "d"})
    return c("div", p, [])
  }
})

test("h(): passes the children to the component source", () => {
  const a = j(D, [j("span")])
  const e = c(D, {}, [c("span", {}, [])])
  eq(a, e)

  function D(_: object, ch: Children): Component {
    eq(ch, [c("span", {}, [])])
    return c("div", {}, ch)
  }
})

test("h(): passes the properties and children to the component source", () => {
  const a = j(D, {id: "d"}, [j("span")])
  const e = c(D, {id: "d"}, [c("span", {}, [])])
  eq(a, e)

  function D(p: object, ch: Children): Component {
    eq(p, {id: "d"})
    eq(ch, [c("span", {}, [])])
    return c("div", p, ch)
  }
})

test("Spacer(): creates a spacer component", () => {
  // eslint-disable-next-line new-cap
  const a = S({}, [])
  const e = c(F, {}, ["\n", "\n"])
  eq(a, e)
})

test("Spacer(): ignores properties", () => {
  // eslint-disable-next-line new-cap
  const a = S({id: "s"}, [])
  const e = c(F, {}, ["\n", "\n"])
  eq(a, e)
})

test("Spacer(): ignores children", () => {
  // eslint-disable-next-line new-cap
  const a = S({}, [j("div")])
  const e = c(F, {}, ["\n", c("div", {}, []), "\n"])
  eq(a, e)
})

test("render(): renders a component with a primitive source", () => {
  const a = j("div")
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a primitive source and empty properties", () => {
  const a = j("div", {})
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a primitive source and empty children", () => {
  const a = j("div", [])
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a primitive source, empty properties, and empty children", () => {
  const a = j("div", {}, [])
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a primitive source and non-empty properties", () => {
  const a = j("div", {id: "d"})
  const e = h("div", {id: "d"})
  re(a, e)
})

test("render(): renders a component with a primitive source, non-empty properties, and empty children", () => {
  const a = j("div", {id: "d"}, [])
  const e = h("div", {id: "d"})
  re(a, e)
})

test("render(): renders a component with a primitive source and non-empty children", () => {
  const a = j("div", [j("span")])
  const e = h("div", {}, [h("span")])
  re(a, e)
})

test("render(): renders a component with a primitive source, empty properties, and non-empty children", () => {
  const a = j("div", {}, [j("span")])
  const e = h("div", {}, [h("span")])
  re(a, e)
})

test("render(): renders a component with a primitive source, non-empty properties, and non-empty children", () => {
  const a = j("div", {id: "d"}, [j("span")])
  const e = h("div", {id: "d"}, [h("span")])
  re(a, e)
})

test("render(): renders a component with a component source", () => {
  const a = j(D)
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a component source and empty properties", () => {
  const a = j(D, {})
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a component source and empty children", () => {
  const a = j(D, [])
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a component source, empty properties, and empty children", () => {
  const a = j(D, {}, [])
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a component source and non-empty properties", () => {
  const a = j(D, {id: "d"})
  const e = h("div", {id: "d"})
  re(a, e)
})

test("render(): renders a component with a component source, non-empty properties, and empty children", () => {
  const a = j(D, {id: "d"}, [])
  const e = h("div", {id: "d"})
  re(a, e)
})

test("render(): renders a component with a component source and non-empty children", () => {
  const a = j(D, [j("span")])
  const e = h("div", {}, [h("span")])
  re(a, e)
})

test("render(): renders a component with a component source, empty properties, and non-empty children", () => {
  const a = j(D, {}, [j("span")])
  const e = h("div", {}, [h("span")])
  re(a, e)
})

test("render(): renders a component with a component source, non-empty properties, and non-empty children", () => {
  const a = j(D, {id: "d"}, [j("span")])
  const e = h("div", {id: "d"}, [h("span")])
  re(a, e)
})

test("render(): omits an undefined child", () => {
  const a = j("div", [undefined])
  const e = h("div")
  re(a, e)
})

test("render(): omits a null child", () => {
  const a = j("div", [null])
  const e = h("div")
  re(a, e)
})

test("render(): omits a true child", () => {
  const a = j("div", [true])
  const e = h("div")
  re(a, e)
})

test("render(): omits a false child", () => {
  const a = j("div", [false])
  const e = h("div")
  re(a, e)
})

test("render(): renders a component with a number child", () => {
  const a = j("div", [1])
  const e = h("div", ["1"])
  re(a, e)
})

test("render(): renders a component with a string child", () => {
  const a = j("div", ["s"])
  const e = h("div", ["s"])
  re(a, e)
})

test("render(): renders a component with a component child", () => {
  const a = j("div", [j("span")])
  const e = h("div", [h("span")])
  re(a, e)
})

test("render(): renders a component with an element child", () => {
  const a = j("div", [h("span")])
  const e = h("div", [h("span")])
  re(a, e)
})

test("render(): omits fragments but preserves their children", () => {
  const a = j("div", [j(F, [j("span"), j(F, [j("span", [j(F)]), j(F)])])])
  const e = h("div", [h("span"), h("span")])
  re(a, e)
})

test("render(): omits fragments and selects a child if there is only one", () => {
  const a = j(F, [j(F), j(F, [j("div")]), j(F)])
  const e = h("div")
  re(a, e)
})

test("render(): preserves a root unist node if there is more than one child", () => {
  const a = j(F, [j(F), j(F, [j("div"), j("div")]), j(F)])
  const e = {type: "root", children: [h("div"), h("div")]}
  re(a, e)
})

test.run()

function D(p: object, ch: Children): Component {
  return c("div", p, ch)
}

function re(a: Component, e: unknown): void {
  eq(render(a), e)
}
