// todo: add support for the @link tag.
// todo: should we bring back the see also?
// todo: should we apple void if no returns statement?
//       what about class constructors?

import process from "node:process"
import {Readable, Writable} from "node:stream"
import {AsyncTransform} from "@onlyoffice/async-transform"
import {Console} from "@onlyoffice/console"
import * as code from "@onlyoffice/declaration-code-example"
import {ESLint} from "@onlyoffice/eslint-config"
import {type Catharsis, type Doclet, type DocletParam} from "@onlyoffice/jsdoc"
import type * as Library from "@onlyoffice/library-declaration"
// eslint-disable-next-line no-duplicate-imports
import * as library from "@onlyoffice/library-declaration"
import * as signature from "@onlyoffice/library-signature"
import {firstParagraph, firstSentence, selectSection} from "@onlyoffice/markdown"
import * as Signature from "@onlyoffice/signature"
import {isStringLiteral} from "@onlyoffice/strings"
import languagedetection from "@vscode/vscode-languagedetection"
import {type ListItem} from "mdast"
import {fromMarkdown} from "mdast-util-from-markdown"
import {toMarkdown} from "mdast-util-to-markdown"
import {selectAll} from "unist-util-select"
import {CONTINUE, SKIP, visit} from "unist-util-visit"
import pack from "../package.json" with {type: "json"}

const console = new Console(pack.name, process.stdout, process.stderr)
const model = new languagedetection.ModelOperations()
const eslint = new ESLint({fix: true})

export interface FirstIterationChunk {
  key: number
  value: Doclet
}

export class FirstIteration extends AsyncTransform {
  c: Cache
  i: number

  constructor(c: Cache) {
    super({objectMode: true})
    this.c = c
    this.i = -1
  }

  async _atransform(ch: FirstIterationChunk): Promise<undefined> {
    const m = JSON.stringify({key: ch.key, longname: ch.value.longname})
    console.log(`Start processing '${m}' at first iteration`)

    const [a, ...errs] = await declaration(ch.value)

    for (const e of errs) {
      console.error(e)
    }

    for (const d of a) {
      this.record(d)
      this.overload(d)
      this.index(d)
      this.push(d)
    }

    console.log(`Finish processing '${m}' at first iteration`)
  }

  record(d: Library.Declaration): void {
    const b = this.c.next

    if (d.kind === "class") {
      if (d.extends) {
        for (const e of d.extends) {
          let r = b.records[e.id]
          if (!r) {
            r = cacheRecord()
            b.records[e.id] = r
          }

          r.extendsBy.add(d.id)
        }
      }

      return
    }

    if (d.kind === "event") {
      if (!d.parent) {
        throw new Error("Event has no parent")
      }

      let r = b.records[d.parent.id]
      if (!r) {
        r = cacheRecord()
        b.records[d.parent.id] = r
      }

      r.events.add(d.id)

      return
    }

    if (d.kind === "method") {
      if (!d.parent) {
        throw new Error("Method has no parent")
      }

      let mp = b.records[d.parent.id]
      if (!mp) {
        mp = cacheRecord()
        b.records[d.parent.id] = mp
      }

      mp.methods.add(d.id)
    }
  }

  overload(d: Library.Declaration): void {
    const b = this.c.next

    const u0 = d.id
    const d1 = d
    const u1 = ui(u0)

    if (u1 !== u0) {
      const r0 = library.reference(u0)
      const r1 = library.reference(u1)

      const i0 = b.indexes[u0]
      if (i0 === undefined) {
        throw new Error(`Declaration '${u0}' has no index`)
      }

      const d0 = b.declarations[i0]
      if (!d0) {
        throw new Error(`Index '${i0}' has no declaration`)
      }

      let a0 = d0.overloads
      if (!a0) {
        a0 = []
        d0.overloads = a0
      }

      let a1 = d1.overloadsBy
      if (!a1) {
        a1 = []
        d1.overloadsBy = a1
      }

      for (const r of a0) {
        const i = b.indexes[r.id]
        if (i === undefined) {
          throw new Error(`Declaration '${r.id}' has no index`)
        }

        const d = b.declarations[i]
        if (!d) {
          throw new Error(`Index '${i}' has no declaration`)
        }

        let a = d.overloadsBy
        if (!a) {
          a = []
          d.overloadsBy = a
        }

        a.push(r1)
        a1.push(r)
      }

      a0.push(r1)
      a1.push(r0)
    }

    d1.id = u1

    function ui(u: string): string {
      let n = u
      let i = 0
      while (b.indexes[n] !== undefined) {
        i += 1
        n = `${u}-${i}`
      }
      return n
    }
  }

