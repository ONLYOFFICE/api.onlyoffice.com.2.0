import type {JSX} from "preact"
import {h} from "preact"

export interface ContentTabContainerParameters {
  children?: any
}

export function ContentTabContainer({children}: ContentTabContainerParameters): JSX.Element {
  return <tab-container>{children}</tab-container>
}

export interface ContentTabListParameters {
  children?: any
  label: string
}

export function ContentTabList({children, label}: ContentTabListParameters): JSX.Element {
  return <div role="tablist" aria-label={label}>{children}</div>
}

export interface ContentTabParameters {
  children?: any
  id: string
}

export function ContentTab({children, id}: ContentTabParameters): JSX.Element {
  return <div id={id} role="tab">{children}</div>
}

export interface ContentTabPanelParameters {
  by: string
  children?: any
}

export function ContentTabPanel({by, children}: ContentTabPanelParameters): JSX.Element {
  return <div role="tabpanel" aria-labelledby={by}>{children}</div>
}
