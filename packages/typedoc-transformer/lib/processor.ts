import {AsyncTransform} from "@onlyoffice/async-transform"
import * as errors from "@onlyoffice/errors"
import * as L from "@onlyoffice/library-declaration/next.js"
import {eslint} from "@onlyoffice/mdast-util-eslint"
import {firstSentence} from "@onlyoffice/mdast-util-first-sentence"
import {type Result} from "@onlyoffice/result"
import {isStringLiteral} from "@onlyoffice/strings"
import {
  isAccessorReflection,
  isClassReflection,
  isContainerReflection,
  isDeclarationReflection,
  isMethodReflection,
  isProjectReflection,
  isPropertyReflection,
  isSignatureReflection,
} from "@onlyoffice/typedoc-util-is-reflection"
import {isReflectionType} from "@onlyoffice/typedoc-util-is-type"
import {fromMarkdown} from "mdast-util-from-markdown"
import {toMarkdown} from "mdast-util-to-markdown"
import remarkStripHtml from "remark-strip-html"
import {type JSONOutput as J} from "typedoc"
import {Console} from "./console.ts"
import {type NestedTrail} from "./trail.ts"

const console = Console.shared

export const groups: Record<string, number> = {
  // Parent groups
  "Namespaces": 0,
  "Modules": 1,
  "Classes": 2,
  "Interfaces": 3,
  "Type Aliases": 4,
  "Enumerations": 5,
  "Variables": 6,
  "Functions": 7,

  // Child groups
  "Constructors": 8,
  "Type Properties": 9,
  "Type Accessors": 10,
  "Type Methods": 11,
  "Instance Properties": 12,
  "Instance Accessors": 13,
  "Instance Methods": 14,
  "Properties": 15,
  "Accessors": 16,
  "Methods": 17,
  "Enumeration Members": 18,
}

export type Item = Entity | Fragment
export type Entity = Group | Declaration

export type R<T> = Promise<Result<T, Error>>
export type E = Error | undefined

export class Processor extends AsyncTransform {
  #v = new TrailContext()
  #r = new TrailContext()

  constructor() {
    super({objectMode: true})
  }

  async _atransform(o: J.Reflection): Promise<void> {
    await this.#process(o)
  }

  async #process(o: J.Reflection): Promise<void> {
    console.log(`Start processing ${o.name} #${o.id}`)

    if (isProjectReflection(o)) {
      this.#v.in()
      this.#v.push(0)

      const d = await this.#createDeclaration(o)
      this.push(d)
    }

    this.#v.in()
    this.#r.in()

    const gc = await this.#processGroups(o)
    await this.#processTargets(o, gc)

    this.#r.out()
    this.#v.out()

    if (isProjectReflection(o)) {
      this.#v.pop()
      this.#v.out()
    }

