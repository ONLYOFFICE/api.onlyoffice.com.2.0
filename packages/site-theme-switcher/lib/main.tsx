import type {JSX} from "preact"
import {h} from "preact"

export interface ThemeSwitcherParameters {
  children?: any
  label?: string
}

export function ThemeSwitcher(
  {children, label}: ThemeSwitcherParameters
): JSX.Element {
  return <theme-switcher class="theme-switcher">
    <radiogroup-container>
      <div role="radiogroup" aria-label={label}>
        {children}
      </div>
    </radiogroup-container>
  </theme-switcher>
}

export interface ThemeSwitcherOptionParameters {
  children?: any
  value?: string
}

export function ThemeSwitcherOption(
  {children, value}: ThemeSwitcherOptionParameters
): JSX.Element {
  return <div role="radio" data-value={value}>{children}</div>
}
