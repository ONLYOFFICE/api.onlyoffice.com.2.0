import type * as Tokenizer from "@onlyoffice/declaration-tokenizer"
import type * as Library from "@onlyoffice/library-declaration"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {Badge} from "@onlyoffice/ui-kit"
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
  headings: Record<LibraryDeclarationSection, JSX.Element> = {
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
  onLink: LibraryDeclarationProperties["onLink"] = () => undefined
  onRetrieve: LibraryDeclarationProperties["onRetrieve"] = () => undefined
  /* eslint-enable unicorn/no-useless-undefined */
}

const ctx = createContext(new Context())

export interface LibraryDeclarationProperties extends ChildrenIncludable {
  declaration: Library.Declaration
  onLink(this: void, t: Tokenizer.Token): string | undefined
  onRetrieve(this: void, r: Library.Reference): Library.Declaration | undefined
}

export function LibraryDeclaration(
  p: LibraryDeclarationProperties,
): JSX.Element {
  const v = new Context()
  v.onLink = p.onLink
  v.onRetrieve = p.onRetrieve

  return <ctx.Provider value={v}>
    {p.children}
    <Root declaration={p.declaration} />
  </ctx.Provider>
}

export type LibraryDeclarationSection =
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

export interface LibraryDeclarationHeadingProperties {
  children: ComponentChildren
  for: LibraryDeclarationSection
}

export function LibraryDeclarationHeading(
  p: LibraryDeclarationHeadingProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.headings[p.for] = <>{p.children}</>
  return <></>
}

export interface LibraryDeclarationDescriptionProperties {
  children: Description
}

export function LibraryDeclarationDescription(
  p: LibraryDeclarationDescriptionProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.Description = p.children
  return <></>
}

export interface LibraryDeclarationSyntaxHighlightProperties {
  children: SyntaxHighlight
}

export function LibraryDeclarationSyntaxHighlight(
  p: LibraryDeclarationSyntaxHighlightProperties,
): JSX.Element {
  const c = useContext(ctx)
  c.SyntaxHighlight = p.children
  return <></>
}

interface RootProperties {
  declaration: Library.Declaration
}

function Root(p: RootProperties): JSX.Element {
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
  declaration: Library.ClassDeclaration
}

function ClassDeclaration(p: ClassDeclarationProperties): JSX.Element {
  const {declaration: d} = p
  const {Description} = useContext(ctx)

  return <>
    {d.signature && <Signature signature={d.signature} />}
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
    Library.ConstructorDeclaration |
    Library.EventDeclaration |
    Library.MethodDeclaration |
    Library.PropertyDeclaration |
    Library.TypeDeclaration
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
    {d.signature && <Signature signature={d.signature} />}
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
    {d.signature && <Signature signature={d.signature} />}
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
      {t.returns.signature && <code>
        <Tokens tokens={t.returns.signature} />
      </code>}
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
    {d.signature && <Signature signature={d.signature} />}
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

interface HeadingProperties {
  for: LibraryDeclarationSection
}

function Heading(p: HeadingProperties): JSX.Element {
  const {for: f} = p
  const c = useContext(ctx)
  return c.headings[f]
}

interface SignatureProperties {
  signature: Tokenizer.Token[]
}

interface ExamplesProperties {
  examples: Library.Example[]
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

function Signature(p: SignatureProperties): JSX.Element {
  const {signature: s} = p

  return <pre>
    <code>
      <Tokens tokens={s} />
    </code>
  </pre>
}

interface ReferenceProperties {
  references: Library.Reference[]
}

function References(p: ReferenceProperties): JSX.Element {
  const {references: r} = p
  const {Description, onRetrieve} = useContext(ctx)

  return <dl>
    {r.map((r) => {
      const d = onRetrieve(r)
      if (!d) {
        return <></>
      }
      return <>
        {d.signature && <dt>
          {d.identifier}
        </dt>}
        {d.summary && <dd>
          <Description>{d.summary}</Description>
        </dd>}
      </>
    })}
  </dl>
}

interface ValuesProperties {
  values: Library.Value[]
}

function Values(p: ValuesProperties): JSX.Element {
  const {values: v} = p
  const {Description} = useContext(ctx)

  return <dl>
    {v.map((v) => <>
      <dt>
        {v.identifier}
        {v.signature && <>
          {" "}
          <Badge>
            <Tokens tokens={v.signature} />
          </Badge>
        </>}
      </dt>
      <dd>
        {v.description && <Description>{v.description}</Description>}
        {v.default && <p>Default: <code>{String(v.default.value)}</code></p>}
      </dd>
    </>)}
  </dl>
}

interface TokensProperties {
  tokens: Tokenizer.Token[]
}

function Tokens(p: TokensProperties): JSX.Element {
  const {tokens: t} = p
  return <>{t.map((t) => <Token token={t} />)}</>
}

interface TokenProperties {
  token: Tokenizer.Token
}

function Token(p: TokenProperties): JSX.Element {
  const {token: t} = p

  switch (t.type) {
  case "decorator":
    return <DecoratorToken token={t} />
  case "identifier":
    return <IdentifierToken token={t} />
  case "keyword":
    return <KeywordToken token={t} />
  case "reference":
    return <ReferenceToken token={t} />
  case "text":
    return <TextToken token={t} />
  default:
    return <></>
  }
}

interface DecoratorTokenProperties {
  token: Tokenizer.DecoratorToken
}

function DecoratorToken(p: DecoratorTokenProperties): JSX.Element {
  const {token: t} = p
  return <span class="dt-de">{t.text}</span>
}

interface IdentifierTokenProperties {
  token: Tokenizer.IdentifierToken
}

function IdentifierToken(p: IdentifierTokenProperties): JSX.Element {
  const {token: t} = p
  return <span class="dt-id">{t.text}</span>
}

interface KeywordTokenProperties {
  token: Tokenizer.KeywordToken
}

function KeywordToken(p: KeywordTokenProperties): JSX.Element {
  const {token: t} = p
  return <span class="dt-ke">{t.text}</span>
}

interface ReferenceTokenProperties {
  token: Tokenizer.ReferenceToken
}

function ReferenceToken(p: ReferenceTokenProperties): JSX.Element {
  const {token: t} = p
  const {onLink} = useContext(ctx)
  const u = onLink(t)
  if (u) {
    return <a class="dt-re" href={u}>{t.text}</a>
  }
  return <span class="dt-re">{t.text}</span>
}

interface TextTokenProperties {
  token: Tokenizer.TextToken
}

function TextToken(p: TextTokenProperties): JSX.Element {
  const {token: t} = p
  return <>{t.text}</>
}
