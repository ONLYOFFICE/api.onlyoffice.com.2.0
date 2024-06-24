import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, h} from "preact"

export function Playground({children}: ChildrenIncludable): JSX.Element {
  return <div class="playground">{children}</div>
}

export function PlaygroundBefore({children}: ChildrenIncludable): JSX.Element {
  return <div class="playground__before">{children}</div>
}

export function PlaygroundContent({children}: ChildrenIncludable): JSX.Element {
  return <div class="playground__playground">{children}</div>
}