  index(d: Library.Declaration): void {
    this.i += 1
    this.c.next.indexes[d.id] = this.i
  }
}

export class SecondIteration extends AsyncTransform {
  c: Cache
  i: number

  constructor(c: Cache) {
    super({objectMode: true})
    this.c = c
    this.i = -1
  }

  // todo: replace AsyncTransform with Transform
  // eslint-disable-next-line @typescript-eslint/require-await
  async _atransform(d: Library.Declaration): Promise<undefined> {
    const m = JSON.stringify({id: d.id})
    console.log(`Start processing '${m}' at second iteration`)

    this.populate(d)
    this.index(d)
    this.push(d)

    console.log(`Finish processing '${m}' at second iteration`)
  }

  populate(d: Library.Declaration): void {
    const b = this.c.current

    const r = b.records[d.id]
    if (!r) {
      return
    }

    if (d.kind === "class") {
      if (r.events.size !== 0) {
        let a = d.events
        if (!a) {
          a = []
          d.events = a
        }

        for (const e of r.events) {
          const r = library.reference(e)
          a.push(r)
        }
      }

      if (r.extendsBy.size !== 0) {
        let a = d.extendsBy
        if (!a) {
          a = []
          d.extendsBy = a
        }

        for (const e of r.extendsBy) {
          const r = library.reference(e)
          a.push(r)
        }
      }

      if (r.methods.size !== 0) {
        let a = d.instanceMethods
        if (!a) {
          a = []
          d.instanceMethods = a
        }

        for (const e of r.methods) {
          const r = library.reference(e)
          a.push(r)
        }
      }
    }
  }

  index(d: Library.Declaration): void {
    this.i += 1
    this.c.next.indexes[d.id] = this.i
  }
}

export class ThirdIteration extends AsyncTransform {
  c: Cache
  i: number

  constructor(c: Cache) {
    super({objectMode: true})
    this.c = c
    this.i = -1
  }

  // todo: replace AsyncTransform with Transform
  // eslint-disable-next-line @typescript-eslint/require-await
  async _atransform(d: Library.Declaration): Promise<undefined> {
    const m = JSON.stringify({id: d.id})
    console.log(`Start processing '${m}' at third iteration`)

    signature.computeDeclaration(d, this.link.bind(this))
    this.index(d)
    this.push(d)

    console.log(`Finish processing '${m}' at third iteration`)
  }

  link(s: Signature.Signature): void {
    const b = this.c.current
    for (const t of s) {
      if (
        t instanceof Signature.Reference &&
        !(t.token instanceof Signature.NoopToken)
      ) {
        const i = b.indexes[t.id]
        if (i === undefined) {
          t.token.text = t.id
          continue
        }

        const d = b.declarations[i]
        if (!d) {
          t.token.text = t.id
          continue
        }

        t.token.text = d.identifier
      }
    }
  }

  index(d: Library.Declaration): void {
    this.i += 1
    this.c.next.indexes[d.id] = this.i
  }
}

export class Cache {
  buffers: CacheBuffer[]

  get next(): CacheBuffer {
    return this.buffers[0]
  }

  get current(): CacheBuffer {
    return this.buffers[1]
  }

  constructor() {
    this.buffers = []
  }

  setup(): void {
    this.buffers = [cacheBuffer(), cacheBuffer()]
  }

  step(): void {
    this.buffers.pop()
    this.buffers.unshift(cacheBuffer())
  }

  toWritable(): Writable {
    const b = this.next
    return new Writable({
      objectMode: true,
      write(ch, _, cb) {
        b.declarations.push(ch)
        cb()
      },
    })
  }

  toReadable(): Readable {
    const b = this.current
    return Readable.from(b.declarations)
  }
}

export interface CacheBuffer {
  declarations: Partial<Library.Declaration[]>
  indexes: Partial<Record<string, number>>
  records: Partial<Record<string, CacheRecord>>
}

function cacheBuffer(): CacheBuffer {
  return {
    declarations: [],
    indexes: {},
    records: {},
  }
}

export interface CacheRecord {
  events: Set<string>
  extendsBy: Set<string>
  methods: Set<string>
}

function cacheRecord(): CacheRecord {
  return {
    events: new Set(),
    extendsBy: new Set(),
    methods: new Set(),
  }
}

