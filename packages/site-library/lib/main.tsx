import type * as LibraryDeclaration from "@onlyoffice/library-declaration"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import * as Sig from "@onlyoffice/signature"
import * as SiteGlossary from "@onlyoffice/site-glossary"
import * as SiteSignature from "@onlyoffice/site-signature"
import {Badge, BadgeCaption, BadgeGroup} from "@onlyoffice/ui-kit"
import {type ComponentChildren, Fragment, type JSX, createContext, h} from "preact"
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
  /* eslint-disable unicorn/no-useless-undefined */
  Description: Description = () => null
  SyntaxHighlight: SyntaxHighlight = () => null
  headings: Record<LibrarySection, JSX.Element> = {
    "Constructors": <h2>Constructors</h2>,
    "Description": <h2>Description</h2>,
    "Events": <h2>Events</h2>,
    "Examples": <h2>Examples</h2>,
    "Extends By": <h2>Extends By</h2>,
    "Extends": <h2>Extends</h2>,
    "Instance Methods": <h2>Instance Methods</h2>,
    "Instance Properties": <h2>Instance Properties</h2>,
    "Overloads By": <h2>Overloads By</h2>,
    "Overloads": <h2>Overloads</h2>,
    "Parameters": <h2>Parameters</h2>,
    "Properties": <h2>Properties</h2>,
    "Returns": <h2>Returns</h2>,
    "Try It": <h2>Try It</h2>,
  }
  onLink: LibraryProperties["onLink"] = () => ""
  onRetrieve: LibraryProperties["onRetrieve"] = () => undefined
  /* eslint-enable unicorn/no-useless-undefined */
}

const ctx = createContext(new Context())

export interface LibraryProperties extends ChildrenIncludable {
  declaration: LibraryDeclaration.Declaration
  onLink(this: void, t: Sig.Reference): string
  onRetrieve(
    this: void,
    r: LibraryDeclaration.Reference,
  ): LibraryDeclaration.Declaration | undefined
}

export function Library(
  p: LibraryProperties,
): JSX.Element {
  const v = new Context()
  v.onLink = p.onLink
  v.onRetrieve = p.onRetrieve

  return <ctx.Provider value={v}>
    {p.children}
    <Declaration declaration={p.declaration} />
  </ctx.Provider>
}

export type LibrarySection =
  "Constructors" |
  "Description" |
  "Events" |
  "Examples" |
  "Extends By" |
  "Extends" |
  "Instance Methods" |
  "Instance Properties" |
  "Overloads By" |
  "Overloads" |
  "Parameters" |
  "Properties" |
  "Returns" |
  "Try It"

