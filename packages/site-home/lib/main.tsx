import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX, h} from "preact"

export function Home({children}: ChildrenIncludable): JSX.Element {
  return <div class="home">{children}</div>
}

export function HomeHero({children}: ChildrenIncludable): JSX.Element {
  return <div class="home__hero">{children}</div>
}

export interface HomePartParameters extends ChildrenIncludable {
  variant?: "default" | "reverse"
}

export function HomePart({children, variant}: HomePartParameters): JSX.Element {
  return <div class={cls()}>{children}</div>

  function cls(): string {
    let s = "home__part"
    if (variant === "reverse") {
      s += " home__part_reverse"
    }
    return s
  }
}

export function HomeIn({children}: ChildrenIncludable): JSX.Element {
  return <div class="home__in">{children}</div>
}

export function HomeLinks({children}: ChildrenIncludable): JSX.Element {
  return <ul class="home__links">{children}</ul>
}

export function HomeLink({children}: ChildrenIncludable): JSX.Element {
  return <li>{children}</li>
}

export function HomePreview({children}: ChildrenIncludable): JSX.Element {
  return <div class="home__preview">{children}</div>
}