async function declaration(dc: Doclet): Promise<[Library.Declaration[], ...Error[]]> {
  switch (dc.kind) {
  case "class":
    return await classDeclaration(dc)
  case "constant":
    return [[], new Error("Constant is not supported")]
  case "event":
    return await eventDeclaration(dc)
  case "external":
    return [[], new Error("External is not supported")]
  case "file":
    return [[], new Error("File is not supported")]
  case "function":
    return await functionDeclaration(dc)
  case "interface":
    return [[], new Error("Interface is not supported")]
  case "member":
    return [[], new Error("Member is not supported")]
  case "mixin":
    return [[], new Error("Mixin is not supported")]
  case "module":
    return [[], new Error("Module is not supported")]
  case "namespace":
    return [[], new Error("Namespace is not supported")]
  case "package":
    return [[], new Error("Package is not supported")]
  case "param":
    return [[], new Error("Param is not supported")]
  case "typedef":
    return await typeDeclaration(dc)
  case undefined:
    return [[], new Error("Doclet has no kind")]
  default:
    return [[], new Error(`Unknown kind: ${dc.kind}`)]
  }
}

async function classDeclaration(dc: Doclet): Promise<[[Library.ClassDeclaration, ...Library.Declaration[]], ...Error[]]> {
  const pa: Library.Declaration[] = []

  const [d, ...errs0] = await declarationNode(dc)
  const cl = library.classDeclaration(d)

  if (dc.augments && dc.augments.length !== 0) {
    let ex = cl.extends
    if (!ex) {
      ex = []
      cl.extends = ex
    }

    for (const a of dc.augments) {
      const r = library.reference(a)
      ex.push(r)
    }
  }

  if (dc.properties && dc.properties.length !== 0) {
    let pr = cl.instanceProperties
    if (!pr) {
      pr = []
      cl.instanceProperties = pr
    }

    for (const dp of dc.properties) {
      const [p] = await propertyDeclaration(cl, dp)
      pa.push(p)

      const r = library.reference(p.id)
      pr.push(r)
    }
  }

  // We must extract the constructor data from the class declaration because
  // JSDoc does not separate them. However, the architecture of some libraries
  // does not involve constructors as such; for example, the Office API (also
  // known as Document Builder API). The Office API is the only source that uses
  // our internal JSDoc parser, so instead of adding a new option to disable
  // extracting constructors, which may involve many changes to the parser and
  // its structures, it is easier to temporarily disable this functionality
  // completely. In the future, when new providers arrive that have to use this
  // parser, we must return this functionality with a new option.

  // const [cd, ...errs1] = await constructorDeclaration(cl, dc)
  // pa.push(cd)

  // let cs = cl.constructors
  // if (!cs) {
  //   cs = []
  //   cl.constructors = cs
  // }

  // const r = library.reference(cd.id)
  // cs.push(r)

  // return [[cl, ...pa], ...errs0, ...errs1]

  return [[cl, ...pa], ...errs0]
}

// async function constructorDeclaration(dn: Library.DeclarationNode, dc: Doclet): Promise<[Library.ConstructorDeclaration, ...Error[]]> {
//   dc = {...dc, memberof: dn.id, name: "constructor"}
//   const [[f], ...errs0] = await functionDeclarationUnits(dc)
//   const [d, ...errs1] = await declarationNode(dc)
//   const c = library.constructDeclaration(f, d)

//   if (dc.params && dc.params.length !== 0) {
//     c.type.parameters = dc.params.map((p) => {
//       const [v, ...e] = value(p)
//       errs1.push(...e)
//       return v
//     })
//   }

//   return [c, ...errs0, ...errs1]
// }

async function propertyDeclaration(dn: Library.DeclarationNode, dp: DocletParam): Promise<[Library.PropertyDeclaration, ...Error[]]> {
  const [v, ...errs0] = value(dp)
  const [d, ...errs1] = await declarationNode({...dp, memberof: dn.id})

  if ("id" in v) {
    v.id = d.id
  }

  if (d.description) {
    v.description = serializeString(d.description)
  }

  return [library.propertyDeclaration(v, d), ...errs0, ...errs1]
}

async function eventDeclaration(dc: Doclet): Promise<[[Library.EventDeclaration], ...Error[]]> {
  const [[f, d], ...errs] = await functionDeclarationUnits(dc)
  return [[library.eventDeclaration(f, d)], ...errs]
}

async function functionDeclaration(dc: Doclet): Promise<[[Library.MethodDeclaration | Library.TypeDeclaration], ...Error[]]> {
  const [[f, d], ...errs] = await functionDeclarationUnits(dc)
  if (!d.parent) {
    return [[library.typeDeclaration(f, d)], ...errs]
  }
  return [[library.methodDeclaration(f, d)], ...errs]
}

