import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, h} from "preact"

export function Part({children}: ChildrenIncludable): JSX.Element {
  return <div class="part">
    <div class="part__inner">{children}</div>
  </div>
}

export function PartHero({children}: ChildrenIncludable): JSX.Element {
  return <div class="part__hero">{children}</div>
}

export function PartChapters({children}: ChildrenIncludable): JSX.Element {
  return <div class="part__chapters">{children}</div>
}

export function PartChapter({children}: ChildrenIncludable): JSX.Element {
  return <div class="part__chapter">{children}</div>
}

export function PartHelp({children}: ChildrenIncludable): JSX.Element {
  return <div class="part__help">{children}</div>
}
