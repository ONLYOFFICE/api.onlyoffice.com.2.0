import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export function CodeListing(p: ChildrenIncludable): JSX.Element {
  return <tab-container class="code-listing">{p.children}</tab-container>
}

export function CodeListingTabListWrapper(p: ChildrenIncludable): JSX.Element {
  return <div slot="tablist-wrapper">{p.children}</div>
}

export interface CodeListingTabListParameters extends ChildrenIncludable {
  label?: string
}

export function CodeListingTabList(p: CodeListingTabListParameters): JSX.Element {
  return <div role="tablist" aria-label={p.label}>{p.children}</div>
}

export interface CodeListingTabParameters extends ChildrenIncludable {
  id?: string
}

export function CodeListingTab(p: CodeListingTabParameters): JSX.Element {
  return <button type="button" id={p.id} role="tab">{p.children}</button>
}

export interface CodeListingActionListParameters extends ChildrenIncludable {
  label?: string
}

export function CodeListingActionList(p: CodeListingActionListParameters): JSX.Element {
  return <div class="code-listing__action-list" aria-label={p.label}>{p.children}</div>
}

export function CodeListingAction(p: ChildrenIncludable): JSX.Element {
  return <div class="code-listing__action">{p.children}</div>
}

export interface CodeListingTabPanelParameters extends ChildrenIncludable {
  // todo: rename to labelledby
  by?: string
}

export function CodeListingTabPanel(p: CodeListingTabPanelParameters): JSX.Element {
  return <div role="tabpanel" aria-labelledby={p.by}>{p.children}</div>
}