async function functionDeclarationUnits(dc: Doclet): Promise<[[Library.FunctionType, Library.DeclarationNode], ...Error[]]> {
  const t = library.typeNode()
  const f = library.functionType(t)
  const [d, ...errs] = await declarationNode(dc)

  if (dc.params && dc.params.length !== 0) {
    f.parameters = dc.params.map((p) => {
      const [v, ...e] = value(p)
      errs.push(...e)
      return v
    })
  }

  if (dc.returns && dc.returns.length !== 0) {
    // JSDoc allows multiple @returns, in practice, the first one is used only.
    const [r] = dc.returns

    const [t, ...e] = voidableType(r)
    errs.push(...e)

    const fr = library.functionReturns(t)
    if (r.description) {
      let s = omitSingleListItem(r.description)
      s = serializeString(s)
      fr.description = s
    }

    f.returns = fr
  }

  return [[f, d], ...errs]
}

async function typeDeclaration(dc: Doclet): Promise<[[Library.TypeDeclaration], ...Error[]]> {
  const [t, ...errs0] = anyableType(dc)

  if (
    !("id" in t) &&
    t.type === "object" &&
    dc.properties &&
    dc.properties.length !== 0
  ) {
    t.properties = dc.properties.map((p) => {
      const [v, ...e] = value(p)
      errs0.push(...e)
      return v
    })
  }

  const [d, ...errs1] = await declarationNode(dc)
  const td = library.typeDeclaration(t, d)

  return [[td], ...errs0, ...errs1]
}

async function declarationNode(dc: Doclet): Promise<[Library.DeclarationNode, ...Error[]]> {
  const errs: Error[] = []
  const d = library.declarationNode()

  if (!dc.name) {
    errs.push(new Error("Doclet has no name"))
  } else {
    d.id = dc.name
    d.title = dc.name
    d.identifier = dc.name
  }

  if (dc.memberof) {
    d.id = `${dc.memberof}#${d.id}`
    d.parent = library.reference(dc.memberof)
  }

  const [summary, description] = resolveAbstract(dc)

  if (summary) {
    const s = library.summary()
    s.text = summary
    d.summary = s
  }

  if (description) {
    d.description = description
  }

  // todo: it is a temporary solution.
  if (d.description) {
    // todo: my bad, capitalize the title in the document builder declarations too.
    const s = selectSection("Try it", d.description)
    if (s !== "") {
      // do not do it, create a new utility function.
      d.description = d.description.replace("## Try it", "").replace(s, "")
      d.tryIt = s
    }
  }

  if (dc.examples && dc.examples.length !== 0) {
    d.examples = await Promise.all(dc.examples.map(example))
  }

  return [d, ...errs]
}

function value(dp: DocletParam): [Library.Value, ...Error[]] {
  const [t, ...errs] = anyableType(dp)
  const v = library.value(t)

  if (!dp.name) {
    errs.push(new Error("DocletParam has no name"))
  } else {
    v.identifier = dp.name
  }

  if (dp.description) {
    v.description = dp.description
  }

  if ("defaultvalue" in dp) {
    const [t, ...e] = literalType(dp.defaultvalue)
    errs.push(...e)
    v.default = t
  }

  return [v, ...errs]
}

function anyableType(d: Doclet | DocletParam): [Library.Type, ...Error[]] {
  if (!d.type || !d.type.parsedType) {
    return anyType()
  }
  return type(d.type.parsedType)
}

function anyType(): [Library.AnyType, ...Error[]] {
  const t = library.typeNode()
  return [library.anyType(t)]
}

function voidableType(d: Doclet | DocletParam): [Library.Type, ...Error[]] {
  if (!d.type || !d.type.parsedType) {
    return voidType()
  }
  return type(d.type.parsedType)
}

function voidType(): [Library.VoidType, ...Error[]] {
  const t = library.typeNode()
  return [library.voidType(t)]
}

function literalType(value: Library.LiteralType["value"]): [Library.LiteralType, ...Error[]] {
  const t = library.typeNode()
  return [library.literalType(t, value)]
}

