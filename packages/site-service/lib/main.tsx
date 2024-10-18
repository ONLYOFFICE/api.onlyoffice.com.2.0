import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import type * as ServiceDeclaration from "@onlyoffice/service-declaration"
import * as Sig from "@onlyoffice/signature"
import * as SiteGlossary from "@onlyoffice/site-glossary"
import {Signature} from "@onlyoffice/site-signature"
import {
  Badge,
  BadgeCaption,
  BadgeGroup,
  CodeListing,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel,
} from "@onlyoffice/ui-kit"
import {
  type ComponentChildren,
  Fragment,
  type JSX,
  createContext,
  h,
} from "preact"
import {useContext} from "preact/hooks"

export interface Description {
  (this: void, p: ChildrenIncludable): JSX.Element | null
}

export interface SyntaxHighlightProperties extends ChildrenIncludable {
  syntax: string
}

export interface SyntaxHighlight {
  (this: void, p: SyntaxHighlightProperties): JSX.Element | null
}

class Context {
  Description: Description = () => null
  SyntaxHighlight: SyntaxHighlight = () => null
  headings: Record<ServiceSection, JSX.Element> = {
    Authorization: <h3>Authorization</h3>,
    Body: <h3>Body</h3>,
    Cookies: <h3>Cookies</h3>,
    Examples: <h3>Examples</h3>,
    Headers: <h3>Headers</h3>,
    Path: <h3>Path</h3>,
    Query: <h3>Query</h3>,
    Request: <h2>Request</h2>,
    Responses: <h2>Responses</h2>,
  }
}

const ctx = createContext(new Context())

export interface ServiceProperties extends ChildrenIncludable {
  declaration: ServiceDeclaration.Declaration
}

export function Service(
  p: ServiceProperties,
): JSX.Element {
  return <ctx.Provider value={new Context()}>
    {p.children}
    <Declaration declaration={p.declaration} />
  </ctx.Provider>
}

export type ServiceSection =
  "Authorization" |
  "Body" |
  "Cookies" |
  "Examples" |
  "Headers" |
  "Path" |
  "Query" |
  "Request" |
  "Responses"

export interface ServiceHeadingProperties {
  children: ComponentChildren
  for: ServiceSection
}

export function ServiceHeading(
  p: ServiceHeadingProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.headings[p.for] = <>{p.children}</>
  return <></>
}

export interface ServiceDescriptionProperties {
  children: Description
}

export function ServiceDescription(
  p: ServiceDescriptionProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.Description = p.children
  return <></>
}

export interface ServiceSyntaxHighlightProperties {
  children: SyntaxHighlight
}

export function ServiceSyntaxHighlight(
  p: ServiceSyntaxHighlightProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.SyntaxHighlight = p.children
  return <></>
}

interface DeclarationProperties {
  declaration: ServiceDeclaration.Declaration
}

function Declaration(p: DeclarationProperties): JSX.Element {
  const {declaration: d} = p

  switch (d.type) {
  case "group":
    return <></>
  case "operation":
    return <OperationDeclaration declaration={d} />
  }

  return <></>
}

interface OperationDeclarationProperties {
  declaration: ServiceDeclaration.OperationDeclaration
}

function OperationDeclaration(p: OperationDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {request: r} = d

  return <>
    {r.signature.length !== 0 && <Signature signature={r.signature} />}
    <Heading for="Request" />
    <Request request={r} />
    {d.responses.length !== 0 && <>
      <Heading for="Responses" />
      {d.responses.map((r) => <Response response={r} />)}
    </>}
  </>
}

interface RequestProperties {
  request: ServiceDeclaration.Request
}

function Request(p: RequestProperties): JSX.Element {
  const {request: r} = p
  const {Description} = useContext(ctx)

  return <>
    {r.description && <Description>{r.description}</Description>}
    {r.authorizations.length !== 0 && <>
      <Heading for="Authorization" />
      {r.authorizations.map((a) => <Authorization authorization={a} />)}
    </>}
    {r.cookieParameters.type.type !== "noop" && <>
      <Heading for="Cookies" />
      <Entity entity={r.cookieParameters} />
    </>}
    {r.headerParameters.type.type !== "noop" && <>
      <Heading for="Headers" />
      <Entity entity={r.headerParameters} />
    </>}
    {r.pathParameters.type.type !== "noop" && <>
      <Heading for="Path" />
      <Entity entity={r.pathParameters} />
    </>}
    {r.queryParameters.type.type !== "noop" && <>
      <Heading for="Query" />
      <Entity entity={r.queryParameters} />
    </>}
    {r.bodyParameters.type.type !== "noop" && <>
      <Heading for="Body" />
      <Entity entity={r.bodyParameters} />
    </>}
    {r.examples.length !== 0 && <>
      <Heading for="Examples" />
      <Examples examples={r.examples} />
    </>}
  </>
}

