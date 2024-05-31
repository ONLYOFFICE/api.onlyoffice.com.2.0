import {equal as eq, is, unreachable as un} from "uvu/assert"
import {test} from "uvu"
import {
  BooleanType,
  Config,
  DocumentEditor,
  EnumType,
  FunctionType,
  LiteralType,
  NumberType,
  Playground,
  Property,
  Server,
  StringType,
  UndefinedType
} from "./main.ts"

test("UndefinedType(): initializes a undefined type", () => {
  const t = new UndefinedType()
  is(t instanceof UndefinedType, true)
})

test("UndefinedType(): initializes a undefined type with the correct order of keys", () => {
  const t = new UndefinedType()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("UndefinedType(): initializes a undefined type with the undefined type", () => {
  const t = new UndefinedType()
  is(t.type, "undefined")
})

test("StringType(): initializes a string type", () => {
  const t = new StringType()
  is(t instanceof StringType, true)
})

test("StringType(): initializes a string type with the correct order of keys", () => {
  const t = new StringType()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("StringType(): initializes a string type with the string type", () => {
  const t = new StringType()
  is(t.type, "string")
})

test("NumberType(): initializes a number type", () => {
  const t = new NumberType()
  is(t instanceof NumberType, true)
})

test("NumberType(): initializes a number type with the correct order of keys", () => {
  const t = new NumberType()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("NumberType(): initializes a number type with the number type", () => {
  const t = new NumberType()
  is(t.type, "number")
})

test("LiteralType(): initializes a literal type", () => {
  const t = new LiteralType()
  is(t instanceof LiteralType, true)
})

test("LiteralType(): initializes a literal type with the correct order of keys", () => {
  const t = new LiteralType()
  const a = Object.keys(t)
  eq(a, ["type", "base", "const"])
})

test("LiteralType(): initializes a literal type with the literal type", () => {
  const t = new LiteralType()
  is(t.type, "literal")
})

test("LiteralType(): initializes a literal type with an undefined base", () => {
  const t = new LiteralType()
  eq(t.base, new UndefinedType())
})

test("LiteralType(): initializes a literal type with an undefined const", () => {
  const t = new LiteralType()
  is(t.const, undefined)
})

test("EnumType(): initializes a enum type", () => {
  const t = new EnumType()
  is(t instanceof EnumType, true)
})

test("EnumType(): initializes a enum type with the correct order of keys", () => {
  const t = new EnumType()
  const a = Object.keys(t)
  eq(a, ["type", "cases"])
})

test("EnumType(): initializes a enum type with the enum type", () => {
  const e = new EnumType()
  is(e.type, "enum")
})

test("EnumType(): initializes a enum type with an empty array of cases", () => {
  const e = new EnumType()
  eq(e.cases, [])
})

test("FunctionType(): initializes a function type", () => {
  const t = new FunctionType()
  is(t instanceof FunctionType, true)
})

test("FunctionType(): initializes a function type with the correct order of keys", () => {
  const t = new FunctionType()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("FunctionType(): initializes a function type with the function type", () => {
  const t = new FunctionType()
  is(t.type, "function")
})

test("BooleanType(): initializes a boolean type", () => {
  const t = new BooleanType()
  is(t instanceof BooleanType, true)
})

test("BooleanType(): initializes a boolean type with the correct order of keys", () => {
  const t = new BooleanType()
  const a = Object.keys(t)
  eq(a, ["type"])
})

test("BooleanType(): initializes a boolean type with the boolean type", () => {
  const t = new BooleanType()
  is(t.type, "boolean")
})

test("Property(): initializes a property", () => {
  const p = new Property()
  is(p instanceof Property, true)
})

test("Property(): initializes a property with the correct order of keys", () => {
  const p = new Property()
  const a = Object.keys(p)
  // eq(a, ["path", "href", "type", "format", "default"])
  eq(a, ["path", "href", "type", "default"])
})

test("Property(): initializes a property with an empty path", () => {
  const p = new Property()
  is(p.path, "")
})

test("Property(): initializes a property with an empty href", () => {
  const p = new Property()
  is(p.href, "")
})

test("Property(): initializes a property with an undefined type", () => {
  const p = new Property()
  eq(p.type, new UndefinedType())
})

// test("Property(): initializes a property with an undefined format", () => {
//   const p = new Property()
//   is(p.format, undefined)
// })

test("Property(): initializes a property with an undefined default", () => {
  const p = new Property()
  is(p.default, undefined)
})

test("Property.fromJson(): initializes a property from json", () => {
  const j = "{}"
  const p = Property.fromJson(j)
  is(p instanceof Property, true)
})

test("Property.fromJson(): initializes a property from json with the path", () => {
  const j = '{"path":"p"}'
  const p = Property.fromJson(j)
  is(p.path, "p")
})

test("Property.fromJson(): initializes a property from json with the href", () => {
  const j = '{"href":"h"}'
  const p = Property.fromJson(j)
  is(p.href, "h")
})

test("Property.fromJson(): initializes a property from json with the string type", () => {
  const j = '{"type":"string"}'
  const p = Property.fromJson(j)
  eq(p.type, new StringType())
})

test("Property.fromJson(): initializes a property from json with the number type", () => {
  const j = '{"type":"number"}'
  const p = Property.fromJson(j)
  eq(p.type, new NumberType())
})

test("Property.fromJson(): initializes a property from json with the function type", () => {
  const j = '{"type":"function"}'
  const p = Property.fromJson(j)
  eq(p.type, new FunctionType())
})

test("Property.fromJson(): initializes a property from json with the boolean type", () => {
  const j = '{"type":"boolean"}'
  const p = Property.fromJson(j)
  eq(p.type, new BooleanType())
})

test("Property.fromJson(): throws an error when initializing a property from json with an unknown type", () => {
  const j = '{"type":"unknown"}'
  try {
    const p = Property.fromJson(j)
    un(`Expected an error, got ${p}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Unknown type: unknown")
  }
})

// test("Property.fromJson(): initializes a property from json with the format", () => {})

test("Property.fromJson(): initializes a property from json with cases", () => {
  const j = '{"type":"string","cases":["a","b"]}'
  const p = Property.fromJson(j)
  const e = new EnumType()
  const a = new LiteralType()
  a.base = new StringType()
  a.const = "a"
  const b = new LiteralType()
  b.base = new StringType()
  b.const = "b"
  e.cases = [a, b]
  eq(p.type, e)
})

test("Property.fromJson(): initializes a property from json with the default", () => {
  const j = '{"default":"d"}'
  const p = Property.fromJson(j)
  is(p.default, "d")
})

test("Property.fromYaml(): initializes a property from yaml", () => {
  const y = ""
  const p = Property.fromYaml(y)
  is(p instanceof Property, true)
})

test("DocumentEditor(): initializes a document editor", () => {
  const d = new DocumentEditor()
  is(d instanceof DocumentEditor, true)
})

test("DocumentEditor(): initializes a document editor with the correct order of keys", () => {
  const d = new DocumentEditor()
  const a = Object.keys(d)
  eq(a, ["documentServerUrl", "config"])
})

test("DocumentEditor(): initializes a document editor with an empty document server url", () => {
  const d = new DocumentEditor()
  is(d.documentServerUrl, "")
})

test("DocumentEditor(): initializes a document editor with an empty config", () => {
  const d = new DocumentEditor()
  eq(d.config, [])
})

test("DocumentEditor.fromJson(): initializes a document editor from json", () => {
  const j = "{}"
  const d = DocumentEditor.fromJson(j)
  is(d instanceof DocumentEditor, true)
})

test("DocumentEditor.fromJson(): initializes a document editor from json with the document server url", () => {
  const j = '{"documentServerUrl":"d"}'
  const d = DocumentEditor.fromJson(j)
  is(d.documentServerUrl, "d")
})

test("DocumentEditor.fromJson(): initializes a document editor from json with the config", () => {
  const j = '{"config":[{"path":"p"}]}'
  const d = DocumentEditor.fromJson(j)
  const p = new Property()
  p.path = "p"
  eq(d.config, [p])
})

test("DocumentEditor.fromYaml(): initializes a document editor from yaml", () => {
  const y = ""
  const d = DocumentEditor.fromYaml(y)
  is(d instanceof DocumentEditor, true)
})

test("DocumentEditor.merge(): merges the document server url of two empty document editors", () => {
  const a = new DocumentEditor()
  const b = new DocumentEditor()
  const c = DocumentEditor.merge(a, b)
  is(c.documentServerUrl, "")
})

test("DocumentEditor.merge(): uses the document server url of the first document editor when the second one is empty during a merge", () => {
  const a = new DocumentEditor()
  a.documentServerUrl = "a"
  const b = new DocumentEditor()
  const c = DocumentEditor.merge(a, b)
  is(c.documentServerUrl, "a")
})

test("DocumentEditor.merge(): uses the document server url of the second document editor when the first one is empty during a merge", () => {
  const a = new DocumentEditor()
  const b = new DocumentEditor()
  b.documentServerUrl = "b"
  const c = DocumentEditor.merge(a, b)
  is(c.documentServerUrl, "b")
})

test("DocumentEditor.merge(): uses the document server url of the second document editor when both are not empty during a merge", () => {
  const a = new DocumentEditor()
  a.documentServerUrl = "a"
  const b = new DocumentEditor()
  b.documentServerUrl = "b"
  const c = DocumentEditor.merge(a, b)
  is(c.documentServerUrl, "b")
})

test("DocumentEditor.merge(): merges the config of two empty document editors", () => {
  const a = new DocumentEditor()
  const b = new DocumentEditor()
  const c = DocumentEditor.merge(a, b)
  eq(c.config, [])
})

test("DocumentEditor.merge(): uses the config of the first document editor when the second one is empty during a merge", () => {
  const a = new DocumentEditor()
  const p = new Property()
  p.path = "p"
  a.config = [p]
  const b = new DocumentEditor()
  const c = DocumentEditor.merge(a, b)
  eq(c.config, [p])
})

test("DocumentEditor.merge(): uses the config of the second document editor when the first one is empty during a merge", () => {
  const a = new DocumentEditor()
  const b = new DocumentEditor()
  const p = new Property()
  p.path = "q"
  b.config = [p]
  const c = DocumentEditor.merge(a, b)
  eq(c.config, [p])
})

test("DocumentEditor.merge(): throws an error when merging two document editor non-empty configs", () => {
  const a = new DocumentEditor()
  const p = new Property()
  p.path = "p"
  a.config = [p]
  const b = new DocumentEditor()
  const q = new Property()
  q.path = "q"
  b.config = [q]
  try {
    const c = DocumentEditor.merge(a, b)
    un(`Expected an error, got ${c}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Merging of config is not supported")
  }
})

test("Playground(): initializes a playground", () => {
  const p = new Playground()
  is(p instanceof Playground, true)
})

test("Playground(): initializes a playground with the correct order of keys", () => {
  const p = new Playground()
  const a = Object.keys(p)
  eq(a, ["documentEditor"])
})

test("Playground(): initializes a playground with an empty document editor", () => {
  const p = new Playground()
  eq(p.documentEditor, new DocumentEditor())
})

test("Playground.fromJson(): initializes a playground from json", () => {
  const j = "{}"
  const p = Playground.fromJson(j)
  is(p instanceof Playground, true)
})

test("Playground.fromJson(): initializes a playground from json with the document editor", () => {
  const j = '{"documentEditor":{"documentServerUrl":"d"}}'
  const p = Playground.fromJson(j)
  const d = new DocumentEditor()
  d.documentServerUrl = "d"
  eq(p.documentEditor, d)
})

test("Playground.fromYaml(): initializes a playground from yaml", () => {
  const y = ""
  const p = Playground.fromYaml(y)
  is(p instanceof Playground, true)
})

test("Playground.merge(): merges the document editor of two empty playgrounds", () => {
  const a = new Playground()
  const b = new Playground()
  const c = Playground.merge(a, b)
  eq(c.documentEditor, new DocumentEditor())
})

test("Playground.merge(): merges the document editor of the first playground when the second one is empty", () => {
  const a = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "a"
  a.documentEditor = d
  const b = new Playground()
  const c = Playground.merge(a, b)
  eq(c.documentEditor, d)
})

test("Playground.merge(): merges the document editor of the second playground when the first one is empty", () => {
  const a = new Playground()
  const b = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "b"
  b.documentEditor = d
  const c = Playground.merge(a, b)
  eq(c.documentEditor, d)
})

test("Playground.merge(): merges the document editor of the second playground when both are not empty", () => {
  const a = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "a"
  a.documentEditor = d
  const b = new Playground()
  const e = new DocumentEditor()
  e.documentServerUrl = "b"
  b.documentEditor = e
  const c = Playground.merge(a, b)
  eq(c.documentEditor, e)
})

test("Server(): initializes a server", () => {
  const s = new Server()
  is(s instanceof Server, true)
})

test("Server(): initializes a server with the correct order of keys", () => {
  const s = new Server()
  const a = Object.keys(s)
  eq(a, ["baseUrl"])
})

test("Server(): initializes a server with an empty base url", () => {
  const s = new Server()
  is(s.baseUrl, "")
})

test("Server.fromJson(): initializes a server from json", () => {
  const j = "{}"
  const s = Server.fromJson(j)
  is(s instanceof Server, true)
})

test("Server.fromJson(): initializes a server from json with the base url", () => {
  const j = '{"baseUrl":"b"}'
  const s = Server.fromJson(j)
  is(s.baseUrl, "b")
})

test("Server.fromYaml(): initializes a server from yaml", () => {
  const y = ""
  const s = Server.fromYaml(y)
  is(s instanceof Server, true)
})

test("Server.merge(): merges the base url of two empty servers", () => {
  const a = new Server()
  const b = new Server()
  const c = Server.merge(a, b)
  is(c.baseUrl, "")
})

test("Server.merge(): uses the base url of the first server when the second one is empty", () => {
  const a = new Server()
  a.baseUrl = "a"
  const b = new Server()
  const c = Server.merge(a, b)
  is(c.baseUrl, "a")
})

test("Server.merge(): uses the base url of the second server when the first one is empty", () => {
  const a = new Server()
  const b = new Server()
  b.baseUrl = "b"
  const c = Server.merge(a, b)
  is(c.baseUrl, "b")
})

test("Server.merge(): uses the base url of the second server when both are not empty", () => {
  const a = new Server()
  a.baseUrl = "a"
  const b = new Server()
  b.baseUrl = "b"
  const c = Server.merge(a, b)
  is(c.baseUrl, "b")
})

test("Config(): initializes a config", () => {
  const c = new Config()
  is(c instanceof Config, true)
})

test("Config(): initializes a config with the correct order of keys", () => {
  const c = new Config()
  const a = Object.keys(c)
  eq(a, ["baseUrl", "server", "playground"])
})

test("Config(): initializes a config with an empty base url", () => {
  const c = new Config()
  is(c.baseUrl, "")
})

test("Config(): initializes a config with an empty server", () => {
  const c = new Config()
  eq(c.server, new Server())
})

test("Config(): initializes a config with an empty playground", () => {
  const c = new Config()
  eq(c.playground, new Playground())
})

test("Config.fromJson(): initializes a config from json", () => {
  const j = "{}"
  const c = Config.fromJson(j)
  is(c instanceof Config, true)
})

test("Config.fromJson(): initializes a config from json with the base url", () => {
  const j = '{"baseUrl":"b"}'
  const c = Config.fromJson(j)
  is(c.baseUrl, "b")
})

test("Config.fromJson(): initializes a config from json with the server", () => {
  const j = '{"server":{"baseUrl":"b"}}'
  const c = Config.fromJson(j)
  const s = new Server()
  s.baseUrl = "b"
  eq(c.server, s)
})

test("Config.fromJson(): initializes a config from json with the playground", () => {
  const j = '{"playground":{"documentEditor":{"documentServerUrl":"d"}}}'
  const c = Config.fromJson(j)
  const p = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "d"
  p.documentEditor = d
  eq(c.playground, p)
})

test("Config.fromYaml(): initializes a config from yaml", () => {
  const y = ""
  const c = Config.fromYaml(y)
  is(c instanceof Config, true)
})

test("Config.merge(): merges the base url of two empty configs", () => {
  const a = new Config()
  const b = new Config()
  const c = Config.merge(a, b)
  is(c.baseUrl, "")
})

test("Config.merge(): uses the base url of the first config when the second one is empty", () => {
  const a = new Config()
  a.baseUrl = "a"
  const b = new Config()
  const c = Config.merge(a, b)
  is(c.baseUrl, "a")
})

test("Config.merge(): uses the base url of the second config when the first one is empty", () => {
  const a = new Config()
  const b = new Config()
  b.baseUrl = "b"
  const c = Config.merge(a, b)
  is(c.baseUrl, "b")
})

test("Config.merge(): uses the base url of the second config when both are not empty", () => {
  const a = new Config()
  a.baseUrl = "a"
  const b = new Config()
  b.baseUrl = "b"
  const c = Config.merge(a, b)
  is(c.baseUrl, "b")
})

test("Config.merge(): merges the server of two empty configs", () => {
  const a = new Config()
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.server, new Server())
})

test("Config.merge(): uses the server of the first config when the second one is empty", () => {
  const a = new Config()
  const s = new Server()
  s.baseUrl = "a"
  a.server = s
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.server, s)
})

test("Config.merge(): uses the server of the second config when the first one is empty", () => {
  const a = new Config()
  const b = new Config()
  const s = new Server()
  s.baseUrl = "b"
  b.server = s
  const c = Config.merge(a, b)
  eq(c.server, s)
})

test("Config.merge(): uses the server of the second config when both are not empty", () => {
  const a = new Config()
  const s = new Server()
  s.baseUrl = "a"
  a.server = s
  const b = new Config()
  const t = new Server()
  t.baseUrl = "b"
  b.server = t
  const c = Config.merge(a, b)
  eq(c.server, t)
})

test("Config.merge(): merges the playground of two empty configs", () => {
  const a = new Config()
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.playground, new Playground())
})

test("Config.merge(): uses the playground of the first config when the second one is empty", () => {
  const a = new Config()
  const p = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "a"
  p.documentEditor = d
  a.playground = p
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.playground, p)
})

test("Config.merge(): uses the playground of the second config when the first one is empty", () => {
  const a = new Config()
  const b = new Config()
  const p = new Playground()
  const d = new DocumentEditor()
  d.documentServerUrl = "b"
  p.documentEditor = d
  b.playground = p
  const c = Config.merge(a, b)
  eq(c.playground, p)
})

test.run()