    console.log(`Finish processing ${o.name} #${o.id}`)
  }

  async #processGroups(o: J.Reflection): Promise<Group[]> {
    if (!isContainerReflection(o)) {
      return []
    }

    const c: Group[] = []

    let i = 0

    if (o.categories) {
      for (const r of o.categories) {
        const n = await this.#createGroup(r)

        // If an entity contains a custom category and has a child entity that
        // is not included in any category, the latter will be added to the
        // "Other" built-in category.
        if (n.name === "Other") {
          continue
        }

        if (n.sourceChildren.length !== 0) {
          const i = next()
          n.trail.virtual = this.#v.with(i)
          c.push(n)
        }
      }
    }

    const a: Group[] = []

    if (o.groups) {
      for (const r of o.groups) {
        const n = await this.#createGroup(r)

        // Skip these groups, as specific alternatives will be created manually.
        if (
          n.name === "Properties" ||
          n.name === "Accessors" ||
          n.name === "Methods"
        ) {
          continue
        }

        if (n.sourceChildren.length !== 0) {
          const i = next()
          n.trail.virtual = this.#v.with(i)
          a.push(n)
        }
      }
    }

    const tp = new Group()
    tp.name = "Type Properties"

    const ta = new Group()
    ta.name = "Type Accessors"

    const tm = new Group()
    tm.name = "Type Methods"

    const ip = new Group()
    ip.name = "Instance Properties"

    const ia = new Group()
    ia.name = "Instance Accessors"

    const im = new Group()
    im.name = "Instance Methods"

    if (!isClassReflection(o)) {
      ip.name = "Properties"
      ia.name = "Accessors"
      im.name = "Methods"
    }

    if (o.children) {
      for (const r of o.children) {
        if (isPropertyReflection(r)) {
          if (r.flags.isStatic) {
            tp.sourceChildren.push(r.id)
          } else {
            ip.sourceChildren.push(r.id)
          }
          continue
        }

        if (isAccessorReflection(r)) {
          if (r.flags.isStatic) {
            ta.sourceChildren.push(r.id)
          } else {
            ia.sourceChildren.push(r.id)
          }
        }

        if (isMethodReflection(r)) {
          if (r.flags.isStatic) {
            tm.sourceChildren.push(r.id)
          } else {
            im.sourceChildren.push(r.id)
          }
          continue
        }
      }
    }

    if (tp.sourceChildren.length !== 0) {
      const i = next()
      tp.trail.virtual = this.#v.with(i)
      a.push(tp)
    }

    if (ta.sourceChildren.length !== 0) {
      const i = next()
      ta.trail.virtual = this.#v.with(i)
      a.push(ta)
    }

    if (tm.sourceChildren.length !== 0) {
      const i = next()
      tm.trail.virtual = this.#v.with(i)
      a.push(tm)
    }

    if (ip.sourceChildren.length !== 0) {
      const i = next()
      ip.trail.virtual = this.#v.with(i)
      a.push(ip)
    }

    if (ia.sourceChildren.length !== 0) {
      const i = next()
      ia.trail.virtual = this.#v.with(i)
      a.push(ia)
    }

    if (im.sourceChildren.length !== 0) {
      const i = next()
      im.trail.virtual = this.#v.with(i)
      a.push(im)
    }

    const b: Group[] = []

    for (const x of a) {
      for (const y of c) {
        for (const c of y.sourceChildren) {
          const i = x.sourceChildren.indexOf(c)
          if (i !== -1) {
            x.sourceChildren.splice(i, 1)
          }
        }
      }

      if (x.sourceChildren.length !== 0) {
        b.push(x)
      }
    }

    for (const x of b) {
      let f = false

      for (let i = 0; i < c.length; i += 1) {
        const y = c[i]

        const a = groups[x.name]
        const b = groups[y.name]

        if (a < b) {
          f = true
          c.splice(i, 0, x)
          break
        }
      }

      if (!f) {
        c.push(x)
      }
    }

    for (const g of c) {
      this.push(g)
    }

    return c

    function next(): number {
      const j = i
      i += 1
      return j
    }
  }

  async #processTargets(o: J.Reflection, gc: Group[]): Promise<void> {
    if (isSignatureReflection(o) && o.parameters) {
      for (const [i, r] of o.parameters.entries()) {
        for (const [i, g] of gc.entries()) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.push(i)
            this.#v.in()
            break
          }
        }

        this.#v.push(i)
        this.#r.push(i)

        const f = await this.#createFragment(r)
        this.push(f)

        await this.#process(r)

        this.#r.pop()
        this.#v.pop()

        for (const g of gc) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.out()
            this.#v.pop()
            break
          }
        }
      }
    }

    if (isDeclarationReflection(o) && isReflectionType(o.type)) {
      this.#v.push(0)
      this.#r.push(0)

      const d = await this.#createDeclaration(o.type.declaration)
      if (d.isProbablyReflection) {
        d.beSureReflection()
      }

      this.push(d)

      await this.#process(o.type.declaration)

      this.#r.pop()
      this.#v.pop()
    }

    if (isDeclarationReflection(o) && o.signatures) {
      for (const [i, r] of o.signatures.entries()) {
        for (const [i, g] of gc.entries()) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.push(i)
            this.#v.in()
            break
          }
        }

        this.#v.push(i)
        this.#r.push(i)

        const d = await this.#createDeclaration(r)
        if (d.isProbablyReflection) {
          d.beSureReflection()
        }

        this.push(d)

        await this.#process(r)

        this.#r.pop()
        this.#v.pop()

        for (const g of gc) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.out()
            this.#v.pop()
            break
          }
        }
      }
    }

    if (isContainerReflection(o) && o.children) {
      for (const [i, r] of o.children.entries()) {
        for (const [i, g] of gc.entries()) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.push(i)
            this.#v.in()
            break
          }
        }

        this.#v.push(i)
        this.#r.push(i)

        const d = await this.#createDeclaration(r)
        this.push(d)

        await this.#process(r)

        this.#r.pop()
        this.#v.pop()

        for (const g of gc) {
          if (g.sourceChildren.includes(r.id)) {
            this.#v.out()
            this.#v.pop()
            break
          }
        }
      }
    }
  }

  async #createGroup(o: J.ReflectionGroup): Promise<Group> {
    const [g, err] = await Group.from(o)
    console.log(`Group ${g.toDescription()} created`)

    for (const e of errors.split(err)) {
      console.error(`Group created with an error: ${e}`)
    }

    return g
  }

  async #createDeclaration(o: J.Reflection): Promise<Declaration> {
    const [d, err] = await Declaration.from(o)
    console.log(`Declaration ${d.toDescription()} created`)

    for (const e of errors.split(err)) {
      console.error(`Declaration created with an error: ${e}`)
    }

    d.trail.virtual = this.#v.trail
    d.trail.real = this.#r.trail

    return d
  }

  async #createFragment(o: J.ParameterReflection): Promise<Fragment> {
    const [f, err] = await Fragment.from(o)
    console.log(`Fragment ${f.toDescription()} created`)

    for (const e of errors.split(err)) {
      console.error(`Fragment created with an error: ${e}`)
    }

    f.trail.virtual = this.#v.trail
    f.trail.real = this.#r.trail

    return f
  }
}

