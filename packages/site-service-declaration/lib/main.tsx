// import {Badge, CodeListing} from "@onlyoffice/documentation-ui-kit"

import type {ChildrenIncludable} from "@onlyoffice/preact-types"
import type * as Service from "@onlyoffice/service-declaration"
import type {Resource} from "@onlyoffice/service-resource"
import {
  Badge,
  Callback,
  CodeListing,
  // CodeListingAction,
  // CodeListingActionList,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel
} from "@onlyoffice/ui-kit"
import {useContext} from "preact/hooks"
import {type JSX, Fragment, createContext, h} from "preact"

interface ContextProperties {
  stack: string[]
  onHighlightSyntax(p: ChildrenIncludable & {syntax: string}): any
  onRenderDescription(p: ChildrenIncludable): any
  onRetrieve: Resource["resolve"]
}

const Context = createContext<ContextProperties>({
  stack: [],
  onHighlightSyntax() {
    throw new Error("not implemented")
  },
  onRenderDescription() {
    throw new Error("not implemented")
  },
  onRetrieve() {
    throw new Error("not implemented")
  }
})

export interface ServiceDeclarationProperties {
  declaration: Service.Declaration
  onHighlightSyntax: ContextProperties["onHighlightSyntax"]
  onRenderDescription: ContextProperties["onRenderDescription"]
  onRetrieve: ContextProperties["onRetrieve"]
}

export function ServiceDeclaration(
  {declaration, ...props}: ServiceDeclarationProperties
): JSX.Element {
  return <Context.Provider value={{stack: [], ...props}}>
    <Declaration declaration={declaration} />
  </Context.Provider>
}

interface DeclarationProperties {
  declaration: Service.Declaration
}

function Declaration({declaration: d}: DeclarationProperties): JSX.Element {
  switch (d.kind) {
  case "group":
    // todo
    return <></>
  case "request":
    return <RequestDeclaration declaration={d} />
  }
  // @ts-expect-error
  throw new Error(`Unknown declaration kind: ${d.kind}`)
}

interface RequestDeclarationProperties {
  declaration: Service.RequestDeclaration
}

function RequestDeclaration({declaration: d}: RequestDeclarationProperties): JSX.Element {
  return <>
    {d.endpoint && <DeclarationSignature signature={d.endpoint} />}
    {d.description && <DeclarationDescription description={d.description} />}
    {d.headerParameters && <DeclarationHeaderParameters parameters={d.headerParameters} />}
    {d.pathParameters && <DeclarationPathParameters parameters={d.pathParameters} />}
    {d.queryParameters && <DeclarationQueryParameters parameters={d.queryParameters} />}
    {d.bodyParameters && <DeclarationBodyParameters parameters={d.bodyParameters} />}
    {d.examples && <DeclarationExamples examples={d.examples} />}
    {d.responses && <DeclarationResponses responses={d.responses} />}
  </>
}

interface DeclarationSignatureProperties {
  signature: string
}

function DeclarationSignature({signature}: DeclarationSignatureProperties): JSX.Element {
  return <pre><code>{signature}</code></pre>
}

interface DeclarationDescriptionProperties {
  description: string
}

function DeclarationDescription({description}: DeclarationDescriptionProperties): JSX.Element {
  const {onRenderDescription: Description} = useContext(Context)
  return <>
    <h2>Description</h2>
    <Description>{description}</Description>
  </>
}

function DeclarationHeaderParameters({parameters}: DeclarationParametersSectionProperties): JSX.Element {
  return <>
    <h2>Headers</h2>
    <Properties properties={parameters} />
  </>
}

function DeclarationPathParameters({parameters}: DeclarationParametersSectionProperties): JSX.Element {
  return <>
    <h2>Path Parameters</h2>
    <Properties properties={parameters} />
  </>
}

function DeclarationQueryParameters({parameters}: DeclarationParametersSectionProperties): JSX.Element {
  return <>
    <h2>Query Parameters</h2>
    <Properties properties={parameters} />
  </>
}

interface DeclarationParametersSectionProperties {
  parameters: Service.Property[]
}

interface DeclarationBodyParametersProperties {
  parameters: Service.Value
}

