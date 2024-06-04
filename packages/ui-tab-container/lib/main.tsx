import type {TabContainerElement} from "@github/tab-container-element"
import type {JSX} from "preact"
import {h} from "preact"

// https://github.com/github/tab-container-element/blob/v4.8.0/src/tab-container-element-define.ts#L18
declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "tab-container": HTMLAttributes<TabContainerElement>
      }
    }
  }
}

export interface TabContainerParameters {
  children: any
}

export function TabContainer({children}: TabContainerParameters): JSX.Element {
  return <tab-container>{children}</tab-container>
}

export interface TabListParameters {
  children: any
  label: string
}

export function TabList({children, label}: TabListParameters): JSX.Element {
  return <div role="tablist" aria-label={label}>{children}</div>
}

export interface TabParameters {
  children: any
  id: string
}

export function Tab({children, id}: TabParameters): JSX.Element {
  return <div id={id} role="tab">{children}</div>
}

export interface TabPanelParameters {
  by: string
  children: any
}

export function TabPanel({by, children}: TabPanelParameters): JSX.Element {
  return <div role="tabpanel" aria-labelledby={by}>{children}</div>
}