export class TrailContext {
  #c: NestedTrail
  #r: NestedTrail

  get trail(): NestedTrail {
    if (this.#r.length === 0) {
      return []
    }

    const [t] = this.#r

    if (!Array.isArray(t)) {
      throw new Error("The method 'in' has not been called")
    }

    return structuredClone(t)
  }

  constructor() {
    this.#r = []
    this.#c = this.#r
  }

  in(): void {
    let p = this.#r

    while (true) {
      if (p.length === 0) {
        break
      }

      const u = p[p.length - 1]

      if (!Array.isArray(u)) {
        break
      }

      p = u
    }

    this.#c = []
    p.push(this.#c)
  }

  out(): void {
    let p = this.#r

    while (true) {
      if (p.length === 0) {
        break
      }

      const u = p[p.length - 1]

      if (!Array.isArray(u)) {
        break
      }

      if (u === this.#c) {
        break
      }

      p = u
    }

    p.pop()
    this.#c = p
  }

  with(i: number): NestedTrail {
    this.push(i)
    const t = this.trail
    this.pop()
    return t
  }

  push(i: number): void {
    this.#c.push(i)
  }

  pop(): void {
    this.#c.pop()
  }
}

export class TrailDuplex {
  virtual: NestedTrail = []
  real: NestedTrail = []
}

export class Group {
  id = -1
  name = ""
  trail = new TrailDuplex()
  narrative = new Narrative()
  parentId = -1
  children: number[] = []
  sourceChildren: number[] = []

  static async from(o: J.ReflectionGroup | J.ReflectionCategory): R<Group> {
    let err: E
    const g = new Group()

    g.name = o.title

    if (o.description) {
      const [n, ne] = await Narrative.from(o.description)
      err = errors.join(ne)
      g.narrative = n
    }

    if (o.children) {
      for (const c of o.children) {
        g.sourceChildren.push(c)
      }
    }

    return [g, err]
  }

