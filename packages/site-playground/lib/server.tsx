import type * as SiteConfig from "@onlyoffice/site-config"
import type {JSX} from "preact"
import {h} from "preact"

export interface SitePlaygroundProperties {
  config: SiteConfig.Playground
}

export function SitePlayground({config}: SitePlaygroundProperties): JSX.Element {
  return <site-playground>
    <document-editor-playground>
      <form>
        <output>
          <document-editor-mirror>
            <document-editor
              document-server-url={config.documentEditor.documentServerUrl}
              config="{}"
            >
            </document-editor>
          </document-editor-mirror>
        </output>
        {config.documentEditor.config.map((p) => <Property property={p} />)}
      </form>
    </document-editor-playground>
  </site-playground>
}

interface PropertyProperties {
  property: SiteConfig.Property
}

function Property({property}: PropertyProperties): JSX.Element {
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

function BooleanProperty({property}: PropertyProperties): JSX.Element {
  return <label>
    <code>{property.path}</code>
    <input name={property.path} type="checkbox" checked={Boolean(property.default)} />
  </label>
}

interface EnumPropertyProperties {
  property: SiteConfig.Property
  type: SiteConfig.EnumType
}

function EnumProperty({property, type}: EnumPropertyProperties): JSX.Element {
  return <label>
    <code>{property.path}</code>
    <select name={property.path}>
      {type.cases.map((t) => {
        if (t.type !== "literal") {
          throw new Error(`Non-literal enum case unsupported: ${t.type}`)
        }
        if (typeof t.const !== "string" && typeof t.const !== "number") {
          throw new Error(`Non-string/number enum case unsupported: ${t.const}`)
        }
        return <option value={t.const}>{t.const}</option>
      })}
    </select>
  </label>
}

function FunctionProperty({property}: PropertyProperties): JSX.Element {
  return <label>
    <code>{property.path}</code>
    <textarea id={property.path} name={property.path}></textarea>
    <output for={property.path}><pre><code data-output-for={property.path}></code></pre></output>
  </label>
}

function NumberProperty({property}: PropertyProperties): JSX.Element {
  // if (property.default !== undefined && typeof property.default !== "number") {
  //   throw new Error(`Default value for number property '${property.path}' must be a number, but got '${property.default}'`)
  // }
  return <label>
    <code>{property.path}</code>
    <input name={property.path} type="number" value={property.default} />
  </label>
}

function StringProperty({property}: PropertyProperties): JSX.Element {
  if (property.default !== undefined && typeof property.default !== "string") {
    throw new Error(`Default value for string property '${property.path}' must be a string, but got '${property.default}'`)
  }
  return <label>
    <code>{property.path}</code>
    <input name={property.path} type="text" value={property.default} />
  </label>
}
