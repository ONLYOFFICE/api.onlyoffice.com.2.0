import type {JSX} from "preact"
import {h} from "preact"

export interface CodeListingParameters {
  children?: any
}

export function CodeListing(
  {children}: CodeListingParameters
): JSX.Element {
  return <tab-container class="code-listing">{children}</tab-container>
}

export interface CodeListingTabListWrapperParameters {
  children?: any
}

export function CodeListingTabListWrapper(
  {children}: CodeListingTabListWrapperParameters
): JSX.Element {
  return <div slot="tablist-wrapper">{children}</div>
}

export interface CodeListingTabListParameters {
  children?: any
  label: string
}

export function CodeListingTabList(
  {children, label}: CodeListingTabListParameters
): JSX.Element {
  return <div role="tablist" aria-label={label}>{children}</div>
}

export interface CodeListingTabParameters {
  children?: any
  id: string
}

export function CodeListingTab(
  {children, id}: CodeListingTabParameters
): JSX.Element {
  return <button type="button" id={id} role="tab">{children}</button>
}

export interface CodeListingActionListParameters {
  children?: any
  label: string
}

export function CodeListingActionList(
  {children, label}: CodeListingActionListParameters
): JSX.Element {
  return <div class="code-listing__action-list" aria-label={label}>{children}</div>
}

export interface CodeListingActionParameters {
  children?: any
}

export function CodeListingAction(
  {children}: CodeListingActionParameters
): JSX.Element {
  return <div class="code-listing__action">{children}</div>
}

export interface CodeListingTabPanelParameters {
  by: string
  children?: any
}

export function CodeListingTabPanel(
  {by, children}: CodeListingTabPanelParameters
): JSX.Element {
  return <div role="tabpanel" aria-labelledby={by}>{children}</div>
}