  to(): L.GroupEntity {
    const g = new L.Group()
    g.name = this.name
    g.description = this.narrative.description

    const e = new L.GroupEntity()
    e.id = this.id
    e.parentId = this.parentId

    for (const c of this.children) {
      e.children.push(c)
    }

    e.group = g

    return e
  }

  toDescription(): string {
    return JSON.stringify({
      type: this.constructor.name.toLowerCase(),
      id: this.id,
      name: this.name,
      parentId: this.parentId,
      children: this.children,
    })
  }
}

export class Declaration {
  id = -1
  sourceId = -1
  name = ""
  trail = new TrailDuplex()
  narrative = new Narrative()
  parameters: Fragment[] = []
  parentId = -1
  children: number[] = []
  sourceChildren: number[] = []

  static async from(o: J.Reflection): R<Declaration> {
    let err: E
    const d = new Declaration()

    d.sourceId = o.id
    d.name = o.name

    // if (isProjectReflection(o) && o.readme) {
    //   const [n, ne] = await Narrative.from(o.readme)
    //   err = errors.join(ne)
    //   d.narrative = n
    // }

    if (o.comment) {
      const [n, ne] = await Narrative.from(o.comment)
      err = errors.join(ne)
      d.narrative = n
    }

    if (isSignatureReflection(o) && o.parameters) {
      for (const r of o.parameters) {
        d.sourceChildren.push(r.id)
      }
    }

    if (isDeclarationReflection(o) && isReflectionType(o.type)) {
      d.sourceChildren.push(o.type.declaration.id)
    }

    if (isDeclarationReflection(o) && o.signatures) {
      for (const r of o.signatures) {
        d.sourceChildren.push(r.id)
      }
    }

    if (isContainerReflection(o) && o.children) {
      for (const r of o.children) {
        d.sourceChildren.push(r.id)
      }
    }

    return [d, err]
  }

  get isProbablyReflection(): boolean {
    return this.name === "__type"
  }

  get isSureReflection(): boolean {
    return this.name === "TYPEDOC REFLECTION"
  }

  beSureReflection(): void {
    this.name = "TYPEDOC REFLECTION"
  }

  to(): L.DeclarationEntity {
    const d = new L.Declaration()
    d.name = this.name
    d.summary = this.narrative.summary
    d.description = this.narrative.description

    for (const f of this.parameters) {
      const t = f.to()
      d.parameters.push(t)
    }

    d.returns.description = this.narrative.returns
    d.examples = this.narrative.examples

    const e = new L.DeclarationEntity()
    e.id = this.id
    e.parentId = this.parentId

    for (const c of this.children) {
      e.children.push(c)
    }

    e.declaration = d

    return e
  }

  toDescription(): string {
    return JSON.stringify({
      type: this.constructor.name.toLowerCase(),
      id: this.id,
      sourceId: this.sourceId,
      name: this.name,
      parentId: this.parentId,
      children: this.children,
    })
  }
}

export class Fragment {
  sourceId = -1
  name = ""
  trail = new TrailDuplex()
  optional = false
  default = ""
  narrative = new Narrative()

  static async from(o: J.ParameterReflection): R<Fragment> {
    let err: E
    const f = new Fragment()

    f.sourceId = o.id
    f.name = o.name

    if (o.comment) {
      const [n, ne] = await Narrative.from(o.comment)
      err = errors.join(ne)
      f.narrative = n
    }

    if (o.flags.isOptional) {
      f.optional = true
    }

    if (o.defaultValue !== undefined) {
      if (isStringLiteral(o.defaultValue)) {
        f.default = o.defaultValue.slice(1, -1)
      } else {
        f.default = o.defaultValue
      }
    }

    return [f, err]
  }

  to(): L.Fragment {
    const f = new L.Fragment()
    f.name = this.name
    f.optional = this.optional
    f.default = this.default
    f.description = this.narrative.description
    return f
  }