export interface LibraryHeadingProperties {
  children: ComponentChildren
  for: LibrarySection
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

interface DeclarationProperties {
  declaration: LibraryDeclaration.Declaration
}

function Declaration(p: DeclarationProperties): JSX.Element {
  const {declaration: d} = p

  switch (d.kind) {
  case "class":
    return <ClassDeclaration declaration={d} />
  case "constructor":
  case "event":
  case "method":
  case "property":
  case "type":
    return <TypeDeclaration declaration={d} />
  default:
    return <></>
  }
}

interface ClassDeclarationProperties {
  declaration: LibraryDeclaration.ClassDeclaration
}

function ClassDeclaration(p: ClassDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {Description} = useContext(ctx)

  return <>
    {d.signature && <Signature variant="block" signature={d.signature} />}
    {d.description && <>
      <Heading for="Description" />
      <Description>{d.description}</Description>
    </>}
    {d.examples && <>
      <Heading for="Examples" />
      <Examples examples={d.examples} />
    </>}
    {d.constructors && <>
      <Heading for="Constructors" />
      <References references={d.constructors} />
    </>}
    {d.instanceMethods && <>
      <Heading for="Instance Methods" />
      <References references={d.instanceMethods} />
    </>}
    {d.instanceProperties && <>
      <Heading for="Instance Properties" />
      <References references={d.instanceProperties} />
    </>}
    {d.events && <>
      <Heading for="Events" />
      <References references={d.events} />
    </>}
    {d.extends && <>
      <Heading for="Extends" />
      <References references={d.extends} />
    </>}
    {d.extendsBy && <>
      <Heading for="Extends By" />
      <References references={d.extendsBy} />
    </>}
    {d.overloads && <>
      <Heading for="Overloads" />
      <References references={d.overloads} />
    </>}
    {d.overloadsBy && <>
      <Heading for="Overloads By" />
      <References references={d.overloadsBy} />
    </>}
    {d.tryIt && <>
      <Heading for="Try It" />
      <Description>{d.tryIt}</Description>
    </>}
  </>
}

interface TypeDeclarationProperties {
  declaration:
    LibraryDeclaration.ConstructorDeclaration |
    LibraryDeclaration.EventDeclaration |
    LibraryDeclaration.MethodDeclaration |
    LibraryDeclaration.PropertyDeclaration |
    LibraryDeclaration.TypeDeclaration
}

function TypeDeclaration(p: TypeDeclarationProperties): JSX.Element {
  const {declaration: d} = p

  if ("id" in d.type) {
    return <AnyTypeDeclaration declaration={p.declaration} />
  }

  switch (d.type.type) {
  case "any":
  case "array":
    return <AnyTypeDeclaration declaration={d} />
  case "function":
    return <FunctionTypeDeclaration declaration={d} />
  case "literal":
    return <AnyTypeDeclaration declaration={d} />
  case "object":
    return <ObjectTypeDeclaration declaration={d} />
  default:
    return <AnyTypeDeclaration declaration={d} />
  }
}

function AnyTypeDeclaration(p: TypeDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {Description} = useContext(ctx)

  return <>
    {d.signature && <Signature variant="block" signature={d.signature} />}
    {d.description && <>
      <Heading for="Description" />
      <Description>{d.description}</Description>
    </>}
    {d.examples && <>
      <Heading for="Examples" />
      <Examples examples={d.examples} />
    </>}
    {d.overloads && <>
      <Heading for="Overloads" />
      <References references={d.overloads} />
    </>}
    {d.overloadsBy && <>
      <Heading for="Overloads By" />
      <References references={d.overloadsBy} />
    </>}
    {d.tryIt && <>
      <Heading for="Try It" />
      <Description>{d.tryIt}</Description>
    </>}
  </>
}

function FunctionTypeDeclaration(p: TypeDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {type: t} = d
  const {Description} = useContext(ctx)

  if ("id" in t || t.type !== "function") {
    return <></>
  }

  return <>
    {d.signature && <Signature variant="block" signature={d.signature} />}
    {d.description && <>
      <Heading for="Description" />
      <Description>{d.description}</Description>
    </>}
    {t.parameters && <>
      <Heading for="Parameters" />
      <Values values={t.parameters} />
    </>}
    {t.returns && <>
      <Heading for="Returns" />
      {t.returns.signature &&
        <Signature variant="inline" signature={t.returns.signature} />}
      {t.returns.description && <Description>
        {t.returns.description}
      </Description>}
    </>}
    {d.examples && <>
      <Heading for="Examples" />
      <Examples examples={d.examples} />
    </>}
    {d.overloads && <>
      <Heading for="Overloads" />
      <References references={d.overloads} />
    </>}
    {d.overloadsBy && <>
      <Heading for="Overloads By" />
      <References references={d.overloadsBy} />
    </>}
    {d.tryIt && <>
      <Heading for="Try It" />
      <Description>{d.tryIt}</Description>
    </>}
  </>
}

function ObjectTypeDeclaration(p: TypeDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {type: t} = d
  const {Description} = useContext(ctx)

  if ("id" in t || t.type !== "object") {
    return <></>
  }

  return <>
    {d.signature && <Signature variant="block" signature={d.signature} />}
    {d.description && <>
      <Heading for="Description" />
      <Description>{d.description}</Description>
    </>}
    {t.properties && <>
      <Heading for="Properties" />
      <Values values={t.properties} />
    </>}
    {d.examples && <>
      <Heading for="Examples" />
      <Examples examples={d.examples} />
    </>}
    {d.overloads && <>
      <Heading for="Overloads" />
      <References references={d.overloads} />
    </>}
    {d.overloadsBy && <>
      <Heading for="Overloads By" />
      <References references={d.overloadsBy} />
    </>}
    {d.tryIt && <>
      <Heading for="Try It" />
      <Description>{d.tryIt}</Description>
    </>}
  </>
}

interface ExamplesProperties {
  examples: LibraryDeclaration.Example[]
}

function Examples(p: ExamplesProperties): JSX.Element {
  const {examples: e} = p
  const {SyntaxHighlight} = useContext(ctx)

  return <>
    {e.map((e) => <pre>
      <code>
        <SyntaxHighlight syntax={e.syntax}>{e.code}</SyntaxHighlight>
      </code>
    </pre>)}
  </>
}

interface ReferenceProperties {
  references: LibraryDeclaration.Reference[]
}

function References(p: ReferenceProperties): JSX.Element {
  const {references: r} = p
  const {Description, onLink, onRetrieve} = useContext(ctx)

  return <SiteGlossary.Glossary>
    {r.map((r) => {
      const d = onRetrieve(r)
      if (!d) {
        return <></>
      }
      return <>
        <SiteGlossary.GlossaryTerm>
          {d.identifier && <SiteGlossary.GlossaryName>
            {(() => {
              const t = new Sig.Reference()
              t.id = d.id
              const u = onLink(t)
              if (!u) {
                return <>{d.identifier}</>
              }
              return <a href={u}>{d.identifier}</a>
            })()}
          </SiteGlossary.GlossaryName>}
          {d.summary && d.summary.signature &&
            <Signature variant="inline" signature={d.summary.signature} />}
        </SiteGlossary.GlossaryTerm>
        <SiteGlossary.GlossaryDetails>
          {d.summary && d.summary.text && <Description>
            {d.summary.text}
          </Description>}
        </SiteGlossary.GlossaryDetails>
      </>
    })}
  </SiteGlossary.Glossary>
}

interface ValuesProperties {
  values: LibraryDeclaration.Value[]
}

function Values(p: ValuesProperties): JSX.Element {
  const {values: v} = p
  const {Description} = useContext(ctx)

  return <SiteGlossary.Glossary>
    {v.map((v) => <>
      <SiteGlossary.GlossaryTerm>
        <BadgeGroup>
          {v.identifier && <Badge variant="calm">{v.identifier}</Badge>}
          {v.signature && <Badge variant="transparent">
            <Signature variant="inline" signature={v.signature} />
          </Badge>}
          {v.default && <Badge variant="neutral">
            <BadgeCaption>
              default
            </BadgeCaption>
            {v.default.value}
          </Badge>}
        </BadgeGroup>
      </SiteGlossary.GlossaryTerm>
      <SiteGlossary.GlossaryDetails>
        {v.description && <Description>{v.description}</Description>}
      </SiteGlossary.GlossaryDetails>
    </>)}
  </SiteGlossary.Glossary>
}

function Signature(p: SiteSignature.SignatureProperties): JSX.Element {
  const {onLink} = useContext(ctx)

  return <SiteSignature.Signature {...p}>
    <SiteSignature.SignatureReference>
      {(p) => {
        const u = onLink(p.reference)
        if (!u) {
          return <>{p.children}</>
        }
        return <a href={u}>{p.children}</a>
      }}
    </SiteSignature.SignatureReference>
  </SiteSignature.Signature>
}

interface HeadingProperties {
  for: LibrarySection
}

function Heading(p: HeadingProperties): JSX.Element {
  const {for: f} = p
  const c = useContext(ctx)
  return c.headings[f]
}
