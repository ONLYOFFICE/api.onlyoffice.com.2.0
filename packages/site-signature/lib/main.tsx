import * as Elements from "@onlyoffice/preact-elements"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import type * as Sig from "@onlyoffice/signature"
import {clsx} from "clsx"
import {Fragment, type JSX, createContext, h} from "preact"
import {useContext} from "preact/hooks"

class Context {
  Reference: SignatureReferenceChildren = () => null
}

const ctx = createContext(new Context())

export type SignatureProperties =
  DefaultSignatureProperties |
  BlockSignatureProperties |
  InlineSignatureProperties

interface DefaultSignatureProperties extends
  SignaturePropertiesBase,
  Elements.PreProperties {
  variant?: "default"
}

interface BlockSignatureProperties extends
  SignaturePropertiesBase,
  Elements.PreProperties {
  variant: "block"
}

interface InlineSignatureProperties extends
  SignaturePropertiesBase,
  Elements.CodeProperties {
  variant: "inline"
}

export interface SignaturePropertiesBase {
  variant?: "default" | "block" | "inline"
  signature: Sig.Signature
}

export function Signature(p: SignatureProperties): JSX.Element {
  const {children, ...o} = p

  return <ctx.Provider value={new Context()}>
    {children}
    <Root {...o}>
      <Base signature={p.signature} />
    </Root>
  </ctx.Provider>
}

export interface SignatureReferenceProperties {
  children: SignatureReferenceChildren
}

export interface SignatureReferenceChildren {
  (this: void, p: SignatureReferenceChildrenProperties): JSX.Element | null
}

export interface SignatureReferenceChildrenProperties extends
  ChildrenIncludable {
  reference: Sig.Reference
}

export function SignatureReference(
  p: SignatureReferenceProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.Reference = p.children
  return <></>
}

function Root(p: SignatureProperties): JSX.Element {
  const {children, signature, ...o} = p

  o.class = clsx(
    "signature",
    o.variant && `signature_variant_${o.variant}`,
    o.class,
  )

  if (o.variant === "inline") {
    const {variant, ...a} = o

    return <Elements.Code {...a}>
      {children}
    </Elements.Code>
  }

  const {variant, ...a} = o

  return <Elements.Pre {...a}>
    <code>{children}</code>
  </Elements.Pre>
}

interface BaseProperties {
  signature: Sig.Signature
}

function Base(p: BaseProperties): JSX.Element {
  return <>
    {p.signature.map((t) => {
      if ("id" in t) {
        return <Reference reference={t} />
      }
      return <Token token={t} />
    })}
  </>
}

interface TokenProperties {
  token: Sig.Token
}

function Token(p: TokenProperties): JSX.Element {
  switch (p.token.type) {
  case "entity":
    return <EntityToken token={p.token} />
  case "keyword":
    return <KeywordToken token={p.token} />
  case "noop":
    return <></>
  case "parameter":
    return <ParameterToken token={p.token} />
  case "string":
    return <StringToken token={p.token} />
  case "text":
    return <TextToken token={p.token} />
  case "type":
    return <TypeToken token={p.token} />
  }
  return <></>
}

interface EntityTokenProperties {
  token: Sig.EntityToken
}

function EntityToken(p: EntityTokenProperties): JSX.Element {
  return <span class="sg-en">{p.token.text}</span>
}

interface KeywordTokenProperties {
  token: Sig.KeywordToken
}

function KeywordToken(p: KeywordTokenProperties): JSX.Element {
  return <span class="sg-kw">{p.token.text}</span>
}

interface ParameterTokenProperties {
  token: Sig.ParameterToken
}

function ParameterToken(p: ParameterTokenProperties): JSX.Element {
  return <span class="sg-pm">{p.token.text}</span>
}

interface StringTokenProperties {
  token: Sig.StringToken
}

function StringToken(p: StringTokenProperties): JSX.Element {
  return <span class="sg-st">{p.token.text}</span>
}

interface TextTokenProperties {
  token: Sig.TextToken
}

function TextToken(p: TextTokenProperties): JSX.Element {
  return <>{p.token.text}</>
}

interface TypeTokenProperties {
  token: Sig.TypeToken
}

function TypeToken(p: TypeTokenProperties): JSX.Element {
  return <span class="sg-tp">{p.token.text}</span>
}

interface ReferenceProperties {
  reference: Sig.Reference
}

function Reference(p: ReferenceProperties): JSX.Element {
  const {Reference} = useContext(ctx)

  return <Reference reference={p.reference}>
    <Token token={p.reference.token} />
  </Reference>
}
