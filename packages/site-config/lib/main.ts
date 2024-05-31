import yaml from "yaml"

export interface InputConfig {
  baseUrl?: string
  server?: InputServer
  playground?: InputPlayground
}

export class Config {
  baseUrl = ""
  server = new Server()
  playground = new Playground()

  static fromJson(data: string): Config {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Config {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ic: InputConfig): Config {
    const co = new Config()

    if (ic.baseUrl) {
      co.baseUrl = ic.baseUrl
    }

    if (ic.server) {
      co.server = Server.fromInput(ic.server)
    }

    if (ic.playground) {
      co.playground = Playground.fromInput(ic.playground)
    }

    return co
  }

  static merge(a: Config, b: Config): Config {
    const co = new Config()

    if (a.baseUrl && b.baseUrl) {
      co.baseUrl = b.baseUrl
    } else if (a.baseUrl) {
      co.baseUrl = a.baseUrl
    } else if (b.baseUrl) {
      co.baseUrl = b.baseUrl
    }

    co.server = Server.merge(a.server, b.server)
    co.playground = Playground.merge(a.playground, b.playground)

    return co
  }
}

export interface InputServer {
  baseUrl?: string
}

export class Server {
  baseUrl = ""

  static fromJson(data: string): Server {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Server {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(is: InputServer): Server {
    const s = new Server()
    if (is.baseUrl) {
      s.baseUrl = is.baseUrl
    }
    return s
  }

  static merge(a: Server, b: Server): Server {
    const s = new Server()

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
}

export class Playground {
  documentEditor = new DocumentEditor()

  static fromJson(data: string): Playground {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Playground {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ip: InputPlayground): Playground {
    const pl = new Playground()

    if (ip.documentEditor) {
      pl.documentEditor = DocumentEditor.fromInput(ip.documentEditor)
    }

    return pl
  }

  static merge(a: Playground, b: Playground): Playground {
    const pl = new Playground()

    pl.documentEditor = DocumentEditor.merge(a.documentEditor, b.documentEditor)

    return pl
  }
}

export interface InputDocumentEditor {
  documentServerUrl?: string
  config?: InputProperty[]
}

export class DocumentEditor {
  documentServerUrl = ""
  config: Property[] = []

  static fromJson(data: string): DocumentEditor {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): DocumentEditor {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ide: InputDocumentEditor): DocumentEditor {
    const de = new DocumentEditor()

    if (ide.documentServerUrl) {
      de.documentServerUrl = ide.documentServerUrl
    }

    if (ide.config) {
      for (const ip of ide.config) {
        const p = Property.fromInput(ip)
        de.config.push(p)
      }
    }

    return de
  }

  static merge(a: DocumentEditor, b: DocumentEditor): DocumentEditor {
    const de = new DocumentEditor()

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
  href?: string
  type?: "boolean" | "function" | "number" | "string"
  format?: "percent"
  cases?: (boolean | number | string)[]
  default?: boolean | number | string
}

export class Property {
  path = ""
  href = ""
  type: Type = new UndefinedType()
  // format?: Format = undefined
  default?: boolean | number | string = undefined

  static fromJson(data: string): Property {
    const o = JSON.parse(data)
    return this.fromInput(o)
  }

  static fromYaml(data: string): Property {
    let o = yaml.parse(data)
    if (!o) {
      o = {}
    }
    return this.fromInput(o)
  }

  static fromInput(ip: InputProperty): Property {
    const p = new Property()

    if (ip.path) {
      p.path = ip.path
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
  boolean: BooleanType
  enum: EnumType
  function: FunctionType
  literal: LiteralType
  number: NumberType
  string: StringType
  undefined: UndefinedType
}

export class BooleanType implements TypeNode {
  type = "boolean" as const
}

export class EnumType implements TypeNode {
  type = "enum" as const
  cases: Type[] = []
}

export class FunctionType implements TypeNode {
  type = "function" as const
}

export class LiteralType implements TypeNode {
  type = "literal" as const
  base: Type = new UndefinedType()
  "const"?: boolean | number | string = undefined
}

export class NumberType implements TypeNode {
  type = "number" as const
}

export class StringType implements TypeNode {
  type = "string" as const
}

export class UndefinedType implements TypeNode {
  type = "undefined" as const
}

export interface TypeNode {
  type: string
}
