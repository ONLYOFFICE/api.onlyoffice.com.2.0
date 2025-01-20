import {Template} from "@onlyoffice/preact-template"
import {
  type EnumRepresentable,
  type PlaygroundConfigurable,
  type PropertyConfigurable,
} from "@onlyoffice/site-config"
import {CloseIcon} from "@onlyoffice/ui-icons/poor/24.js"
import {
  Button,
  CodeEditor,
  Content,
  FormControl,
  FormControlAction,
  FormControlControl,
  FormControlLabel,
  Select,
  SelectCombobox,
  SelectListbox,
  SelectOption,
  SrOnly,
  TabList,
  TabListTab,
  TabListTabList,
  TabListTabListWrapper,
  TabListTabPanel,
  TextInput,
  TextInputControl,
} from "@onlyoffice/ui-kit"
import {type JSX} from "preact"

const samples = [
  {id: "html", label: "HTML"},
  {id: "js", label: "JavaScript"},
  {id: "json", label: "JSON"},
]

export interface DocumentEditorPlaygroundParameters {
  config: PlaygroundConfigurable
}

export function DocumentEditorPlayground(p: DocumentEditorPlaygroundParameters): JSX.Element {
  const ts: JSX.Element[] = []
  const po: JSX.Element[] = []
  const eo: JSX.Element[] = []

  for (const c of p.config.documentEditor.config) {
    const o = <SelectOption value={c.path}>{c.path}</SelectOption>
    if (c.path.startsWith("events.")) {
      eo.push(o)
    } else {
      po.push(o)
    }

    const t = <Template data-de-playground-property={c.path}><Property property={c} /></Template>
    ts.push(t)
  }

  const ct: JSX.Element[] = []
  const cp: JSX.Element[] = []

  for (const s of samples) {
    const t = <TabListTab id={s.id}>{s.label}</TabListTab>
    ct.push(t)

    const p = <TabListTabPanel labelledby={s.id}>
      <pre>
        <code data-de-playground-config-sample={s.id}>
          Sample of code in the process of generation...
        </code>
      </pre>
    </TabListTabPanel>
    cp.push(p)
  }

  const so: JSX.Element[] = []

  for (const s of p.config.documentEditor.scenarios) {
    const c = JSON.stringify(s.configs[0])
    const o = <SelectOption value={c}>{s.name}</SelectOption>
    so.push(o)
  }

  return <div class="de-playground">
    <div class="de-playground__inner">
      <h1 class="de-playground__heading">Document Editor Playground</h1>
      <document-editor-playground>
        <form class="de-playground__islands">
          <div class="de-playground__island de-playground__scenarios">
            <SrOnly><h2>Config Scenarios</h2></SrOnly>
            <FormControl>
              <FormControlLabel>Choose a scenario</FormControlLabel>
              <FormControlControl>
                <Select name="scenario">
                  <SelectCombobox>Select...</SelectCombobox>
                  <SelectListbox>{so}</SelectListbox>
                </Select>
              </FormControlControl>
            </FormControl>
          </div>
          <div class="de-playground__island de-playground__properties">
            <SrOnly><h2>Config Properties</h2></SrOnly>
            <FormControl>
              <FormControlLabel>Choose a property</FormControlLabel>
              <FormControlControl>
                <Select name="property">
                  <SelectCombobox>Select...</SelectCombobox>
                  <SelectListbox>
                    <SelectOption value="" selected={true}>Select...</SelectOption>
                    {po}
                  </SelectListbox>
                </Select>
              </FormControlControl>
            </FormControl>
            <div class="de-playground__container" data-de-playground-properties-container />
          </div>
          <div class="de-playground__island de-playground__events">
            <SrOnly><h2>Config Events</h2></SrOnly>
            <FormControl>
              <FormControlLabel>Choose an event</FormControlLabel>
              <FormControlControl>
                <Select name="event">
                  <SelectCombobox>Select...</SelectCombobox>
                  <SelectListbox>
                    <SelectOption value="" selected={true}>Select...</SelectOption>
                    {eo}
                  </SelectListbox>
                </Select>
              </FormControlControl>
            </FormControl>
            <div class="de-playground__container" data-de-playground-events-container />
          </div>
          <div class="de-playground__actions">
            <Button variant="accent" type="submit" name="action" value="play">Play</Button>
          </div>
          <div class="de-playground__island de-playground__editor">
            <SrOnly><h2>Document Editor</h2></SrOnly>
            <document-editor-mirror>
              <document-editor
                document-server-url={p.config.documentEditor.documentServerUrl}
                config="{}"
              />
            </document-editor-mirror>
          </div>
          <div class="de-playground__island de-playground__samples">
            <SrOnly><h2>Config Samples</h2></SrOnly>
            <Content>
              <TabList>
                <TabListTabListWrapper>
                  <TabListTabList label="">{ct}</TabListTabList>
                </TabListTabListWrapper>
                {cp}
              </TabList>
            </Content>
          </div>
          {ts}
        </form>
      </document-editor-playground>
    </div>
  </div>
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
  case "undefined":
    return <></>
  default:
    throw new Error(`Unknown property type: ${property.type}`)
  }
}