interface AuthorizationProperties {
  authorization: ServiceDeclaration.Authorization
}

function Authorization(p: AuthorizationProperties): JSX.Element {
  const {authorization: a} = p
  const {Description} = useContext(ctx)

  let d = <></>
  let e = <></>

  if (a.type === "apiKey" && a.in === "header") {
    d = <p>
      An API key is a token that you provide when making API calls.{" "}
      Include the token in a header parameter called <code>{a.identifier}</code>.
    </p>
    e = <p>
      Example: <code>{a.identifier}: 864FE52C-1C1C-469F-9308-51DAFEFE7436</code>.
    </p>
  } else if (a.type === "apiKey" && a.in === "cookie") {
    d = <p>
      An API key is a token that you provide when making API calls.{" "}
      Include the token in a cookie parameter called <code>{a.identifier}</code>.
    </p>
    e = <p>
      Example: <code>{a.identifier}=864FE52C-1C1C-469F-9308-51DAFEFE7436</code>.
    </p>
  }

  return <>
    {a.description && <Description>{a.description}</Description>}
    {d}
    {e}
  </>
}

interface ResponseProperties {
  response: ServiceDeclaration.Response
}

function Response(p: ResponseProperties): JSX.Element {
  const {response: r} = p
  const {Description} = useContext(ctx)

  return <>
    <h3>{r.status}</h3>
    {r.description && <Description>{r.description}</Description>}
    {r.body.type.type !== "noop" && <Entity entity={r.body} />}
  </>
}

interface EntityProperties {
  entity: ServiceDeclaration.Entity
}

function Entity(p: EntityProperties): JSX.Element {
  const {entity: e} = p
  const {Description} = useContext(ctx)

  return <>
    {e.description && <Description>{e.description}</Description>}
    <Type type={e.type} />
  </>
}

interface TypeProperties {
  type: ServiceDeclaration.Type
}

function Type(p: TypeProperties): JSX.Element {
  const {type: t} = p

  switch (t.type) {
  case "array":
    return <ArrayType type={t} />
  case "boolean":
    return <></>
  case "complex":
    return <ComplexType type={t} />
  case "enum":
    return <EnumType type={t} />
  case "integer":
    return <></>
  case "literal":
    return <LiteralType type={t} />
  case "noop":
  case "null":
  case "number":
    return <></>
  case "object":
    return <ObjectType type={t} />
  case "string":
  case "union":
  case "unknown":
    return <></>
  }

  return <></>
}

interface ArrayTypeProperties {
  type: ServiceDeclaration.ArrayType
}

function ArrayType(p: ArrayTypeProperties): JSX.Element {
  const {type: t} = p

  if (t.items.type === "circular") {
    return <></>
  }

  return <Entity entity={t.items} />
}

interface ComplexTypeProperties {
  type: ServiceDeclaration.ComplexType
}

function ComplexType(p: ComplexTypeProperties): JSX.Element {
  const {type: t} = p
  return <Glossary entities={t.entities} />
}

interface EnumTypeProperties {
  type: ServiceDeclaration.EnumType
}

function EnumType(p: EnumTypeProperties): JSX.Element {
  const {type: t} = p
  const d: JSX.Element[] = []

  for (const [i, c] of t.cases.entries()) {
    if (c.type.type !== "literal") {
      throw new Error(`Expected literal type, got: ${c.type.type}`)
    }

    const e = <Type type={c.type} />

    if (t.cases && i !== t.cases.length - 1) {
      d.push(<>{e}, </>)
    } else {
      d.push(<>{e}.</>)
    }
  }

  if (d.length === 0) {
    return <></>
  }

  return <p>Can be one of: {d}</p>
}

interface LiteralTypeProperties {
  type: ServiceDeclaration.LiteralType
}

