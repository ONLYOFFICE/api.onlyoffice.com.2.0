import {h} from "hastscript"
import {test} from "uvu"
import {equal as eq, is} from "uvu/assert"
import {type Component, h as j, render} from "./builder.ts"
import {createContext, useContext} from "./context.ts"

test("createContext(): creates a new context", () => {
  const c = createContext("")
  is(typeof c.id, "string")
  is(c.dv, "")
  is(typeof c.Provider, "function")
  is(typeof c.Destroyer, "function")
})

test("createContext(): creates a new context with unique id", () => {
  const a = createContext("")
  const b = createContext("")
  is(a.id !== b.id, true)
})

test("Provider(): renders children", () => {
  const c = createContext("")
  const a = j(c.Provider, {value: "a"}, [j("div")])
  const e = h("div")
  re(a, e)
})

test("Provider(): includes a destroyer", () => {
  const c = createContext("")
  // eslint-disable-next-line new-cap
  const t = c.Provider({value: ""}, [])
  const [a] = t.children
  const e = j(c.Destroyer)
  eq(a, e)
})

test("Destroyer(): destroys the context", () => {
  const c = createContext("")
  const t = j(c.Provider, {value: "a"}, [j(c.Destroyer), j(C)])
  render(t)

  function C(): Component {
    const v = useContext(c)
    is(v, "")
    return j("div")
  }
})

test("useContext(): uses a context with a default value", () => {
  const c = createContext("a")
  const t = j(c.Provider, [j(C)])
  render(t)

  function C(): Component {
    const v = useContext(c)
    is(v, "a")
    return j("div")
  }
})

test("useContext(): uses a context with a custom value", () => {
  const c = createContext("a")
  const t = j(c.Provider, {value: "b"}, [j(C)])
  render(t)

  function C(): Component {
    const v = useContext(c)
    is(v, "b")
    return j("div")
  }
})

test.run()

function re(a: Component, e: unknown): void {
  eq(render(a), e)
}
