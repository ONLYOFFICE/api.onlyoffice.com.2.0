import {type Element as HastElement} from "hast"
import {type JSX} from "preact"

export type AElement = Element<"a">
export type AProperties = ElementProperties<"a">

export type ButtonElement = Element<"button">
export type ButtonProperties = ElementProperties<"button">

export type CodeElement = Element<"code">
export type CodeProperties = ElementProperties<"code">

export type DdElement = Element<"dd">
export type DdProperties = ElementProperties<"dd">

export type DivElement = Element<"div">
export type DivProperties = ElementProperties<"div">

export type DlElement = Element<"dl">
export type DlProperties = ElementProperties<"dl">

export type DtElement = Element<"dt">
export type DtProperties = ElementProperties<"dt">

export type FooterElement = Element<"footer">
export type FooterProperties = ElementProperties<"footer">

export type H2Element = Element<"h2">
export type H2Properties = ElementProperties<"h2">

export type HeaderElement = Element<"header">
export type HeaderProperties = ElementProperties<"header">

export type LiElement = Element<"li">
export type LiProperties = ElementProperties<"li">

export type NavElement = Element<"nav">
export type NavProperties = ElementProperties<"nav">

export type PElement = Element<"p">
export type PProperties = ElementProperties<"p">

export type PreElement = Element<"pre">
export type PreProperties = ElementProperties<"pre">

export type SpanElement = Element<"span">
export type SpanProperties = ElementProperties<"span">

export type TemplateElement = Element<"template">
export type TemplateProperties = ElementProperties<"template">

export type UlElement = Element<"ul">
export type UlProperties = ElementProperties<"ul">

export type ElementProperties<E extends keyof JSX.IntrinsicElements>
  = Omit<JSX.IntrinsicElements[E], "children"> & ElementAdditionalProperties

export interface ElementAdditionalProperties {
  // asChild?: boolean
}

export interface Element<E extends keyof JSX.IntrinsicElements> extends HastElement {
  tagName: E
}
