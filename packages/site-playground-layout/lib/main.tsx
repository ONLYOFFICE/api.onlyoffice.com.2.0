import type {JSX} from "preact"
import {h} from "preact"

export interface SitePlaygroundLayoutParameters {
  children?: any
}

export function SitePlaygroundLayout(
  {children}: SitePlaygroundLayoutParameters
): JSX.Element {
  return <div class="playground-l">{children}</div>
}

export interface SitePlaygroundLayoutBeforeParameters {
  children?: any
}

export function SitePlaygroundLayoutBefore(
  {children}: SitePlaygroundLayoutBeforeParameters
): JSX.Element {
  return <div class="playground-l__before">{children}</div>
}

export interface SitePlaygroundLayoutAfterParameters {
  children?: any
}

export function SitePlaygroundLayoutPlayground(
  {children}: SitePlaygroundLayoutPlaygroundParameters
): JSX.Element {
  return <div class="playground-l__playground">{children}</div>
}
