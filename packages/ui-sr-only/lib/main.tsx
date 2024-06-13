import type {JSX} from "preact"
import {Fragment, cloneElement, h, toChildArray} from "preact"

export interface SrOnlyParameters {
  children?: any
}

export function SrOnly(
  {children}: SrOnlyParameters
): JSX.Element {
  return <>
    {toChildArray(children)
      .map((ch) => cloneElement(ch, {class: "sr-only"}))}
  </>
}