function DeclarationBodyParameters({parameters}: DeclarationBodyParametersProperties): JSX.Element {
  return <>
    <h2>Body Parameters</h2>
    <Value value={parameters} />
  </>
}

interface DeclarationExamplesProperties {
  examples: Service.Example[]
}

function DeclarationExamples({examples}: DeclarationExamplesProperties): JSX.Element {
  const {onHighlightSyntax: SyntaxHighlight} = useContext(Context)

  return <>
    <h2>Request Examples</h2>
    <CodeListing>
      <CodeListingTabListWrapper>
        <CodeListingTabList label="List of Request Examples">
          {examples.map((e, i) => <CodeListingTab key={i} id={e.syntax}>
            {title(e.syntax)}
          </CodeListingTab>)}
        </CodeListingTabList>
      </CodeListingTabListWrapper>
      {examples.map((e, i) => <CodeListingTabPanel key={i} by={e.syntax}>
        <pre><code><SyntaxHighlight syntax={e.syntax}>
          {e.code}
        </SyntaxHighlight></code></pre>
      </CodeListingTabPanel>)}
    </CodeListing>
  </>

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

interface DeclarationResponsesProperties {
  responses: Service.Response[]
}

function DeclarationResponses({responses}: DeclarationResponsesProperties): JSX.Element {
  return <>
    <h2>Responses</h2>
    {responses.map((r, i) => <Response key={i} response={r} />)}
  </>
}

interface ResponseProperties {
  response: Service.Response
}

function Response({response: r}: ResponseProperties): JSX.Element {
  if ("id" in r) {
    const ctx = useContext(Context)
    if (ctx.stack.includes(r.id)) {
      return <></>
    }

    ctx.stack.push(r.id)

    const d = ctx.onRetrieve(r.id)
    if (!d) {
      throw new Error(`Unable to retrieve reference: ${r.id}`)
    }

    switch (true) {
    case "status" in d:
      return <>
        <Response response={d} />
        <Callback>{() => ctx.stack.pop()}</Callback>
      </>
    }

    throw new Error("Unknown reference type")
  }

  return <>
    <h3>{r.status}</h3>
    {r.description && <p>{r.description}</p>}
    {r.body && <Value value={r.body} />}
  </>
}

interface ValueParameters {
  value: Service.Value
}

function Value({value: v}: ValueParameters): JSX.Element {
  if ("id" in v) {
    const ctx = useContext(Context)
    if (ctx.stack.includes(v.id)) {
      return <></>
    }

    ctx.stack.push(v.id)

    const d = ctx.onRetrieve(v.id)
    if (!d) {
      throw new Error(`Unable to retrieve reference: ${v.id}`)
    }

    switch (true) {
    case "id" in d:
    case "type" in d:
      return <>
        <Value value={d} />
        <Callback>{() => ctx.stack.pop()}</Callback>
      </>
    }

    throw new Error("Unknown reference type")
  }

  switch (v.type) {
  case "array":
    return <>
      <ValueDescription value={v} />
      {v.items && <Value value={v.items} />}
    </>

  case "object":
    return <>
      <ValueDescription value={v} />
      {v.properties && <Properties properties={v.properties} />}
    </>

  case "boolean":
  case "integer":
  case "number":
  case "string":
  case "unknown":
    return <ValueDescription value={v} />
  }
}

interface PropertiesProperties {
  properties: Service.Property[]
}

function Properties({properties}: PropertiesProperties): JSX.Element {
  return <dl>{properties.map((p) => <Property key={p} property={p} />)}</dl>
}

interface PropertyProperties {
  property: Service.Property
}

function Property({property: p}: PropertyProperties): JSX.Element {
  if ("id" in p) {
    const ctx = useContext(Context)
    if (ctx.stack.includes(p.id)) {
      return <></>
    }

    ctx.stack.push(p.id)

    const d = ctx.onRetrieve(p.id)
    if (!d) {
      throw new Error(`Unable to retrieve reference: ${p.id}`)
    }

    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {identifier: p.identifier, ...d}
      return <>
        <Property property={p} />
        <Callback>{() => ctx.stack.pop()}</Callback>
      </>
    }

    throw new Error("Unknown reference type")
  }

  return <>
    <PropertyTerm property={p} />
    <PropertyDescription property={p} />
  </>
}

interface PropertyTermProperties {
  property: Service.Property
}

