import {equal as eq, is, unreachable as un} from "uvu/assert"
import {test} from "uvu"
import {
  BooleanType,
  Config,
  DocumentEditorConfig,
  EnumType,
  FunctionType,
  LiteralType,
  NumberType,
  PlaygroundConfig,
  PropertyConfig,
  ServerConfig,
  StringType,
  TabConfig,
  UndefinedType
} from "./main.ts"

test("TabConfig(): initializes a tab", () => {
  const t = new TabConfig()
  is(t instanceof TabConfig, true)
})

test("TabConfig(): initializes a tab with the correct order of keys", () => {
  const t = new TabConfig()
  const a = Object.keys(t)
  eq(a, ["id", "label"])
})

test("TabConfig(): initializes a tab with an empty id", () => {
  const t = new TabConfig()
  is(t.id, "")
})

test("TabConfig(): initializes a tab with an empty label", () => {
  const t = new TabConfig()
  is(t.label, "")
})

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

test("PropertyConfig(): initializes a property", () => {
  const p = new PropertyConfig()
  is(p instanceof PropertyConfig, true)
})

test("PropertyConfig(): initializes a property with the correct order of keys", () => {
  const p = new PropertyConfig()
  const a = Object.keys(p)
  // eq(a, ["path", "href", "type", "format", "default"])
  eq(a, ["path", "tab", "href", "type", "default"])
})

test("PropertyConfig(): initializes a property with an empty path", () => {
  const p = new PropertyConfig()
  is(p.path, "")
})

test("PropertyConfig(): initializes a property with an empty tab", () => {
  const p = new PropertyConfig()
  is(p.tab, "")
})

test("PropertyConfig(): initializes a property with an empty href", () => {
  const p = new PropertyConfig()
  is(p.href, "")
})

test("PropertyConfig(): initializes a property with an undefined type", () => {
  const p = new PropertyConfig()
  eq(p.type, new UndefinedType())
})

// test("PropertyConfig(): initializes a property with an undefined format", () => {
//   const p = new PropertyConfig()
//   is(p.format, undefined)
// })

test("PropertyConfig(): initializes a property with an undefined default", () => {
  const p = new PropertyConfig()
  is(p.default, undefined)
})

test("PropertyConfig.fromJson(): initializes a property from json", () => {
  const j = "{}"
  const p = PropertyConfig.fromJson(j)
  is(p instanceof PropertyConfig, true)
})

test("PropertyConfig.fromJson(): initializes a property from json with the path", () => {
  const j = '{"path":"p"}'
  const p = PropertyConfig.fromJson(j)
  is(p.path, "p")
})

test("PropertyConfig.fromJson(): initializes a property from json with the tab", () => {
  const j = '{"tab":"t"}'
  const p = PropertyConfig.fromJson(j)
  is(p.tab, "t")
})

test("PropertyConfig.fromJson(): initializes a property from json with the href", () => {
  const j = '{"href":"h"}'
  const p = PropertyConfig.fromJson(j)
  is(p.href, "h")
})

test("PropertyConfig.fromJson(): initializes a property from json with the string type", () => {
  const j = '{"type":"string"}'
  const p = PropertyConfig.fromJson(j)
  eq(p.type, new StringType())
})

test("PropertyConfig.fromJson(): initializes a property from json with the number type", () => {
  const j = '{"type":"number"}'
  const p = PropertyConfig.fromJson(j)
  eq(p.type, new NumberType())
})

test("PropertyConfig.fromJson(): initializes a property from json with the function type", () => {
  const j = '{"type":"function"}'
  const p = PropertyConfig.fromJson(j)
  eq(p.type, new FunctionType())
})

test("PropertyConfig.fromJson(): initializes a property from json with the boolean type", () => {
  const j = '{"type":"boolean"}'
  const p = PropertyConfig.fromJson(j)
  eq(p.type, new BooleanType())
})

