import type {
  EnumRepresentable,
  PlaygroundConfigurable,
  PropertyConfigurable
} from "@onlyoffice/site-config"
import {Button} from "@onlyoffice/ui-button"
import {CodeEditor} from "@onlyoffice/ui-code-editor"
import {
  CodeListing,
  CodeListingTab,
  CodeListingTabList,
  CodeListingTabListWrapper,
  CodeListingTabPanel
} from "@onlyoffice/ui-code-listing"
import {Content} from "@onlyoffice/ui-content"
import {
  ContentTab,
  ContentTabContainer,
  ContentTabList,
  ContentTabPanel
} from "@onlyoffice/ui-content-tab-container"
import {
  FormControl,
  FormControlLabel,
  FormControlControl
} from "@onlyoffice/ui-form-control"
import {
  Select,
  SelectCombobox,
  SelectListbox,
  SelectOption
} from "@onlyoffice/ui-select"
import type {JSX} from "preact"
import {Fragment, h} from "preact"

const samples = [
  {id: "html", label: "HTML"},
  {id: "js", label: "JavaScript"},
  {id: "json", label: "JSON"}
]

export interface SiteDocumentEditorPlaygroundParameters {
  config: PlaygroundConfigurable
}

export function SiteDocumentEditorPlayground(
  {config}: SiteDocumentEditorPlaygroundParameters
): JSX.Element {
  return <site-document-editor-playground class="de-playground">
    <Content>
      <form>
        <Properties />
        <div class="de-playground__control-list">
          <Button type="submit" value="reset">Reset</Button>
          <Button type="submit" value="play" variant="accent">Play</Button>
        </div>
      </form>
    </Content>
    <document-editor-mirror>
      <document-editor
        document-server-url={config.documentEditor.documentServerUrl}
        config="{}"
      >
      </document-editor>
    </document-editor-mirror>
    <Content>
      <Samples />
    </Content>
  </site-document-editor-playground>

  function Properties(): JSX.Element {
    const ts: JSX.Element[] = []
    const ps: JSX.Element[] = []

    for (const tb of config.tabs) {
      const t = <ContentTab id={tb.id}>{tb.label}</ContentTab>
      ts.push(t)

      const p = <ContentTabPanel by={tb.id}>
        {config.documentEditor.config
          .filter((p) => p.tab === tb.id)
          .map((p) => <Property property={p} />)}
      </ContentTabPanel>
      ps.push(p)
    }

    return <ContentTabContainer>
      <ContentTabList label="">{ts}</ContentTabList>
      {ps}
    </ContentTabContainer>
  }

  function Samples(): JSX.Element {
    const ts: JSX.Element[] = []
    const ps: JSX.Element[] = []

    for (const s of samples) {
      const t = <CodeListingTab id={s.id}>{s.label}</CodeListingTab>
      ts.push(t)

      const p = <CodeListingTabPanel by={s.id}>
        <pre><code data-config-sample={s.id}></code></pre>
      </CodeListingTabPanel>
      ps.push(p)
    }

    return <CodeListing>
      <CodeListingTabListWrapper>
        <CodeListingTabList label="">{ts}</CodeListingTabList>
      </CodeListingTabListWrapper>
      {ps}
    </CodeListing>
  }
}

interface PropertyParameters {
  property: PropertyConfigurable
}

function Property({property}: PropertyParameters): JSX.Element {
  switch (property.type.type) {
  case "boolean":
    return <BooleanProperty property={property} />
  case "enum":
    return <EnumProperty property={property} type={property.type} />
  case "function":
    return <FunctionProperty property={property} />
  case "literal":
    throw new Error(`Literal property type unsupported: ${property.path}`)
  case "number":
    return <NumberProperty property={property} />
  case "string":
    return <StringProperty property={property} />
  default:
    throw new Error(`Unknown property type: ${property.type}`)
  }
}

function BooleanProperty({property}: PropertyParameters): JSX.Element {
  return <FormControl>
    <FormControlLabel>
      <span>{property.path}</span>
    </FormControlLabel>
    <FormControlControl>
      <input
        name={property.path}
        type="checkbox"
        checked={Boolean(property.default)}
      />
    </FormControlControl>
  </FormControl>
}

interface EnumPropertyParameters {
  property: PropertyConfigurable
  type: EnumRepresentable
}

function EnumProperty({property, type}: EnumPropertyParameters): JSX.Element {
  let cb = <></>
  const lo: JSX.Element[] = []

  for (const t of type.cases) {
    if (t.type !== "literal") {
      throw new Error(`Non-literal enum case unsupported: ${t.type}`)
    }

    if (typeof t.const !== "string" && typeof t.const !== "number") {
      throw new Error(`Non-string/number enum case unsupported: ${t.const}`)
    }

    const s = t.const === property.default
    if (s) {
      cb = <SelectCombobox>{t.const}</SelectCombobox>
    }

    const v = String(t.const)
    const o = <SelectOption selected={s} value={v}>{t.const}</SelectOption>
    lo.push(o)
  }

  return <FormControl for="">
    <FormControlLabel>
      <span>{property.path}</span>
    </FormControlLabel>
    <FormControlControl>
      <Select name={property.path}>
        {cb}
        <SelectListbox>{lo}</SelectListbox>
      </Select>
    </FormControlControl>
  </FormControl>
}

function FunctionProperty({property}: PropertyParameters): JSX.Element {
  return <FormControl class="de-playground__function-property">
    <FormControlLabel>
      <span>{property.path}</span>
    </FormControlLabel>
    <FormControlControl>
      <CodeEditor id={property.path} name={property.path}></CodeEditor>
    </FormControlControl>
    <output for={property.path}>
      <pre><code data-output-for={property.path}></code></pre>
    </output>
  </FormControl>
}

function NumberProperty({property}: PropertyParameters): JSX.Element {
  // if (property.default !== undefined && typeof property.default !== "number") {
  //   throw new Error(`Default value for number property '${property.path}' must be a number, but got '${property.default}'`)
  // }
  return <FormControl>
    <FormControlLabel>
      <span>{property.path}</span>
    </FormControlLabel>
    <FormControlControl>
      <input name={property.path} type="number" value={property.default} />
    </FormControlControl>
  </FormControl>
}

function StringProperty({property}: PropertyParameters): JSX.Element {
  if (property.default !== undefined && typeof property.default !== "string") {
    throw new Error(`Default value for string property '${property.path}' must be a string, but got '${property.default}'`)
  }
  return <FormControl>
    <FormControlLabel>
      <span>{property.path}</span>
    </FormControlLabel>
    <FormControlControl>
      <input name={property.path} type="text" value={property.default} />
    </FormControlControl>
  </FormControl>
}
