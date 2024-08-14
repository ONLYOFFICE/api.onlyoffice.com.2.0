import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {Fragment, type JSX, cloneElement, h, toChildArray} from "preact"

export function SrOnly(p: ChildrenIncludable): JSX.Element {
  return <>
    {toChildArray(p.children)
      // @ts-ignore The ChildrenIncludable is the source of the type issue.
      .map((ch) => cloneElement(ch, {class: "sr-only"}))}
  </>
}
