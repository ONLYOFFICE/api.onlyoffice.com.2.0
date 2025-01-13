import {Transform, type TransformCallback} from "node:stream"
import {
  isCallSignatureReflection,
  isConstructorReflection,
  isConstructorSignatureReflection,
  isFunctionReflection,
  isMethodReflection,
} from "@onlyoffice/typedoc-util-is-reflection"
import {type JSONOutput as J} from "typedoc"
import {Console} from "./console.ts"
import {
  Declaration,
  type Entity,
  Fragment,
  Group,
  type Item,
  Narrative,
} from "./processor.ts"
import {type FlatTrail, flatTrail, trailDepth} from "./trail.ts"

const console = Console.shared

export interface ShakerResolveCallback {
  (t: FlatTrail): J.Reflection | undefined
}

export interface ShakerRetrieveCallback {
  (id: number): Entity | undefined
}

export class Shaker extends Transform {
  #c: Item[]
  #r: Group
  #i: number

  onResolve: ShakerResolveCallback
  onRetrieve: ShakerRetrieveCallback

  constructor() {
    super({objectMode: true})

    this.#c = []
    this.#r = new Group()
    this.#c.push(this.#r)
    this.#i = 0

    // eslint-disable-next-line unicorn/no-useless-undefined
    this.onResolve = () => undefined
    // eslint-disable-next-line unicorn/no-useless-undefined
    this.onRetrieve = () => undefined
  }

  _transform(t: Item, _: BufferEncoding, cb: TransformCallback): void {
    this.#identify(t)
    this.#append(t)
    this.#c.push(t)
    this.#release(t)
    cb()
  }

  _flush(cb: TransformCallback): void {
    this.#finish()
    cb()
  }

  #identify(t: Item): void {
    console.log(`Start identifying ${t.toDescription()}`)

    if (t instanceof Group) {
      t.id = this.#next()
    } else if (t instanceof Declaration && this.#isContainer(t)) {
      console.log(`Ignore identifying ${t.toDescription()}`)
    } else if (t instanceof Declaration && t.isSureReflection) {
      console.log(`Ignore identifying ${t.toDescription()}`)
    } else if (t instanceof Declaration) {
      t.id = this.#next()
    } else if (t instanceof Fragment) {
      console.log(`Ignore identifying ${t.toDescription()}`)
    } else {
      throw new Error("Unknown item")
    }

