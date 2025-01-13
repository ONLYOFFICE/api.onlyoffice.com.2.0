import * as L from "@onlyoffice/library-declaration/next.js"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as SiteGlossary from "@onlyoffice/site-glossary"
import * as SiteSignature from "@onlyoffice/site-signature"
import {Badge, BadgeCaption, BadgeGroup} from "@onlyoffice/ui-kit"
import {type ComponentChildren, type JSX, createContext} from "preact"
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
  headings: Record<string, JSX.Element> = {}
  onLink: LibraryProperties["onLink"] = () => ""
  onRetrieve: LibraryProperties["onRetrieve"] = () => new L.GroupEntity()
}

const ctx = createContext(new Context())

export interface LibraryProperties extends ChildrenIncludable {
  entity: L.Entity
  onLink(this: void, id: number): string
  onRetrieve(this: void, id: number): L.Entity
}

export function Library(
  p: LibraryProperties,
): JSX.Element {
  const v = new Context()
  v.onLink = p.onLink
  v.onRetrieve = p.onRetrieve

  return <ctx.Provider value={v}>
    {p.children}
    <Entity entity={p.entity} />
  </ctx.Provider>
}

export interface LibraryHeadingProperties {
  children: ComponentChildren
  for: string
}

export function LibraryHeading(
  p: LibraryHeadingProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.headings[p.for] = <>{p.children}</>
  return <></>
}

export interface LibraryDescriptionProperties {
  children: Description
}

export function LibraryDescription(
  p: LibraryDescriptionProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.Description = p.children
  return <></>
}

export interface LibrarySyntaxHighlightProperties {
  children: SyntaxHighlight
}

export function LibrarySyntaxHighlight(
  p: LibrarySyntaxHighlightProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.SyntaxHighlight = p.children
  return <></>
}

interface EntityProperties {
  entity: L.Entity
}

function Entity(p: EntityProperties): JSX.Element {
  const {entity: e} = p

  switch (e.type) {
  case "group":
    return <></>
  case "declaration":
    return <>
      <Declaration declaration={e.declaration} />
      <Topics references={e.children} />
    </>
  }

  return <></>
}

interface DeclarationProperties {
  declaration: L.Declaration
}

function Declaration(p: DeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {Description} = useContext(ctx)

  return <>
    {d.signature.verbose.length !== 0 && <>
      <Signature variant="block" signature={d.signature.verbose} />
    </>}
    {d.description && <>
      <Heading for="Description" />
      <Description>{d.description}</Description>
    </>}
    {d.parameters.length !== 0 && <>
      <Heading for="Parameters" />
      <Fragments fragments={d.parameters} />
    </>}
    {d.returns && (d.returns.signature.concise.length !== 0 || d.returns.description) && <>
      <Heading for="Returns" />
      {d.returns.signature.concise.length !== 0 && <>
        <Signature variant="inline" signature={d.returns.signature.concise} />
      </>}
      {d.returns.description && <>
        <Description>{d.returns.description}</Description>
      </>}
    </>}
    {d.examples && <>
      <Heading for="Examples" />
      <Description>{d.examples}</Description>
    </>}
  </>
}

interface FragmentsProperties {
  fragments: L.Fragment[]
}

function Fragments(p: FragmentsProperties): JSX.Element {
  const {Description} = useContext(ctx)

  return <SiteGlossary.Glossary>
    {p.fragments.map((f) => <>
      <SiteGlossary.GlossaryTerm>
        <BadgeGroup>
          <Badge variant="calm">{f.name}</Badge>
          {f.signature.concise.length !== 0 && <Badge variant="transparent">
            <Signature variant="inline" signature={f.signature.concise} />
          </Badge>}
          {f.optional && <Badge variant="neutral">
            optional
          </Badge>}
          {f.default && <Badge variant="neutral">
            <BadgeCaption>default</BadgeCaption>{f.default}
          </Badge>}
        </BadgeGroup>
      </SiteGlossary.GlossaryTerm>
      <SiteGlossary.GlossaryDetails>
        {f.description && <Description>{f.description}</Description>}
      </SiteGlossary.GlossaryDetails>
    </>)}
  </SiteGlossary.Glossary>
}

interface TopicsProperties {
  references: number[]
}

function Topics(p: TopicsProperties): JSX.Element {
  return <>{p.references.map((id) => <Topic id={id} />)}</>
}

interface TopicProperties {
  id: number
}

function Topic(p: TopicProperties): JSX.Element {
  const {Description, onRetrieve} = useContext(ctx)

  const e = onRetrieve(p.id)
  if (e.type !== "group") {
    return <></>
  }

  return <>
    <Heading for={e.group.name} />
    {e.group.description && <Description>{e.group.description}</Description>}
    <SiteGlossary.Glossary>
      {e.children.map((id) => <TopicItem id={id} />)}
    </SiteGlossary.Glossary>
  </>
}

interface TopicItemProperties {
  id: number
}

function TopicItem(p: TopicItemProperties): JSX.Element {
  const {Description, onLink, onRetrieve} = useContext(ctx)

  const y = onRetrieve(p.id)
  if (y.type !== "declaration") {
    return <></>
  }

  const {declaration: d} = y

  let n = <>{d.name}</>

  const u = onLink(y.id)
  if (u) {
    n = <a href={u}>{n}</a>
  }

  n = <SiteGlossary.GlossaryName>{n}</SiteGlossary.GlossaryName>

  let s = <></>

  if (d.signature.concise.length !== 0) {
    s = <Signature variant="inline" signature={d.signature.concise} />
  }

  let t = <></>

  if (d.summary) {
    t = <Description>{d.summary}</Description>
  }

  return <>
    <SiteGlossary.GlossaryTerm>
      {n}{s}
    </SiteGlossary.GlossaryTerm>
    <SiteGlossary.GlossaryDetails>
      {t}
    </SiteGlossary.GlossaryDetails>
  </>
}

function Signature(p: SiteSignature.SignatureProperties): JSX.Element {
  const {onLink} = useContext(ctx)

  return <SiteSignature.Signature {...p}>
    <SiteSignature.SignatureReference>
      {(p) => {
        const id = Number.parseInt(p.reference.id)
        const u = onLink(id)
        if (!u) {
          return <>{p.children}</>
        }
        return <a href={u}>{p.children}</a>
      }}
    </SiteSignature.SignatureReference>
  </SiteSignature.Signature>
}

interface HeadingProperties {
  for: string
}

function Heading(p: HeadingProperties): JSX.Element {
  const {for: f} = p
  const c = useContext(ctx)
  const e = c.headings[f]
  if (!e) {
    return <h2>{p.for}</h2>
  }
  return e
}
