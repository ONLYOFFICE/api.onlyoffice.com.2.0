// todo: This package works well but requires a few improvements:
//
// 1. Remove the any type in the h function parameters.
// 2. Allow calling the h function without parameters (?).
// 3. Disallow calling the h function with a non-array children parameter.
// 4. Pass properties and children to the component source as a single object,
//    with children having their own property.

import {type ElementContent, type Text} from "hast"
import {type Properties, h as html} from "hastscript"
import {type JSX} from "preact"
import {type Node as UnistNode} from "unist"
import {u} from "unist-builder"
import {type ElementProperties} from "../elements.ts"

export function render(c: Component): ElementContent {
  const f = u("root", [])
  addComponent(f.children, c)

  if (f.children.length === 1) {
    return f.children[0]
  }

  // This is not correct in terms of typing. However, hast ignores the root
  // unist node while processing the tree. Therefore, it should be safe enough.
  // @ts-ignore above
  return f
}

function addComponent(a: ElementContent[], c: Component): void {
  if (typeof c.source === "string") {
    const e = html(c.source, c.properties as Properties, [])
    for (const d of c.children) {
      addChild(e.children, d)
    }
    a.push(e)
    return
  }

  if (typeof c.source === "function" && c.source === Fragment) {
    for (const d of c.children) {
      addChild(a, d)
    }
    return
  }

  if (typeof c.source === "function") {
    const t = c.source(c.properties, c.children)
    addComponent(a, t)
  }
}

function addChild(a: ElementContent[], c: Child): void {
  // Use the hastscript behavior for adding a child.
  // https://github.com/syntax-tree/hastscript/blob/8.0.0/lib/create-h.js/#L253

  if (c === undefined || c === null) {
    return
  }

  // Hastscript does not work with boolean values, however, it is beneficial to
  // handle them in order to support the following syntax:
  //
  // h("div", [
  //   false && h("div"),
  // ])

  if (typeof c === "boolean") {
    return
  }

  if (typeof c === "number") {
    const t: Text = {type: "text", value: String(c)}
    a.push(t)
    return
  }

  if (typeof c === "string") {
    const t: Text = {type: "text", value: c}
    a.push(t)
    return
  }

  if (isComponent(c)) {
    addComponent(a, c)
    return
  }

  a.push(c)
}

export function Spacer(_: object, ch: Children): Component {
  return h(Fragment, ["\n", ...ch, "\n"])
}

export function h<
  // It is quite difficult to remove the any.
  /* eslint-disable @typescript-eslint/no-explicit-any */
  E extends PrimitiveSource | ComponentSource<any, any>,
  C = E extends ComponentSource<any, Children<infer T>>
    ? Children<T>
    : Children,
  P = E extends PrimitiveSource
    ? ElementProperties<E> | C
    : E extends ComponentSource<any, any>
      ? Parameters<E>[0] | C
      : never,
>(
  e: E,
  pOrCh?: P,
  ch?: C,
  /* eslint-enable @typescript-eslint/no-explicit-any */
): Component {
  // h(tag, properties, children)
  if (typeof e === "string" && isObject(pOrCh) && Array.isArray(ch)) {
    return c(e, pOrCh, ch)
  }

  // h(tag, properties)
  if (typeof e === "string" && isObject(pOrCh)) {
    return c(e, pOrCh, [])
  }

  // h(tag, children)
  if (typeof e === "string" && Array.isArray(pOrCh)) {
    return c(e, {}, pOrCh)
  }

  // h(tag)
  if (typeof e === "string") {
    return c(e, {}, [])
  }

  // h(component, properties, children)
  if (typeof e === "function" && isObject(pOrCh) && Array.isArray(ch)) {
    return c(e, pOrCh, ch)
  }

  // h(component, properties)
  if (typeof e === "function" && isObject(pOrCh)) {
    return c(e, pOrCh, [])
  }

  // h(component, children)
  if (typeof e === "function" && Array.isArray(pOrCh)) {
    return c(e, {}, pOrCh)
  }

  // h(component)
  if (typeof e === "function") {
    return c(e, {}, [])
  }

  // Use a div element by default to match the hastscript behavior.
  // https://github.com/syntax-tree/hastscript/blob/8.0.0/lib/index.js/#L32
  return c("div", {}, [])
}

export function Fragment(_: object, ch: Children): Component {
  return c("root", {}, ch)
}

export function isComponent(u: unknown): u is Component {
  return Boolean(
    isObject(u) &&
    "type" in u &&
    u.type === "component" &&
    "source" in u &&
    (typeof u.source === "string" || typeof u.source === "function") &&
    "properties" in u &&
    isObject(u.properties) &&
    "children" in u &&
    Array.isArray(u.children),
  )
}

export interface Component extends UnistNode {
  type: "component"
  source: Source
  properties: object
  children: Children
}

export type Source = FragmentSource | PrimitiveSource | ComponentSource

export type FragmentSource = "root"

export type PrimitiveSource = keyof JSX.IntrinsicElements

export interface ComponentSource<P = object, C = Children> {
  (this: void, p: P, ch: C): Component
}

export type Children<C = Child> = C[]

export type Child = PrimitiveChild | Component | ElementContent

export type PrimitiveChild = boolean | null | number | string | undefined

export function c(s: Source, p: object, ch: Children): Component {
  return {
    type: "component",
    source: s,
    properties: p,
    children: ch,
  }
}

function isObject(u: unknown): u is object {
  return typeof u === "object" && u !== null && !Array.isArray(u)
}
