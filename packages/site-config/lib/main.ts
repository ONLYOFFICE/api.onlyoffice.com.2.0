import yaml from "yaml"

export interface InputConfig {
  baseUrl?: string
  server?: InputServer
  playground?: InputPlayground
}

export interface Configurable {
  baseUrl: string
  server: ServerConfigurable
  playground: PlaygroundConfigurable
}

export class Config implements Configurable {
  baseUrl = ""
  server = new ServerConfig()
  playground = new PlaygroundConfig()

  static fromJson(data: string): Configurable {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Configurable {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ic: InputConfig): Configurable {
    const co = new Config()

    if (ic.baseUrl) {
      co.baseUrl = ic.baseUrl
    }

    if (ic.server) {
      co.server = ServerConfig.fromInput(ic.server)
    }

    if (ic.playground) {
      co.playground = PlaygroundConfig.fromInput(ic.playground)
    }

    return co
  }

  static merge(a: Configurable, b: Configurable): Configurable {
    const co = new Config()

    if (a.baseUrl && b.baseUrl) {
      co.baseUrl = b.baseUrl
    } else if (a.baseUrl) {
      co.baseUrl = a.baseUrl
    } else if (b.baseUrl) {
      co.baseUrl = b.baseUrl
    }

    co.server = ServerConfig.merge(a.server, b.server)
    co.playground = PlaygroundConfig.merge(a.playground, b.playground)

    return co
  }
}

export interface InputServer {
  baseUrl?: string
}

export interface ServerConfigurable {
  baseUrl: string
}

export class ServerConfig implements ServerConfigurable {
  baseUrl = ""

  static fromJson(data: string): ServerConfigurable {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): ServerConfigurable {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(is: InputServer): ServerConfigurable {
    const s = new ServerConfig()
    if (is.baseUrl) {
      s.baseUrl = is.baseUrl
    }
    return s
  }

  static merge(
    a: ServerConfigurable,
    b: ServerConfigurable
  ): ServerConfigurable {
    const s = new ServerConfig()

    if (a.baseUrl && b.baseUrl) {
      s.baseUrl = b.baseUrl
    } else if (a.baseUrl) {
      s.baseUrl = a.baseUrl
    } else if (b.baseUrl) {
      s.baseUrl = b.baseUrl
    }

    return s
  }
}

export interface InputPlayground {
  documentEditor?: InputDocumentEditor
  tabs?: Record<string, string>
}

export interface PlaygroundConfigurable {
  documentEditor: DocumentEditorConfigurable
  tabs: TabConfigurable[]
}

export class PlaygroundConfig implements PlaygroundConfigurable {
  documentEditor = new DocumentEditorConfig()
  tabs: TabConfig[] = []

  static fromJson(data: string): PlaygroundConfigurable {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): PlaygroundConfigurable {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ip: InputPlayground): PlaygroundConfigurable {
    const pl = new PlaygroundConfig()

    if (ip.documentEditor) {
      pl.documentEditor = DocumentEditorConfig.fromInput(ip.documentEditor)
    }

    if (ip.tabs) {
      for (const [id, lb] of Object.entries(ip.tabs)) {
        const t = new TabConfig()
        t.id = id
        t.label = lb
        pl.tabs.push(t)
      }
    }

    return pl
  }

  static merge(
    a: PlaygroundConfigurable,
    b: PlaygroundConfigurable
  ): PlaygroundConfigurable {
    const pl = new PlaygroundConfig()

    pl.documentEditor = DocumentEditorConfig.merge(
      a.documentEditor,
      b.documentEditor
    )

    if (a.tabs.length !== 0 && b.tabs.length !== 0) {
      throw new Error("Merging of tabs is not supported")
    } else if (a.tabs.length !== 0) {
      pl.tabs = a.tabs
    } else if (b.tabs.length !== 0) {
      pl.tabs = b.tabs
    }

    return pl
  }
}

export interface InputDocumentEditor {
  documentServerUrl?: string
  config?: InputProperty[]
}

export interface DocumentEditorConfigurable {
  documentServerUrl: string
  config: PropertyConfigurable[]
}

export class DocumentEditorConfig implements DocumentEditorConfigurable {
  documentServerUrl = ""
  config: PropertyConfig[] = []

  static fromJson(data: string): DocumentEditorConfigurable {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): DocumentEditorConfigurable {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ide: InputDocumentEditor): DocumentEditorConfigurable {
    const de = new DocumentEditorConfig()

    if (ide.documentServerUrl) {
      de.documentServerUrl = ide.documentServerUrl
    }

    if (ide.config) {
      for (const ip of ide.config) {
        const p = PropertyConfig.fromInput(ip)
        de.config.push(p)
      }
    }

    return de
  }

