// import {Badge} from "@onlyoffice/documentation-ui-kit"

import type {Token} from "@onlyoffice/declaration-tokenizer"
import {referenceToken, tokenNode} from "@onlyoffice/declaration-tokenizer"
import type * as Library from "@onlyoffice/library-declaration"
import {type Resource} from "@onlyoffice/library-resource"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {Badge} from "@onlyoffice/ui-kit"
import {useContext} from "preact/hooks"
import {type JSX, Fragment, createContext, h} from "preact"

interface ContextProperties {
  onHighlightSyntax(p: ChildrenIncludable & {syntax: string}): any
  onLink(t: Token): string | undefined
  onProcessMarkdown(p: ChildrenIncludable): any
  onRetrieve: Resource["retrieve"]
}

const Context = createContext<ContextProperties>({
  onHighlightSyntax() {
    throw new Error("Not implemented")
  },
  onLink() {
    throw new Error("Not implemented")
  },
  onProcessMarkdown() {
    throw new Error("Not implemented")
  },
  onRetrieve() {
    throw new Error("Not implemented")
  }
})

export interface LibraryDeclarationProperties {
  declaration: Library.Declaration
  onHighlightSyntax: ContextProperties["onHighlightSyntax"]
  onLink: ContextProperties["onLink"]
  onProcessMarkdown: ContextProperties["onProcessMarkdown"]
  onRetrieve: ContextProperties["onRetrieve"]
}

export function LibraryDeclaration(
  {declaration, ...props}: LibraryDeclarationProperties
): JSX.Element {
  return <Context.Provider value={props}>
    <Declaration declaration={declaration} />
  </Context.Provider>
}

interface DeclarationProperties {
  declaration: Library.Declaration
}

function Declaration({declaration: d}: DeclarationProperties): JSX.Element {
  switch (d.kind) {
  case "class":
    return <ClassDeclaration declaration={d} />
  case "constructor":
  case "event":
  case "method":
    return <CEMDeclaration declaration={d} />
  case "property":
    return <PropertyDeclaration declaration={d} />
  case "type":
    return <TypeDeclaration declaration={d} />
  default:
    return <></>
  }
}

interface ClassDeclarationParameters {
  declaration: Library.ClassDeclaration
}

