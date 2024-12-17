import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export interface ThemeSwitcherParameters extends ChildrenIncludable {
  label?: string
}

export function ThemeSwitcher(
  {children, label}: ThemeSwitcherParameters,
): JSX.Element {
  return <theme-switcher-container class="theme-switcher">
    <radiogroup-container>
      <div role="radiogroup" aria-label={label}>
        {children}
      </div>
    </radiogroup-container>
  </theme-switcher-container>
}

export interface ThemeSwitcherOptionParameters extends ChildrenIncludable {
  value?: string
}

export function ThemeSwitcherOption(
  {children, value}: ThemeSwitcherOptionParameters,
): JSX.Element {
  return <div role="radio" data-value={value}>{children}</div>
}