    console.log(`Finish identifying ${t.toDescription()}`)
  }

  #append(t: Item): void {
    console.log(`Start appending ${t.toDescription()}`)

    if (t instanceof Group) {
      this.#appendGroup(t)
    } else if (t instanceof Declaration) {
      this.#appendDeclaration(t)
    } else if (t instanceof Fragment) {
      this.#appendFragment(t)
    } else {
      throw new Error("Unknown item")
    }

    console.log(`Finish appending ${t.toDescription()}`)
  }

  #appendGroup(t: Group): void {
    const cd = trailDepth(t.trail.virtual)

    while (true) {
      const p = this.#c[this.#c.length - 1]
      const pd = trailDepth(p.trail.virtual)

      if (cd < pd && !this.#isRoot(p)) {
        this.#c.pop()
        this.#remove(p)
        continue
      }

      break
    }
  }

  #appendDeclaration(t: Declaration): void {
    const cd = trailDepth(t.trail.virtual)

    while (true) {
      const p = this.#c[this.#c.length - 1]
      const pd = trailDepth(p.trail.virtual)

      if (cd <= pd && !this.#isRoot(p)) {
        this.#c.pop()
        this.#remove(p)
        continue
      }

      break
    }
  }

  #appendFragment(t: Fragment): void {
    const cd = trailDepth(t.trail.virtual)

    while (true) {
      const p = this.#c[this.#c.length - 1]
      const pd = trailDepth(p.trail.virtual)

      if (cd <= pd && !this.#isRoot(p)) {
        this.#c.pop()
        this.#remove(p)
        continue
      }

      break
    }
  }

  #remove(t: Item): void {
    console.log(`Start removing ${t.toDescription()}`)

    if (t instanceof Group) {
      this.#removeGroup(t)
    } else if (t instanceof Declaration && this.#isUnwanted(t)) {
      this.#removeUnwanted(t)
    } else if (t instanceof Declaration) {
      this.#removeDeclaration(t)
    } else if (t instanceof Fragment) {
      this.#removeFragment(t)
    } else {
      throw new Error("Unknown item")
    }

    console.log(`Finish removing ${t.toDescription()}`)
  }

  #removeGroup(t: Group): void {
    for (let i = this.#c.length - 1; i >= 0; i -= 1) {
      const p = this.#c[i]

      if (p instanceof Group) {
        continue
      }

      if (p instanceof Fragment) {
        throw new Error("Unexpected fragment")
      }

      t.parentId = p.id
      p.children.unshift(t.id)
      break
    }
  }

  #removeUnwanted(t: Declaration): void {
    for (let i = this.#c.length - 1; i >= 0; i -= 1) {
      const p = this.#c[i]

      if (p instanceof Fragment) {
        throw new Error("Unexpected fragment")
      }

      if (!p.sourceChildren.includes(t.sourceId)) {
        continue
      }

      for (const id of t.children) {
        const r = this.#entityOf(id)
        r.parentId = p.id
      }

      if (p instanceof Declaration) {
        p.parameters.push(...t.parameters)
      }

      p.children.push(...t.children)
      break
    }
  }

  #removeDeclaration(t: Declaration): void {
    const s = this.#reflectionOf(t)

    for (let i = this.#c.length - 1; i >= 0; i -= 1) {
      const p = this.#c[i]

      if (p instanceof Fragment) {
        throw new Error("Unexpected fragment")
      }

      if (!p.sourceChildren.includes(t.sourceId)) {
        continue
      }

      if (
        (
          isCallSignatureReflection(s) ||
          isConstructorSignatureReflection(s)
        ) &&
        !t.narrative.isEmpty &&
        p.narrative.isEmpty
      ) {
        p.narrative = Narrative.merge(p.narrative, t.narrative)
      }

      if (
        (
          isCallSignatureReflection(s) ||
          isConstructorSignatureReflection(s)
        ) &&
        t.narrative.isEmpty &&
        !p.narrative.isEmpty
      ) {
        t.narrative = Narrative.merge(t.narrative, p.narrative)
      }

      if (isConstructorSignatureReflection(s)) {
        t.name = "constructor"
      }

      t.parentId = p.id
      p.children.push(t.id)
      break
    }
  }

  #removeFragment(t: Fragment): void {
    for (let i = this.#c.length - 1; i >= 0; i -= 1) {
      const p = this.#c[i]

      if (p instanceof Group) {
        throw new Error("Unexpected group")
      }

      if (p instanceof Fragment) {
        throw new Error("Unexpected fragment")
      }

      if (!p.sourceChildren.includes(t.sourceId)) {
        continue
      }

      const s = this.#reflectionOf(p)

      if (
        isCallSignatureReflection(s) ||
        isConstructorSignatureReflection(s)
      ) {
        p.parameters.push(t)
        break
      }

      throw new Error("Unexpected item")
    }
  }

  #release(t: Item): void {
    console.log(`Start releasing ${t.toDescription()}`)

    if (t instanceof Group) {
      this.push(t)
    } else if (t instanceof Declaration && this.#isUnwanted(t)) {
      console.log(`Ignore releasing ${t.toDescription()}`)
    } else if (t instanceof Declaration) {
      this.push(t)
    } else if (t instanceof Fragment) {
      console.log(`Ignore releasing ${t.toDescription()}`)
    } else {
      throw new Error("Unknown item")
    }

    console.log(`Finish releasing ${t.toDescription()}`)
  }

  #finish(): void {
    while (true) {
      const p = this.#c[this.#c.length - 1]

      if (this.#isRoot(p)) {
        break
      }

      console.log(`Start finishing ${p.toDescription()}`)

      this.#c.pop()
      this.#remove(p)

      console.log(`Finish finishing ${p.toDescription()}`)
    }
  }

  #isContainer(t: Declaration): boolean {
    const s = this.#reflectionOf(t)

    return isFunctionReflection(s) ||
      isConstructorReflection(s) ||
      isMethodReflection(s)
  }

  #isUnwanted(t: Declaration): boolean {
    return t.id === -1
  }

  #isRoot(t: Item): boolean {
    return t === this.#r
  }

  #reflectionOf(t: Declaration): J.Reflection {
    const f = flatTrail(t.trail.real)

    const s = this.onResolve(f)

    if (!s) {
      throw new Error(`The trail '${t.trail.real}' could not be resolved`)
    }

    return s
  }

  #entityOf(id: number): Entity {
    const e = this.onRetrieve(id)

    if (!e) {
      throw new Error(`The entity '${id}' could not be retrieved`)
    }

    return e
  }

  #next(): number {
    const j = this.#i

    this.#i += 1

    return j
  }
}