function type(ca: Catharsis): [Library.Type, ...Error[]] {
  if (ca.type === "AllLiteral") {
    return anyType()
  }

  if (ca.type === "FieldType") {
    const [t, ...errs] = anyType()
    return [t, ...errs, new Error("FieldType is not supported")]
  }

  if (ca.type === "FunctionType") {
    // https://github.com/jsdoc/jsdoc/issues/1955/
    const t = library.typeNode()
    return [library.functionType(t)]
  }

  if (ca.type === "NameExpression") {
    if (!ca.name) {
      const [t, ...errs] = anyType()
      return [t, ...errs, new Error("NameExpression has no name")]
    }

    const t = library.typeNode()

    switch (ca.name) {
    case "Array":
    case "array":
      return [library.arrayType(t)]
    case "Boolean":
    case "boolean":
      return [library.passthroughType(t, ca.name)]
    case "Number":
    case "number":
      return [library.passthroughType(t, ca.name)]
    case "Object":
    case "object":
      return [library.objectType(t)]
    case "String":
    case "string":
      return [library.passthroughType(t, ca.name)]
    }

    if (isNumberLiteral(ca.name)) {
      const v = Number(ca.name)
      return [library.literalType(t, v)]
    }

    if (isStringLiteral(ca.name)) {
      const v = omitStringQuotes(ca.name)
      return [library.literalType(t, v)]
    }

    return [library.reference(ca.name)]
  }

  if (ca.type === "NullLiteral") {
    const t = library.typeNode()
    return [library.literalType(t, null)]
  }

  if (ca.type === "RecordType") {
    const [t, ...errs] = anyType()
    return [t, ...errs, new Error("RecordType is not supported")]
  }

  if (ca.type === "TypeApplication") {
    if (!ca.expression) {
      const [t, ...errs] = anyType()
      return [t, ...errs, new Error("TypeApplication has no expression")]
    }

    const [e, ...errs] = type(ca.expression)

    if (!ca.applications) {
      return [e, ...errs, new Error("TypeApplication has no applications")]
    }

    if ("id" in e) {
      return [e, ...errs]
    }

    switch (e.type) {
    case "any":
      break

    case "array":
      e.items = ca.applications.map((c) => {
        const [t, ...e] = type(c)
        errs.push(...e)
        return t
      })
      break

    case "function":
    case "literal":
    case "object":
    case "passthrough":
    case "union":
    case "unknown":
    case "void":
      break

    default:
      // @ts-expect-error
      return [e, ...errs, new Error(`Unknown type: ${e.type}`)]
    }

    return [e, ...errs]
  }

  if (ca.type === "TypeUnion") {
    if (!ca.elements || ca.elements.length === 0) {
      const [t, ...errs] = anyType()
      return [t, ...errs, new Error("TypeUnion has no elements")]
    }

    const errs: Error[] = []

    const t = library.typeNode()
    const u = library.unionType(t)
    u.types = ca.elements.map((c) => {
      const [t, ...e] = type(c)
      errs.push(...e)
      return t
    })

    return [u, ...errs]
  }

  if (ca.type === "UndefinedLiteral") {
    const t = library.typeNode()
    return [library.literalType(t)]
  }

  if (ca.type === "UnknownLiteral") {
    const t = library.typeNode()
    return [library.unknownType(t)]
  }

  const [t, ...errs] = anyType()
  return [t, ...errs, new Error(`Unknown type: ${ca.type}`)]
}

async function example(c: string): Promise<Library.Example> {
  const e = code.example()
  e.syntax = "js"
  e.code = c
  const [m] = await model.runModel(c)
  switch (m.languageId) {
  case "js":
  case "json":
    await js(m.languageId)
    break
  }
  return e

  async function js(x: string): Promise<void> {
    const f = `embed.md/embed.${x}`
    const [r] = await eslint.lintText(c, {filePath: f})
    e.syntax = x
    if (r.output) {
      e.code = r.output
    }
  }
}

function resolveAbstract(dc: Doclet): [string, string] {
  const [s, d] = resolve()
  return [serializeString(s), serializeString(d)]

  function resolve(): [string, string] {
    if (dc.summary && dc.description) {
      return [dc.summary, dc.description]
    }

    if (dc.summary) {
      return [dc.summary, dc.summary]
    }

    if (dc.description) {
      let s = firstParagraph(dc.description)
      s = firstSentence(s)
      return [s, dc.description]
    }

    return ["", ""]
  }
}

function serializeString(s: string): string {
  return omitHTMLTags(s).trim()
}

function omitSingleListItem(s: string): string {
  const t = fromMarkdown(s)
  const r = selectAll("list:first-child listItem", t) as ListItem[]
  if (r.length === 1) {
    s = toMarkdown({type: "root", children: r[0].children})
  }
  return s
}

function omitHTMLTags(s: string): string {
  const t = fromMarkdown(s)

  visit(t, "html", (_, index, parent) => {
    if (!parent || index === undefined) {
      return CONTINUE
    }
    parent.children.splice(index, 1)
    return [SKIP, index]
  })

  return toMarkdown(t)
}

function isNumberLiteral(s: string): boolean {
  return !Number.isNaN(Number.parseFloat(s))
}

function omitStringQuotes(s: string): string {
  return s.slice(1, -1)
}
