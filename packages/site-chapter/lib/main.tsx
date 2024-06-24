import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, h} from "preact"

export function Chapter({children}: ChildrenIncludable): JSX.Element {
  return <div class="chapter">{children}</div>
}

export function ChapterNavigation({children}: ChildrenIncludable): JSX.Element {
  return <div class="chapter__navigation">{children}</div>
}

export function ChapterBreadcrumb({children}: ChildrenIncludable): JSX.Element {
  return <div class="chapter__breadcrumbs">{children}</div>
}

export function ChapterContent({children}: ChildrenIncludable): JSX.Element {
  return <div class="chapter__content">{children}</div>
}