function PropertyTerm({property: p}: PropertyTermProperties): JSX.Element {
  return <dt>
    <code>{p.identifier}</code> <TypeBadge type={p} /> <ValueBadge value={p} />
  </dt>
}

interface PropertyDescriptionProperties {
  property: Service.Property
}

function PropertyDescription({property: p}: PropertyDescriptionProperties): JSX.Element {
  if ("id" in p) {
    const ctx = useContext(Context)
    if (ctx.stack.includes(p.id)) {
      return <></>
    }

    ctx.stack.push(p.id)

    const d = ctx.onRetrieve(p.id)
    if (!d) {
      throw new Error(`Unable to retrieve reference: ${p.id}`)
    }

    switch (true) {
    case "id" in d:
    case "type" in d:
      p = {identifier: p.identifier, ...d}
      return <>
        <PropertyDescription property={p} />
        <Callback>{() => ctx.stack.pop()}</Callback>
      </>
    }

    throw new Error("Unknown reference type")
  }

  switch (p.type) {
  case "array":
    if (!p.items) {
      return <></>
    }
    p = {identifier: p.identifier, ...p.items}
    return <PropertyDescription property={p} />

  case "object":
    return <dd>
      <ValueDescription value={p} />
      <TypeDescription type={p} />
      {p.properties && <details>
        <summary>Properties of <code>{p.identifier}</code></summary>
        <Properties properties={p.properties} />
      </details>}
    </dd>

  case "boolean":
  case "integer":
  case "number":
  case "string":
  case "unknown":
    return <dd>
      <ValueDescription value={p} />
      <TypeDescription type={p} />
    </dd>
  }

  // @ts-expect-error
  throw new Error(`Unknown reference type: ${p.type}`)
}

interface ValueBadgeProperties {
  value: Service.ValueNode
}

function ValueBadge({value}: ValueBadgeProperties): JSX.Element {
  if (value.required !== true) {
    return <></>
  }
  return <Badge variant="danger">required</Badge>
}

interface ValueDescriptionProperties {
  value: Service.Value
}

function ValueDescription({value: v}: ValueDescriptionProperties): JSX.Element {
  if (!v.description) {
    return <></>
  }
  return <p>{v.description}</p>
}

interface TypeBadgeProperties {
  type: Service.Type
}

function TypeBadge({type: t}: TypeBadgeProperties): JSX.Element {
  const ctx = useContext(Context)
  return <Badge>{resolve(t)}</Badge>

  function resolve(t: Service.Type): string {
    if ("id" in t) {
      const d = ctx.onRetrieve(t.id)
      if (!d) {
        throw new Error(`Unable to retrieve reference: ${t.id}`)
      }
      if (!("type" in d)) {
        throw new Error(`Reference does not have a type: ${t.id}`)
      }
      return resolve(d)
    }

    let s = t.type

    switch (t.type) {
    case "array":
      if (t.items === undefined) {
        break
      }
      // todo: array of strings not array of string.
      s += ` of ${resolve(t.items)}`
      break
    case "boolean":
    case "integer":
    case "number":
    case "object":
    case "string":
    case "unknown":
      break
    default:
      // @ts-expect-error
      throw new Error(`Unknown type: ${t.type}`)
    }

    return s
  }
}

interface TypeDescriptionProperties {
  type: Service.Type
}

function TypeDescription({type: t}: TypeDescriptionProperties): JSX.Element {
  if ("id" in t) {
    const ctx = useContext(Context)
    const d = ctx.onRetrieve(t.id)
    if (!d) {
      throw new Error(`Unable to retrieve reference: ${t.id}`)
    }
    if (!("type" in d)) {
      throw new Error(`Reference does not have a type: ${t.id}`)
    }
    return <TypeDescription type={d} />
  }

  const d = []

  // if (t.format !== undefined) {
  //   d.push(`Format: ${t.format}.`)
  // }

  if (t.cases) {
    d.push(<>Can be one of: {t.cases.map((c, i) => {
      const e = <code>{String(c)}</code>
      if (t.cases && i !== t.cases.length - 1) {
        return <>{e}, </>
      }
      return <>{e}.</>
    })}</>)
  }

  if (d.length === 0) {
    return <></>
  }

  return <p>{d}</p>
}
