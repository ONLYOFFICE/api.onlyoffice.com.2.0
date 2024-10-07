// This file is a simplified version of the [@radix-ui/react-primitive] package.
//
// [@radix-ui/react-primitives]: https://github.com/radix-ui/primitives/blob/74b182b401c8ca0fa5b66a5a9a47f507bb3d5adc/packages/react/primitive/src/Primitive.tsx

import {Slot} from "@onlyoffice/preact-slots"
import {type JSX, h} from "preact"

export type AProperties = ElementProperties<"a">
export const A = wrap("a")

export type ButtonProperties = ElementProperties<"button">
export const Button = wrap("button")

export type DivProperties = ElementProperties<"div">
export const Div = wrap("div")

export type PProperties = ElementProperties<"p">
export const P = wrap("p")

export interface Element<E extends keyof JSX.IntrinsicElements> {
  (properties: ElementProperties<E>): JSX.Element
}

export type ElementProperties<E extends keyof JSX.IntrinsicElements>
  = JSX.IntrinsicElements[E] & ElementAdditionalProperties

export interface ElementAdditionalProperties {
  asChild?: boolean
}

function wrap<E extends keyof JSX.IntrinsicElements>(e: E): Element<E> {
  return function Element(p: ElementProperties<E>): JSX.Element {
    const {asChild, ...o} = p

    // It is difficult to type this properly.
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    let E: any = e
    if (asChild) {
      E = Slot
    }

    return <E {...o} />
  }
}