function LiteralType(p: LiteralTypeProperties): JSX.Element {
  const {type: t} = p

  if (t.const.type === "noop") {
    return <></>
  }

  return <code>{String(t.const.value)}</code>
}

interface ObjectTypeProperties {
  type: ServiceDeclaration.ObjectType
}

function ObjectType(p: ObjectTypeProperties): JSX.Element {
  const {type: t} = p
  return <Glossary properties={t.properties} />
}

interface GlossaryProperties {
  properties?: ServiceDeclaration.Property[]
  entities?: ServiceDeclaration.Entity[]
}

function Glossary(p: GlossaryProperties): JSX.Element {
  return <>
    {p.properties && p.properties.length !== 0 && <SiteGlossary.Glossary>
      {p.properties.map((p) => <GlossaryItem property={p} entity={p.self} />)}
    </SiteGlossary.Glossary>}
    {p.entities && p.entities.length !== 0 && <SiteGlossary.Glossary>
      {p.entities.map((e) => <GlossaryItem entity={e} />)}
    </SiteGlossary.Glossary>}
  </>
}

interface GlossaryItemProperties {
  property?: ServiceDeclaration.Property
  entity: ServiceDeclaration.Entity | ServiceDeclaration.CircularReference
}

function GlossaryItem(p: GlossaryItemProperties): JSX.Element {
  const {entity: e, property: r} = p
  const t: JSX.Element[] = []
  const d: JSX.Element[] = []

  if (r && r.identifier) {
    t.push(<Badge variant="calm">{r.identifier}</Badge>)
  } else {
    t.push(<Badge variant="calm">.</Badge>)
  }

  let s: Sig.Signature = []

  if (e.type === "circular") {
    const t = new Sig.TypeToken()
    t.text = "circular reference"
    s = [t]
  } else {
    s = e.signature
  }

  if (s.length !== 0) {
    t.push(<Badge variant="transparent">
      <Signature variant="inline" signature={s} />
    </Badge>)
  }

  if (e.type !== "circular" && e.format) {
    t.push(<Badge variant="neutral">
      <BadgeCaption>format</BadgeCaption>
      {e.format}
    </Badge>)
  }

  if (e.type !== "circular" && r && r.required) {
    t.push(<Badge variant="critical">required</Badge>)
  }

  if (e.type !== "circular" && e.default.type !== "noop") {
    t.push(<Badge variant="neutral">
      <BadgeCaption>default</BadgeCaption>
      {e.default.value}
    </Badge>)
  }

  // if (e.type !== "circular" && e.example.type !== "noop") {
  //   t.push(<Badge variant="neutral">
  //     <BadgeCaption>example</BadgeCaption>
  //     {e.example.value}
  //   </Badge>)
  // }

  if (e.type !== "circular") {
    d.push(<Entity entity={e} />)
  }

  return <>
    <SiteGlossary.GlossaryTerm>
      {t.length !== 0 && <BadgeGroup>{t}</BadgeGroup>}
    </SiteGlossary.GlossaryTerm>
    <SiteGlossary.GlossaryDetails>
      {d}
    </SiteGlossary.GlossaryDetails>
  </>
}

interface ExamplesProperties {
  examples: ServiceDeclaration.Example[]
}

function Examples(p: ExamplesProperties): JSX.Element {
  const {examples} = p
  const {SyntaxHighlight} = useContext(ctx)

  return <CodeListing>
    <CodeListingTabListWrapper>
      <CodeListingTabList label="List of Request Examples">
        {examples.map((e) => <CodeListingTab id={e.syntax}>
          {title(e.syntax)}
        </CodeListingTab>)}
      </CodeListingTabList>
    </CodeListingTabListWrapper>
    {examples.map((e) => <CodeListingTabPanel by={e.syntax}>
      <pre>
        <code>
          <SyntaxHighlight syntax={e.syntax}>
            {e.code}
          </SyntaxHighlight>
        </code>
      </pre>
    </CodeListingTabPanel>)}
  </CodeListing>

  function title(s: string): string {
    switch (s) {
    case "http":
      return "HTTP"
    case "shell":
      return "cURL"
    }
    throw new Error(`Unknown syntax: ${s}`)
  }
}

interface HeadingProperties {
  for: ServiceSection
}

function Heading(p: HeadingProperties): JSX.Element {
  const {for: f} = p
  const c = useContext(ctx)
  return c.headings[f]
}
