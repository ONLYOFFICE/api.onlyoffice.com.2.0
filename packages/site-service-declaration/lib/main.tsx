import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import type * as Service from "@onlyoffice/service-declaration"
import {Badge} from "@onlyoffice/ui-kit"
import {Fragment, type JSX, createContext, h} from "preact"
import {useContext} from "preact/hooks"

interface Contextual {
  SyntaxHighlight: SyntaxHighlight
  Description: Description
}

export interface SyntaxHighlightProperties extends ChildrenIncludable {
  syntax: string
}

export interface SyntaxHighlight {
  (this: void, p: SyntaxHighlightProperties): JSX.Element
}

export interface DescriptionProperties extends ChildrenIncludable {}

export interface Description {
  (this: void, p: DescriptionProperties): JSX.Element
}

const Context = createContext<Contextual>(noopContext())

function noopContext(): Contextual {
  return {
    SyntaxHighlight: () => {
      throw new Error("not implemented")
    },
    Description: () => {
      throw new Error("not implemented")
    },
  }
}

export interface ServiceDeclarationProperties extends ChildrenIncludable {
  declaration: Service.Declaration
}

export function ServiceDeclaration(
  p: ServiceDeclarationProperties,
): JSX.Element {
  return <Context.Provider value={noopContext()}>
    {p.children}
    <Declaration declaration={p.declaration} />
  </Context.Provider>
}

export interface ServiceDeclarationSyntaxHighlightProperties {
  children: SyntaxHighlight
}

export function ServiceDeclarationSyntaxHighlight(
  p: ServiceDeclarationSyntaxHighlightProperties,
): JSX.Element {
  const c = useContext(Context)
  c.SyntaxHighlight = p.children
  return <></>
}

export interface ServiceDeclarationDescriptionProperties {
  children: Description
}

export function ServiceDeclarationDescription(
  p: ServiceDeclarationDescriptionProperties,
): JSX.Element {
  const c = useContext(Context)
  c.Description = p.children
  return <></>
}

interface DeclarationProperties {
  declaration: Service.Declaration
}

function Declaration(p: DeclarationProperties): JSX.Element {
  const {declaration: d} = p

  switch (d.type) {
  case "group":
    return <></>
  case "operation":
    return <OperationDeclaration declaration={d} />
  }

  // @ts-expect-error
  throw new Error(`Unknown declaration type: ${d.type}`)
}

interface OperationDeclarationProperties {
  declaration: Service.OperationDeclaration
}

function OperationDeclaration(p: OperationDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {request: r} = d

  return <>
    {r.method && r.path && <pre>
      <code>{r.method} {r.path}</code>
    </pre>}
    <h2>Request</h2>
    <Request request={r} />
    {d.responses.length !== 0 && <>
      <h2>Responses</h2>
      {d.responses.map((r) => <Response response={r} />)}
    </>}
  </>
}

interface RequestProperties {
  request: Service.Request
}

function Request(p: RequestProperties): JSX.Element {
  const {request: r} = p
  const {Description} = useContext(Context)

  return <>
    {r.description && <Description>{r.description}</Description>}
    {r.authorizations.length !== 0 && <>
      <h3>Authorization</h3>
      {r.authorizations.map((a) => <Authorization authorization={a} />)}
    </>}
    {r.cookieParameters.type.type !== "noop" && <>
      <h3>Cookies</h3>
      <Entity entity={r.cookieParameters} />
    </>}
    {r.headerParameters.type.type !== "noop" && <>
      <h3>Headers</h3>
      <Entity entity={r.headerParameters} />
    </>}
    {r.pathParameters.type.type !== "noop" && <>
      <h3>Path</h3>
      <Entity entity={r.pathParameters} />
    </>}
    {r.queryParameters.type.type !== "noop" && <>
      <h3>Query</h3>
      <Entity entity={r.queryParameters} />
    </>}
    {r.bodyParameters.type.type !== "noop" && <>
      <h3>Body</h3>
      <Entity entity={r.bodyParameters} />
    </>}
  </>
}

interface AuthorizationProperties {
  authorization: Service.Authorization
}

function Authorization(p: AuthorizationProperties): JSX.Element {
  const {authorization: a} = p
  const {Description} = useContext(Context)

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
  response: Service.Response
}

function Response(p: ResponseProperties): JSX.Element {
  const {response: r} = p
  const {Description} = useContext(Context)

  return <>
    <h3>{r.status}</h3>
    {r.description && <Description>{r.description}</Description>}
    {r.body.type.type !== "noop" && <>
      <Entity entity={r.body} />
    </>}
  </>
}

interface EntityProperties {
  entity: Service.Entity
}

function Entity(p: EntityProperties): JSX.Element {
  const {entity: e} = p
  const {Description} = useContext(Context)

  return <>
    {e.description && <Description>{e.description}</Description>}
    <Type type={e.type} />
  </>
}