function ClassDeclaration({declaration: d}: ClassDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.constructors || d.instanceMethods || d.instanceProperties || d.events) && <DeclarationTopicsSection />}
    {d.constructors && <DeclarationConstructorsSection references={d.constructors} />}
    {d.instanceMethods && <DeclarationInstanceMethodsSection references={d.instanceMethods} />}
    {d.instanceProperties && <DeclarationInstancePropertiesSection references={d.instanceProperties} />}
    {d.events && <DeclarationEventsSection references={d.events} />}
    {(d.extends || d.extendsBy || d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.extends && <DeclarationExtendsSection references={d.extends} />}
    {d.extendsBy && <DeclarationExtendsBySection references={d.extendsBy} />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface CEMDeclarationParameters {
  declaration:
    Library.ConstructorDeclaration |
    Library.EventDeclaration |
    Library.MethodDeclaration
}

function CEMDeclaration({declaration: d}: CEMDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {d.type.parameters && <DeclarationParametersSection values={d.type.parameters} />}
    {d.type.returns && <DeclarationReturnsSection returns={d.type.returns} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface PropertyDeclarationParameters {
  declaration: Library.PropertyDeclaration
}

function PropertyDeclaration({declaration: d}: PropertyDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface TypeDeclarationParameters {
  declaration: Library.TypeDeclaration
}

function TypeDeclaration({declaration: d}: TypeDeclarationParameters): JSX.Element {
  if ("id" in d.type) {
    return <AnyTypeDeclaration declaration={d} />
  }
  switch (d.type.type) {
  case "any":
  case "array":
    return <AnyTypeDeclaration declaration={d} />
  case "function":
    return <FunctionTypeDeclaration declaration={d} type={d.type} />
  case "literal":
    return <AnyTypeDeclaration declaration={d} />
  case "object":
    return <ObjectTypeDeclaration declaration={d} type={d.type} />
  case "passthrough":
  case "union":
  case "unknown":
  case "void":
  default:
    return <AnyTypeDeclaration declaration={d} />
  }
}

function AnyTypeDeclaration({declaration: d}: TypeDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface FunctionTypeDeclarationParameters {
  declaration: Library.TypeDeclaration
  type: Library.FunctionType
}

function FunctionTypeDeclaration({declaration: d, type: t}: FunctionTypeDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {t.parameters && <DeclarationParametersSection values={t.parameters} />}
    {t.returns && <DeclarationReturnsSection returns={t.returns} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface ObjectTypeDeclarationParameters {
  declaration: Library.TypeDeclaration
  type: Library.ObjectType
}

function ObjectTypeDeclaration({declaration: d, type: t}: ObjectTypeDeclarationParameters): JSX.Element {
  return <>
    {d.signature && <DeclarationSignature signature={d.signature} />}
    {d.description && <DeclarationDescriptionSection description={d.description} />}
    {t.properties && <DeclarationPropertiesSection values={t.properties} />}
    {d.examples && <DeclarationExamplesSection examples={d.examples} />}
    {(d.overloads || d.overloadsBy) && <DeclarationRelationshipsSection />}
    {d.overloads && <DeclarationOverloadsSection references={d.overloads} />}
    {d.overloadsBy && <DeclarationOverloadsBySection references={d.overloadsBy} />}
    {d.tryIt && <DeclarationTryItSection content={d.tryIt} />}
  </>
}

interface DeclarationSignatureParameters {
  signature: Token[]
}

function DeclarationSignature({signature}: DeclarationSignatureParameters): JSX.Element {
  const c = <Signature signature={signature} />
  return <pre><code>{c}</code></pre>
}

interface DeclarationDescriptionSectionParameters {
  description: string
}

function DeclarationDescriptionSection({description}: DeclarationDescriptionSectionParameters): JSX.Element {
  const {onProcessMarkdown: Markdown} = useContext(Context)

  return <>
    <h2>Description</h2>
    <Markdown>{description}</Markdown>
  </>
}

interface DeclarationNamedValuesSectionParameters {
  values: Library.Value[]
}

function DeclarationParametersSection({values}: DeclarationNamedValuesSectionParameters): JSX.Element {
  return <DeclarationValuesSection title="Parameters" values={values} />
}

function DeclarationPropertiesSection({values}: DeclarationNamedValuesSectionParameters): JSX.Element {
  return <DeclarationValuesSection title="Properties" values={values} />
}

interface DeclarationValuesSectionParameters {
  title: string
  values: Library.Value[]
}

function DeclarationValuesSection({title, values}: DeclarationValuesSectionParameters): JSX.Element {
  const {onProcessMarkdown: Markdown} = useContext(Context)

  return <>
    <h2>{title}</h2>
    <dl>
      {values.map((p) => <>
        <Term p={p} />
        <dd>
          {p.description && <Markdown>{p.description}</Markdown>}
          {p.default && <p>Default:<> </><code>{String(p.default.value)}</code></p>}
        </dd>
      </>)}
    </dl>
  </>

  function Term({p}: {p: Library.Value}): JSX.Element {
    const a = [<code>{p.identifier}</code>]

    if (p.signature) {
      a.push(<> <Badge><Signature signature={p.signature} /></Badge></>)
    }

    return <dt>{a}</dt>
  }
}

interface DeclarationReturnsSectionParameters {
  returns: Library.FunctionReturns
}

function DeclarationReturnsSection({returns}: DeclarationReturnsSectionParameters): JSX.Element {
  const {onProcessMarkdown: Markdown} = useContext(Context)

  return <>
    <h2>Returns</h2>
    {returns.signature && <code>{<Signature signature={returns.signature} />}</code>}
    {returns.description && <Markdown>{returns.description}</Markdown>}
  </>
}

interface DeclarationExamplesSectionParameters {
  examples: Library.Example[]
}

function DeclarationExamplesSection({examples}: DeclarationExamplesSectionParameters): JSX.Element {
  const {onHighlightSyntax: SyntaxHighlight} = useContext(Context)

  return <>
    <h2>Examples</h2>
    {examples.map((e) => <Pre e={e} />)}
  </>

  function Pre({e}: {e: Library.Example}): JSX.Element {
    const c = <SyntaxHighlight syntax={e.syntax}>{e.code}</SyntaxHighlight>
    return <pre><code>{c}</code></pre>
  }
}

function DeclarationTopicsSection(): JSX.Element {
  return <h2>Topics</h2>
}

function DeclarationRelationshipsSection(): JSX.Element {
  return <h2>Relationships</h2>
}

interface DeclarationNamedTopicSectionParameters {
  references: Library.Reference[]
}

function DeclarationConstructorsSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Constructors" references={references} />
}

function DeclarationInstanceMethodsSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Instance Methods" references={references} />
}

function DeclarationInstancePropertiesSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Instance Properties" references={references} />
}

function DeclarationEventsSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Events" references={references} />
}

function DeclarationExtendsSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Extends" references={references} />
}

function DeclarationExtendsBySection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Extends By" references={references} />
}

function DeclarationOverloadsSection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Overloads" references={references} />
}

function DeclarationOverloadsBySection({references}: DeclarationNamedTopicSectionParameters): JSX.Element {
  return <DeclarationTopicSection title="Overloads By" references={references} />
}

interface DeclarationTopicSectionParameters {
  title: string
  references: Library.Reference[]
}

function DeclarationTopicSection({title, references}: DeclarationTopicSectionParameters): JSX.Element {
  const {
    onProcessMarkdown: Markdown,
    onRetrieve: retrieve
  } = useContext(Context)

  return <>
    <h3>{title}</h3>
    <dl>
      {references.map((r) => {
        const d = retrieve(r)
        if (!d) {
          return <></>
        }
        return <>
          {d.signature && <dt><FancyTitle id={d.id} signature={d.signature} /></dt>}
          {d.summary && <dd><Markdown>{d.summary}</Markdown></dd>}
        </>
      })}
    </dl>
  </>
}

interface DeclarationTryItSectionParameters {
  content: string
}

function DeclarationTryItSection({content}: DeclarationTryItSectionParameters): JSX.Element {
  const {onProcessMarkdown: Markdown} = useContext(Context)

  return <>
    <h2>Try It</h2>
    <Markdown>{content}</Markdown>
  </>
}

interface SignatureParameters {
  signature: Token[]
}

function Signature({signature}: SignatureParameters): JSX.Element {
  return <>{signature.map((t) => <SignatureToken token={t} />)}</>
}

interface SignatureTokenParameters {
  token: Token
}

function SignatureToken({token: t}: SignatureTokenParameters): JSX.Element {
  const {onLink} = useContext(Context)
  switch (t.type) {
  case "decorator":
    return <SignatureDecoratorToken>{t.text}</SignatureDecoratorToken>
  case "identifier":
    return <SignatureIdentifierToken>{t.text}</SignatureIdentifierToken>
  case "keyword":
    return <SignatureKeywordToken>{t.text}</SignatureKeywordToken>
  case "reference":
    return <SignatureReferenceToken href={onLink(t)}>{t.text}</SignatureReferenceToken>
  case "text":
    return <SignatureTextToken>{t.text}</SignatureTextToken>
  default:
    return <></>
  }
}

function SignatureDecoratorToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <span class="dt-de">{children}</span>
}

function SignatureIdentifierToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <span class="dt-id">{children}</span>
}

function SignatureKeywordToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <span class="dt-ke">{children}</span>
}

interface SignatureReferenceTokenParameters {
  children: any
  href?: string
}

function SignatureReferenceToken({children, href}: SignatureReferenceTokenParameters): JSX.Element {
  if (!href) {
    return <span class="dt-re">{children}</span>
  }
  return <a href={href} class="dt-re">{children}</a>
}

function SignatureTextToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <>{children}</>
}

interface FancyTitleParameters {
  id: string
  signature: Token[]
}

function FancyTitle({id, signature}: FancyTitleParameters): JSX.Element {
  const {onLink} = useContext(Context)
  const n = tokenNode()
  const t = referenceToken(n)
  t.id = id
  const c = signature.map((t) => <FancyTitleToken token={t} />)
  return <a class="dr" href={onLink(t)}><code>{c}</code></a>
}

interface FancyTitleTokenParameters {
  token: Token
}

function FancyTitleToken({token: t}: FancyTitleTokenParameters): JSX.Element {
  switch (t.type) {
  case "decorator":
    return <FancyTitleTextToken>{t.text}</FancyTitleTextToken>
  case "identifier":
    return <FancyTitleIdentifierToken>{t.text}</FancyTitleIdentifierToken>
  case "keyword":
  case "reference":
  case "text":
    return <FancyTitleTextToken>{t.text}</FancyTitleTextToken>
  default:
    return <></>
  }
}

function FancyTitleIdentifierToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <span class="dr-id">{children}</span>
}

function FancyTitleTextToken({children}: JSX.ElementChildrenAttribute): JSX.Element {
  return <>{children}</>
}