  toDescription(): string {
    return JSON.stringify({
      type: this.constructor.name.toLowerCase(),
      sourceId: this.sourceId,
      name: this.name,
    })
  }
}

export class Narrative {
  summary = ""
  description = ""
  examples = ""
  returns = ""

  static async from(o: J.Comment | J.CommentDisplayPart[]): R<Narrative> {
    if (!Array.isArray(o)) {
      return await this.fromComment(o)
    }
    return await this.fromCommentDisplayParts(o)
  }

  static async fromComment(o: J.Comment): R<Narrative> {
    let err: E
    const n = new Narrative()

    const h = appendContent("", o.summary)

    let s = ""
    let d = ""
    let e = ""
    let r = ""

    if (o.blockTags) {
      for (const t of o.blockTags) {
        if (t.tag === "@summary") {
          s = appendContent(s, t.content)
          continue
        }

        if (t.tag === "@remarks") {
          d = appendContent(d, t.content)
          continue
        }

        if (t.tag === "@example") {
          e = appendContent(e, t.content)
          continue
        }

        if (t.tag === "@returns") {
          r = appendContent(r, t.content)
          continue
        }

        const er = new Error(`The block tag '${t.tag}' is not supported`)
        err = errors.join(err, er)
      }
    }

    if (!h && !s && !d) {
      // do nothing
    } else if (h && !s && !d) {
      let t = fromMarkdown(h)
      t = firstSentence(t)
      s = toMarkdown(t)
      d = h
    } else if (!h && s && !d) {
      // do nothing
    } else if (!h && !s && d) {
      let t = fromMarkdown(d)
      t = firstSentence(t)
      s = toMarkdown(t)
    } else if (h && s && !d) {
      d = h
    } else if (!h && s && d) {
      // do nothing
    } else if (h && !s && d) {
      let t = fromMarkdown(h)
      t = firstSentence(t)
      s = toMarkdown(t)
      d = `${h}\n\n${d}`
    } else if (h && s && d) {
      d = `${h}\n\n${d}`
    }

    if (s) {
      s = await sanitizeMarkdown(s)
    }

    if (d) {
      d = await sanitizeMarkdown(d)
    }

    if (e) {
      e = await sanitizeMarkdown(e)
    }

    if (r) {
      r = await sanitizeMarkdown(r)
    }

    n.summary = s
    n.description = d
    n.examples = e
    n.returns = r

    return [n, err]
  }

  static async fromCommentDisplayParts(o: J.CommentDisplayPart[]): R<Narrative> {
    const n = new Narrative()

    let d = appendContent("", o)

    if (d) {
      d = await sanitizeMarkdown(d)
    }

    n.description = d

    return [n]
  }

  static merge(a: Narrative, b: Narrative): Narrative {
    const c = new Narrative()

    if (b.summary) {
      c.summary = b.summary
    } else if (a.summary) {
      c.summary = a.summary
    }

    if (b.description) {
      c.description = b.description
    } else if (a.description) {
      c.description = a.description
    }

    if (b.examples) {
      c.examples = b.examples
    } else if (a.examples) {
      c.examples = a.examples
    }

    if (b.returns) {
      c.returns = b.returns
    } else if (a.returns) {
      c.returns = a.returns
    }

    return c
  }

  get isEmpty(): boolean {
    return this.summary.length === 0 &&
      this.description.length === 0 &&
      this.examples.length === 0 &&
      this.returns.length === 0
  }
}

export function appendContent(c: string, ps: J.CommentDisplayPart[]): string {
  if (ps.length === 0) {
    return c
  }

  if (c.length !== 0) {
    c += "\n\n"
  }

  for (const p of ps) {
    c += p.text
  }

  return c
}

export async function sanitizeMarkdown(s: string): Promise<string> {
  const r = fromMarkdown(s)
  remarkStripHtml()(r)
  await eslint(r)

  let c = toMarkdown(r)
  if (c.endsWith("\n")) {
    c = c.slice(0, -1)
  }

  return c
}