function BooleanProperty({property}: PropertyParameters): JSX.Element {
  return <FormControl>
    <FormControlLabel>
      <a href={property.href}>{property.path}</a>
    </FormControlLabel>
    <FormControlAction>
      <button type="button" name="remove" value={property.path}>
        <CloseIcon height={16} width={16} />
      </button>
    </FormControlAction>
    <FormControlControl>
      <TextInput>
        <TextInputControl>
          <input
            name={property.path}
            type="checkbox"
            checked={Boolean(property.default)}
          />
        </TextInputControl>
      </TextInput>
    </FormControlControl>
  </FormControl>
}

interface EnumPropertyParameters {
  property: PropertyConfigurable
  type: EnumRepresentable
}

function EnumProperty({property, type}: EnumPropertyParameters): JSX.Element {
  let cb: JSX.Element | null = null
  const lo: JSX.Element[] = [<SelectOption value="">Select...</SelectOption>]

  for (const t of type.cases) {
    if (t.type !== "literal") {
      throw new Error(`Non-literal enum case unsupported: ${t.type}`)
    }

    if (typeof t.const !== "string" && typeof t.const !== "number") {
      throw new TypeError(`Non-string/number enum case unsupported: ${t.const}`)
    }

    const s = t.const === property.default
    if (s) {
      cb = <SelectCombobox>{t.const}</SelectCombobox>
    }

    const v = String(t.const)
    const o = <SelectOption selected={s} value={v}>{t.const}</SelectOption>
    lo.push(o)
  }

  if (!cb) {
    cb = <SelectCombobox>Select...</SelectCombobox>
    lo[0].props.selected = true
  }

  return <FormControl>
    <FormControlLabel>
      <a href={property.href}>{property.path}</a>
    </FormControlLabel>
    <FormControlAction>
      <button type="button" name="remove" value={property.path}>
        <CloseIcon height={16} width={16} />
      </button>
    </FormControlAction>
    <FormControlControl>
      <Select name={property.path}>
        {cb}
        <SelectListbox>{lo}</SelectListbox>
      </Select>
    </FormControlControl>
  </FormControl>
}

function FunctionProperty({property}: PropertyParameters): JSX.Element {
  return <div class="de-playground__function-property">
    <FormControl>
      <FormControlLabel>
        <a href={property.href}>{property.path}</a>
      </FormControlLabel>
      <FormControlAction>
        <button type="button" name="remove" value={property.path}>
          <CloseIcon height={16} width={16} />
        </button>
      </FormControlAction>
      <FormControlControl>
        <CodeEditor id={property.path} name={property.path} />
      </FormControlControl>
    </FormControl>
    <Content>
      <output for={property.path}>
        <pre>
          <code data-de-playground-output-for={property.path}>
            Console of {property.path}()...
          </code>
        </pre>
      </output>
    </Content>
  </div>
}

function NumberProperty({property}: PropertyParameters): JSX.Element {
  // if (property.default !== undefined && typeof property.default !== "number") {
  //   throw new Error(`Default value for number property '${property.path}' must be a number, but got '${property.default}'`)
  // }
  return <FormControl>
    <FormControlLabel>
      <a href={property.href}>{property.path}</a>
    </FormControlLabel>
    <FormControlAction>
      <button type="button" name="remove" value={property.path}>
        <CloseIcon height={16} width={16} />
      </button>
    </FormControlAction>
    <FormControlControl>
      <TextInput>
        <TextInputControl>
          <input name={property.path} type="number" value={String(property.default)} />
        </TextInputControl>
      </TextInput>
    </FormControlControl>
  </FormControl>
}

function StringProperty({property}: PropertyParameters): JSX.Element {
  if (property.default !== undefined && typeof property.default !== "string") {
    throw new Error(`Default value for string property '${property.path}' must be a string, but got '${property.default}'`)
  }
  return <FormControl>
    <FormControlLabel>
      <a href={property.href}>{property.path}</a>
    </FormControlLabel>
    <FormControlAction>
      <button type="button" name="remove" value={property.path}>
        <CloseIcon height={16} width={16} />
      </button>
    </FormControlAction>
    <FormControlControl>
      <TextInput>
        <TextInputControl>
          <input name={property.path} type="text" value={property.default} />
        </TextInputControl>
      </TextInput>
    </FormControlControl>
  </FormControl>
}
