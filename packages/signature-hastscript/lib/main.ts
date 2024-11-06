import {
  type Children,
  type Component,
  Fragment as F,
  createContext,
  h,
  useContext,
} from "@onlyoffice/hastscript"
import type * as E from "@onlyoffice/hastscript/elements.ts"
import type * as Sg from "@onlyoffice/signature"
import {clsx} from "clsx"

class Context {
  Reference: SignatureReferenceChild = (_: object, ch: Children) => h(F, ch)
}

const ctx = createContext(new Context())

export type SignatureProperties =
  DefaultSignatureProperties |
  BlockSignatureProperties |
  InlineSignatureProperties

interface DefaultSignatureProperties extends
  SignaturePropertiesBase,
  E.PreProperties {
  variant?: "default"
}

interface BlockSignatureProperties extends
  SignaturePropertiesBase,
  E.PreProperties {
  variant: "block"
}

interface InlineSignatureProperties extends
  SignaturePropertiesBase,
  E.CodeProperties {
  variant: "inline"
}

export interface SignaturePropertiesBase {
  variant?: SignatureVariant
  signature?: Sg.Signature
}

export type SignatureVariant = "default" | "block" | "inline"

export function Signature(p: SignatureProperties, ch: Children): Component {
  const {signature = []} = p

  return h(ctx.Provider, {value: new Context()}, [
    ...ch,
    h(Root, p, [
      h(Base, {signature}),
    ]),
  ])
}

export interface SignatureReferenceChild {
  (p: SignatureReferenceChildProperties, ch: Children): Component
}

export interface SignatureReferenceChildProperties {
  reference: Sg.Reference
}

export function SignatureReference(
  _: object,
  ch: SignatureReferenceChild[],
): Component {
  const x = useContext(ctx)
  ;[x.Reference] = ch
  return h(F)
}

function Root(p: SignatureProperties, ch: Children): Component {
  const {signature, ...o} = p

  o.class = clsx(
    "signature",
    o.variant && `signature_variant_${o.variant}`,
    o.class,
  )

  if (o.variant === "inline") {
    const {variant, ...a} = o
    return h("code", a, ch)
  }

  const {variant, ...a} = o

  return h("pre", a, [
    h("code", ch),
  ])
}

interface BaseProperties {
  signature: Sg.Signature
}

function Base(p: BaseProperties): Component {
  const ch: Children = []

  for (const t of p.signature) {
    let c: Component

    if ("id" in t) {
      c = h(Reference, {reference: t})
    } else {
      c = h(Token, {token: t})
    }

    ch.push(c)
  }

  return h(F, ch)
}

interface TokenProperties {
  token: Sg.Token
}

function Token(p: TokenProperties): Component {
  switch (p.token.type) {
  case "entity":
    return h(EntityToken, {token: p.token})
  case "keyword":
    return h(KeywordToken, {token: p.token})
  case "noop":
    return h(F)
  case "parameter":
    return h(ParameterToken, {token: p.token})
  case "string":
    return h(StringToken, {token: p.token})
  case "text":
    return h(TextToken, {token: p.token})
  case "type":
    return h(TypeToken, {token: p.token})
  }
  return h(F)
}

interface EntityTokenProperties {
  token: Sg.EntityToken
}

function EntityToken(p: EntityTokenProperties): Component {
  return h("span", {class: "sg-en"}, [p.token.text])
}

interface KeywordTokenProperties {
  token: Sg.KeywordToken
}

function KeywordToken(p: KeywordTokenProperties): Component {
  return h("span", {class: "sg-kw"}, [p.token.text])
}

interface ParameterTokenProperties {
  token: Sg.ParameterToken
}

function ParameterToken(p: ParameterTokenProperties): Component {
  return h("span", {class: "sg-pm"}, [p.token.text])
}

interface StringTokenProperties {
  token: Sg.StringToken
}

function StringToken(p: StringTokenProperties): Component {
  return h("span", {class: "sg-st"}, [p.token.text])
}

interface TextTokenProperties {
  token: Sg.TextToken
}

function TextToken(p: TextTokenProperties): Component {
  return h(F, [p.token.text])
}

interface TypeTokenProperties {
  token: Sg.TypeToken
}

function TypeToken(p: TypeTokenProperties): Component {
  return h("span", {class: "sg-tp"}, [p.token.text])
}

interface ReferenceProperties {
  reference: Sg.Reference
}

function Reference(p: ReferenceProperties): Component {
  const {Reference} = useContext(ctx)

  return h(Reference, {reference: p.reference}, [
    h(Token, {token: p.reference.token}),
  ])
}