  static merge(
    a: DocumentEditorConfigurable,
    b: DocumentEditorConfigurable
  ): DocumentEditorConfigurable {
    const de = new DocumentEditorConfig()

    if (a.documentServerUrl && b.documentServerUrl) {
      de.documentServerUrl = b.documentServerUrl
    } else if (a.documentServerUrl) {
      de.documentServerUrl = a.documentServerUrl
    } else if (b.documentServerUrl) {
      de.documentServerUrl = b.documentServerUrl
    }

    if (a.config.length !== 0 && b.config.length !== 0) {
      throw new Error("Merging of config is not supported")
    } else if (a.config.length !== 0) {
      de.config = a.config
    } else if (b.config.length !== 0) {
      de.config = b.config
    }

    return de
  }
}

export interface InputProperty {
  path?: string
  tab?: string
  href?: string
  type?: "boolean" | "function" | "number" | "string"
  format?: "percent"
  cases?: (boolean | number | string)[]
  default?: boolean | number | string
}

export interface PropertyConfigurable {
  path: string
  tab: string
  href: string
  type: Type
  // format?: Format
  default?: boolean | number | string
}

export class PropertyConfig implements PropertyConfigurable {
  path = ""
  tab = ""
  href = ""
  type: Type = new UndefinedType()
  // format?: Format = undefined
  default?: boolean | number | string = undefined

  static fromJson(data: string): PropertyConfigurable {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): PropertyConfigurable {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ip: InputProperty): PropertyConfigurable {
    const p = new PropertyConfig()

    if (ip.path) {
      p.path = ip.path
    }

    if (ip.tab) {
      p.tab = ip.tab
    }

    if (ip.href) {
      p.href = ip.href
    }

    if (ip.type) {
      p.type = ptype(ip)
    }

    // if (ip.format) {
    //   p.format = ip.format
    // }

    if ("default" in ip) {
      p.default = ip.default
    }

    return p

    function ptype(ip: InputProperty): Type {
      if (ip.cases) {
        const et = new EnumType()
        for (const c of ip.cases) {
          const lt = new LiteralType()
          lt.base = type(ip)
          lt.const = c
          et.cases.push(lt)
        }
        return et
      }
      return type(ip)
    }

    function type(ip: InputProperty): Type {
      switch (ip.type) {
      case "boolean":
        return new BooleanType()
      case "function":
        return new FunctionType()
      case "number":
        return new NumberType()
      case "string":
        return new StringType()
      default:
        throw new Error(`Unknown type: ${ip.type}`)
      }
    }
  }
}

// export type Format = FormatMap[keyof FormatMap]

// export interface FormatMap {
//   percent: "percent"
//   pixel: "pixel"
// }

export type Type = TypeMap[keyof TypeMap]

export interface TypeMap {
  boolean: BooleanRepresentable
  enum: EnumRepresentable
  function: FunctionRepresentable
  literal: LiteralRepresentable
  number: NumberRepresentable
  string: StringRepresentable
  undefined: UndefinedRepresentable
}

export interface BooleanRepresentable extends TypeNode {
  type: "boolean"
}

export class BooleanType implements BooleanRepresentable {
  type = "boolean" as const
}

export interface EnumRepresentable extends TypeNode {
  type: "enum"
  cases: Type[]
}

export class EnumType implements EnumRepresentable {
  type = "enum" as const
  cases: Type[] = []
}

export interface FunctionRepresentable extends TypeNode {
  type: "function"
}

export class FunctionType implements FunctionRepresentable {
  type = "function" as const
}

export interface LiteralRepresentable extends TypeNode {
  type: "literal"
  base: Type
  const?: boolean | number | string
}

export class LiteralType implements LiteralRepresentable {
  type = "literal" as const
  base: Type = new UndefinedType()
  "const"?: boolean | number | string = undefined
}

export interface NumberRepresentable extends TypeNode {
  type: "number"
}

export class NumberType implements NumberRepresentable {
  type = "number" as const
}

export interface StringRepresentable extends TypeNode {
  type: "string"
}

export class StringType implements StringRepresentable {
  type = "string" as const
}

export interface UndefinedRepresentable extends TypeNode {
  type: "undefined"
}

export class UndefinedType implements UndefinedRepresentable {
  type = "undefined" as const
}

export interface TypeNode {
  type: string
}

export interface TabConfigurable {
  id: string
  label: string
}

export class TabConfig implements TabConfigurable {
  id: string = ""
  label: string = ""
}