test("PropertyConfig.fromJson(): throws an error when initializing a property from json with an unknown type", () => {
  const j = '{"type":"unknown"}'
  try {
    const p = PropertyConfig.fromJson(j)
    un(`Expected an error, got ${p}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Unknown type: unknown")
  }
})

// test("PropertyConfig.fromJson(): initializes a property from json with the format", () => {})

test("PropertyConfig.fromJson(): initializes a property from json with cases", () => {
  const j = '{"type":"string","cases":["a","b"]}'
  const p = PropertyConfig.fromJson(j)
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

test("PropertyConfig.fromJson(): initializes a property from json with the default", () => {
  const j = '{"default":"d"}'
  const p = PropertyConfig.fromJson(j)
  is(p.default, "d")
})

test("PropertyConfig.fromYaml(): initializes a property from yaml", () => {
  const y = ""
  const p = PropertyConfig.fromYaml(y)
  is(p instanceof PropertyConfig, true)
})

test("DocumentEditorConfig(): initializes a document editor", () => {
  const d = new DocumentEditorConfig()
  is(d instanceof DocumentEditorConfig, true)
})

test("DocumentEditorConfig(): initializes a document editor with the correct order of keys", () => {
  const d = new DocumentEditorConfig()
  const a = Object.keys(d)
  eq(a, ["documentServerUrl", "config"])
})

test("DocumentEditorConfig(): initializes a document editor with an empty document server url", () => {
  const d = new DocumentEditorConfig()
  is(d.documentServerUrl, "")
})

test("DocumentEditorConfig(): initializes a document editor with an empty config", () => {
  const d = new DocumentEditorConfig()
  eq(d.config, [])
})

test("DocumentEditorConfig.fromJson(): initializes a document editor from json", () => {
  const j = "{}"
  const d = DocumentEditorConfig.fromJson(j)
  is(d instanceof DocumentEditorConfig, true)
})

test("DocumentEditorConfig.fromJson(): initializes a document editor from json with the document server url", () => {
  const j = '{"documentServerUrl":"d"}'
  const d = DocumentEditorConfig.fromJson(j)
  is(d.documentServerUrl, "d")
})

test("DocumentEditorConfig.fromJson(): initializes a document editor from json with the config", () => {
  const j = '{"config":[{"path":"p"}]}'
  const d = DocumentEditorConfig.fromJson(j)
  const p = new PropertyConfig()
  p.path = "p"
  eq(d.config, [p])
})

test("DocumentEditorConfig.fromYaml(): initializes a document editor from yaml", () => {
  const y = ""
  const d = DocumentEditorConfig.fromYaml(y)
  is(d instanceof DocumentEditorConfig, true)
})

test("DocumentEditorConfig.merge(): merges the document server url of two empty document editors", () => {
  const a = new DocumentEditorConfig()
  const b = new DocumentEditorConfig()
  const c = DocumentEditorConfig.merge(a, b)
  is(c.documentServerUrl, "")
})

test("DocumentEditorConfig.merge(): uses the document server url of the first document editor when the second one is empty during a merge", () => {
  const a = new DocumentEditorConfig()
  a.documentServerUrl = "a"
  const b = new DocumentEditorConfig()
  const c = DocumentEditorConfig.merge(a, b)
  is(c.documentServerUrl, "a")
})

test("DocumentEditorConfig.merge(): uses the document server url of the second document editor when the first one is empty during a merge", () => {
  const a = new DocumentEditorConfig()
  const b = new DocumentEditorConfig()
  b.documentServerUrl = "b"
  const c = DocumentEditorConfig.merge(a, b)
  is(c.documentServerUrl, "b")
})

test("DocumentEditorConfig.merge(): uses the document server url of the second document editor when both are not empty during a merge", () => {
  const a = new DocumentEditorConfig()
  a.documentServerUrl = "a"
  const b = new DocumentEditorConfig()
  b.documentServerUrl = "b"
  const c = DocumentEditorConfig.merge(a, b)
  is(c.documentServerUrl, "b")
})

test("DocumentEditorConfig.merge(): merges the config of two empty document editors", () => {
  const a = new DocumentEditorConfig()
  const b = new DocumentEditorConfig()
  const c = DocumentEditorConfig.merge(a, b)
  eq(c.config, [])
})

test("DocumentEditorConfig.merge(): uses the config of the first document editor when the second one is empty during a merge", () => {
  const a = new DocumentEditorConfig()
  const p = new PropertyConfig()
  p.path = "p"
  a.config = [p]
  const b = new DocumentEditorConfig()
  const c = DocumentEditorConfig.merge(a, b)
  eq(c.config, [p])
})

test("DocumentEditorConfig.merge(): uses the config of the second document editor when the first one is empty during a merge", () => {
  const a = new DocumentEditorConfig()
  const b = new DocumentEditorConfig()
  const p = new PropertyConfig()
  p.path = "q"
  b.config = [p]
  const c = DocumentEditorConfig.merge(a, b)
  eq(c.config, [p])
})

test("DocumentEditorConfig.merge(): throws an error when merging two document editor non-empty configs", () => {
  const a = new DocumentEditorConfig()
  const p = new PropertyConfig()
  p.path = "p"
  a.config = [p]
  const b = new DocumentEditorConfig()
  const q = new PropertyConfig()
  q.path = "q"
  b.config = [q]
  try {
    const c = DocumentEditorConfig.merge(a, b)
    un(`Expected an error, got ${c}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Merging of config is not supported")
  }
})

test("PlaygroundConfig(): initializes a playground", () => {
  const p = new PlaygroundConfig()
  is(p instanceof PlaygroundConfig, true)
})

test("PlaygroundConfig(): initializes a playground with the correct order of keys", () => {
  const p = new PlaygroundConfig()
  const a = Object.keys(p)
  eq(a, ["documentEditor", "tabs"])
})

test("PlaygroundConfig(): initializes a playground with an empty document editor", () => {
  const p = new PlaygroundConfig()
  eq(p.documentEditor, new DocumentEditorConfig())
})

test("PlaygroundConfig(): initializes a playground with an empty tabs", () => {
  const p = new PlaygroundConfig()
  eq(p.tabs, [])
})

test("PlaygroundConfig.fromJson(): initializes a playground from json", () => {
  const j = "{}"
  const p = PlaygroundConfig.fromJson(j)
  is(p instanceof PlaygroundConfig, true)
})

test("PlaygroundConfig.fromJson(): initializes a playground from json with the document editor", () => {
  const j = '{"documentEditor":{"documentServerUrl":"d"}}'
  const p = PlaygroundConfig.fromJson(j)
  const d = new DocumentEditorConfig()
  d.documentServerUrl = "d"
  eq(p.documentEditor, d)
})

test("PlaygroundConfig.fromJson(): initializes a playground from json with the tabs", () => {
  const j = '{"tabs":{"t":"l"}}'
  const p = PlaygroundConfig.fromJson(j)
  const t = new TabConfig()
  t.id = "t"
  t.label = "l"
  eq(p.tabs, [t])
})

test("PlaygroundConfig.fromYaml(): initializes a playground from yaml", () => {
  const y = ""
  const p = PlaygroundConfig.fromYaml(y)
  is(p instanceof PlaygroundConfig, true)
})

test("PlaygroundConfig.merge(): merges the document editor of two empty playgrounds", () => {
  const a = new PlaygroundConfig()
  const b = new PlaygroundConfig()
  const c = PlaygroundConfig.merge(a, b)
  eq(c.documentEditor, new DocumentEditorConfig())
})

test("PlaygroundConfig.merge(): merges the document editor of the first playground when the second one is empty", () => {
  const a = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
  d.documentServerUrl = "a"
  a.documentEditor = d
  const b = new PlaygroundConfig()
  const c = PlaygroundConfig.merge(a, b)
  eq(c.documentEditor, d)
})

test("PlaygroundConfig.merge(): merges the document editor of the second playground when the first one is empty", () => {
  const a = new PlaygroundConfig()
  const b = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
  d.documentServerUrl = "b"
  b.documentEditor = d
  const c = PlaygroundConfig.merge(a, b)
  eq(c.documentEditor, d)
})

test("PlaygroundConfig.merge(): merges the document editor of the second playground when both are not empty", () => {
  const a = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
  d.documentServerUrl = "a"
  a.documentEditor = d
  const b = new PlaygroundConfig()
  const e = new DocumentEditorConfig()
  e.documentServerUrl = "b"
  b.documentEditor = e
  const c = PlaygroundConfig.merge(a, b)
  eq(c.documentEditor, e)
})

test("PlaygroundConfig.merge(): merges the tabs of two empty playgrounds", () => {
  const a = new PlaygroundConfig()
  const b = new PlaygroundConfig()
  const c = PlaygroundConfig.merge(a, b)
  eq(c.tabs, [])
})

test("PlaygroundConfig.merge(): uses the tabs of the first playground when the second one is empty", () => {
  const a = new PlaygroundConfig()
  const t = new TabConfig()
  t.id = "t"
  t.label = "l"
  a.tabs = [t]
  const b = new PlaygroundConfig()
  const c = PlaygroundConfig.merge(a, b)
  eq(c.tabs, [t])
})

test("PlaygroundConfig.merge(): uses the tabs of the second playground when the first one is empty", () => {
  const a = new PlaygroundConfig()
  const b = new PlaygroundConfig()
  const t = new TabConfig()
  t.id = "t"
  t.label = "l"
  b.tabs = [t]
  const c = PlaygroundConfig.merge(a, b)
  eq(c.tabs, [t])
})

test("PlaygroundConfig.merge(): throws an error when merging two non-empty tabs", () => {
  const a = new PlaygroundConfig()
  const t = new TabConfig()
  t.id = "t"
  t.label = "l"
  a.tabs = [t]
  const b = new PlaygroundConfig()
  const u = new TabConfig()
  u.id = "u"
  u.label = "m"
  b.tabs = [u]
  try {
    const c = PlaygroundConfig.merge(a, b)
    un(`Expected an error, got ${c}`)
  } catch (e) {
    is(e instanceof Error && e.message, "Merging of tabs is not supported")
  }
})

test("ServerConfig(): initializes a server", () => {
  const s = new ServerConfig()
  is(s instanceof ServerConfig, true)
})

test("ServerConfig(): initializes a server with the correct order of keys", () => {
  const s = new ServerConfig()
  const a = Object.keys(s)
  eq(a, ["baseUrl"])
})

test("ServerConfig(): initializes a server with an empty base url", () => {
  const s = new ServerConfig()
  is(s.baseUrl, "")
})

test("ServerConfig.fromJson(): initializes a server from json", () => {
  const j = "{}"
  const s = ServerConfig.fromJson(j)
  is(s instanceof ServerConfig, true)
})

test("ServerConfig.fromJson(): initializes a server from json with the base url", () => {
  const j = '{"baseUrl":"b"}'
  const s = ServerConfig.fromJson(j)
  is(s.baseUrl, "b")
})

test("ServerConfig.fromYaml(): initializes a server from yaml", () => {
  const y = ""
  const s = ServerConfig.fromYaml(y)
  is(s instanceof ServerConfig, true)
})

test("ServerConfig.merge(): merges the base url of two empty servers", () => {
  const a = new ServerConfig()
  const b = new ServerConfig()
  const c = ServerConfig.merge(a, b)
  is(c.baseUrl, "")
})

test("ServerConfig.merge(): uses the base url of the first server when the second one is empty", () => {
  const a = new ServerConfig()
  a.baseUrl = "a"
  const b = new ServerConfig()
  const c = ServerConfig.merge(a, b)
  is(c.baseUrl, "a")
})

test("ServerConfig.merge(): uses the base url of the second server when the first one is empty", () => {
  const a = new ServerConfig()
  const b = new ServerConfig()
  b.baseUrl = "b"
  const c = ServerConfig.merge(a, b)
  is(c.baseUrl, "b")
})

test("ServerConfig.merge(): uses the base url of the second server when both are not empty", () => {
  const a = new ServerConfig()
  a.baseUrl = "a"
  const b = new ServerConfig()
  b.baseUrl = "b"
  const c = ServerConfig.merge(a, b)
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
  eq(c.server, new ServerConfig())
})

test("Config(): initializes a config with an empty playground", () => {
  const c = new Config()
  eq(c.playground, new PlaygroundConfig())
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
  const s = new ServerConfig()
  s.baseUrl = "b"
  eq(c.server, s)
})

test("Config.fromJson(): initializes a config from json with the playground", () => {
  const j = '{"playground":{"documentEditor":{"documentServerUrl":"d"}}}'
  const c = Config.fromJson(j)
  const p = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
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
  eq(c.server, new ServerConfig())
})

test("Config.merge(): uses the server of the first config when the second one is empty", () => {
  const a = new Config()
  const s = new ServerConfig()
  s.baseUrl = "a"
  a.server = s
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.server, s)
})

test("Config.merge(): uses the server of the second config when the first one is empty", () => {
  const a = new Config()
  const b = new Config()
  const s = new ServerConfig()
  s.baseUrl = "b"
  b.server = s
  const c = Config.merge(a, b)
  eq(c.server, s)
})

test("Config.merge(): uses the server of the second config when both are not empty", () => {
  const a = new Config()
  const s = new ServerConfig()
  s.baseUrl = "a"
  a.server = s
  const b = new Config()
  const t = new ServerConfig()
  t.baseUrl = "b"
  b.server = t
  const c = Config.merge(a, b)
  eq(c.server, t)
})

test("Config.merge(): merges the playground of two empty configs", () => {
  const a = new Config()
  const b = new Config()
  const c = Config.merge(a, b)
  eq(c.playground, new PlaygroundConfig())
})

test("Config.merge(): uses the playground of the first config when the second one is empty", () => {
  const a = new Config()
  const p = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
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
  const p = new PlaygroundConfig()
  const d = new DocumentEditorConfig()
  d.documentServerUrl = "b"
  p.documentEditor = d
  b.playground = p
  const c = Config.merge(a, b)
  eq(c.playground, p)
})

test.run()