interface TypeProperties {
  type: Service.Type
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
    return <></>
  case "null":
    return <></>
  case "number":
    return <></>
  case "object":
    return <ObjectType type={t} />
  case "string":
    return <></>
  case "union":
    return <></>
  case "unknown":
    return <></>
  }

  // @ts-expect-error
  throw new Error(`Unknown type: ${t.type}`)
}

interface ArrayTypeProperties {
  type: Service.ArrayType
}

function ArrayType(p: ArrayTypeProperties): JSX.Element {
  const {type: t} = p

  if (t.items.type === "circular") {
    return <code>[Circular]</code>
  }

  return <Entity entity={t.items} />
}

interface ComplexTypeProperties {
  type: Service.ComplexType
}

function ComplexType(p: ComplexTypeProperties): JSX.Element {
  const {type: t} = p

  return <>
    {t.entities.length !== 0 && <dl>
      {t.entities.map((e) => <>
        <dt>
          <TypeBadge type={e.type} />{" "}
          {e.format && <Badge>{e.format}</Badge>}
        </dt>
        <dd>
          <Entity entity={e} />
        </dd>
      </>)}
    </dl>}
  </>
}

interface EnumTypeProperties {
  type: Service.EnumType
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
  type: Service.LiteralType
}

function LiteralType(p: LiteralTypeProperties): JSX.Element {
  const {type: t} = p

  if (t.const.type === "noop") {
    return <></>
  }

  return <code>{String(t.const.value)}</code>
}

interface ObjectTypeProperties {
  type: Service.ObjectType
}

function ObjectType(p: ObjectTypeProperties): JSX.Element {
  const {type: t} = p

  return <>
    {t.properties.length !== 0 && <dl>
      {t.properties.map((p) => <Property property={p} />)}
    </dl>}
  </>
}

interface PropertyProperties {
  property: Service.Property
}

function Property(p: PropertyProperties): JSX.Element {
  const {property: r} = p

  return <>
    <PropertyTerm property={r} />
    <PropertyDescription property={r} />
  </>
}

function PropertyTerm(p: PropertyProperties): JSX.Element {
  const {property: r} = p

  return <dt>
    <code>{r.identifier}</code>{" "}
    <PropertyBadges property={r} />
  </dt>
}

function PropertyBadges(p: PropertyProperties): JSX.Element {
  const {property: r} = p

  if (r.self.type === "circular") {
    return <></>
  }

  return <>
    <TypeBadge type={r.self.type} />{" "}
    {r.self.format && <Badge>{r.self.format}</Badge>}{" "}
    {r.required && <Badge variant="danger">required</Badge>}
  </>
}

function PropertyDescription(p: PropertyProperties): JSX.Element {
  const {property: r} = p
  const {Description} = useContext(Context)

  if (r.self.type === "circular") {
    return <dd><code>[Circular]</code></dd>
  }

  const d: JSX.Element[] = []

  const {self: e} = r
  const {type: t} = e

  if (e.description) {
    d.push(<Description>{e.description}</Description>)
  }

  if (e.default.type !== "noop" && e.example) {
    d.push(<p>
      Default: <code>{String(e.default.value)}</code><br />
      Example: <code>{String(e.example)}</code>
    </p>)
  } else if (e.default.type !== "noop") {
    d.push(<p>
      Default: <code>{String(e.default.value)}</code>
    </p>)
  } else if (e.example) {
    d.push(<p>
      Example: <code>{String(e.example)}</code>
    </p>)
  }

  // todo: There needs to be a more general solution to cover a wider range of
  // use cases.

  if (
    t.type === "array" &&
    t.items.type !== "circular" &&
    t.items.type.type === "object" &&
    t.items.type.properties.length !== 0 ||
    t.type === "object" &&
    t.properties.length !== 0
  ) {
    d.push(<details>
      <summary>Properties of <code>{r.identifier}</code></summary>
      <Type type={t} />
    </details>)
  } else {
    d.push(<Type type={t} />)
  }

  return <dd>{d}</dd>
}

interface TypeBadgeProperties {
  type: Service.Type
}

function TypeBadge(p: TypeBadgeProperties): JSX.Element {
  const {type: t} = p

  return <Badge>{w(t)}</Badge>

  function w(t: Service.Type): string {
    if (t.type === "array") {
      let l = t.type

      if (t.items.type !== "circular") {
        l += ` of ${w(t.items.type)}`
      }

      return l
    }

    if (t.type === "complex") {
      switch (t.by) {
      case "allOf":
        return "all of"
      case "anyOf":
        return "any of"
      case "oneOf":
        return "one of"
      }
      throw new Error(`Unknown complex type: ${t.by}`)
    }

    if (t.type === "enum") {
      let l = t.type

      if (t.cases.length !== 0) {
        const [c] = t.cases

        if (c.type.type !== "literal") {
          throw new Error(`Expected literal type, got: ${c.type.type}`)
        }

        l += ` of ${w(c.type.base)}`
      }

      return l
    }

    if (t.type === "literal") {
      if (t.const.type === "noop") {
        return ""
      }
      return String(t.const.value)
    }

    return t.type
  }
}
