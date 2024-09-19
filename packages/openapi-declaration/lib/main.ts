import {Transform, type TransformCallback, Writable} from "node:stream"
import type * as Service from "@onlyoffice/service-declaration"
import {OpenAPIV3, type OpenAPIV3_1 as OpenApi} from "openapi-types"
import {Console} from "./console.ts"
import {
  AuthorizationComponent,
  type Cache,
  type Component,
  ComponentsCache,
  DeclarationsCache,
  GroupDeclaration,
  NoopComponent,
  OperationDeclaration,
  State,
  component,
  declaration,
} from "./internal.ts"

type OpenApiComponentsKey = keyof OpenApi.ComponentsObject
type ValueOf<T> = T[keyof T]

const {HttpMethods} = OpenAPIV3
const console = Console.shared

export interface ComponentChunk<K extends OpenApiComponentsKey> {
  key: string
  value: ValueOf<NonNullable<OpenApi.ComponentsObject[K]>>
}

export class ProcessComponent<K extends OpenApiComponentsKey> extends Transform {
  k: K

  constructor(k: K) {
    super({objectMode: true})
    this.k = k
  }

  _transform(ch: ComponentChunk<K>, _: BufferEncoding, cb: TransformCallback): void {
    const k = `#/components/${this.k}/${ch.key}`
    console.log(`Start processing '${k}'`)

    const [c, ...es] = component(this.k, ch.value)
    if (es.length !== 0) {
      for (const e of es) {
        console.error(e.message)
      }
    }

    if (!(c instanceof NoopComponent)) {
      if (c instanceof AuthorizationComponent) {
        c.id = ch.key
      } else {
        c.id = k
      }
      this.push(c)
    }

    console.log(`Finish processing '${k}'`)
    cb()
  }
}

export interface PathChunk {
  key: string
  value: OpenApi.PathItemObject
}

export class ProcessPath extends Transform {
  t: Transfer

  constructor(t: Transfer) {
    super({objectMode: true})
    this.t = t
  }

  _transform(ch: PathChunk, _: BufferEncoding, cb: TransformCallback): void {
    console.log(`Start processing '${ch.key}'`)

    for (const m of Object.values(HttpMethods)) {
      const s = ch.value[m]
      if (!s) {
        continue
      }

      const n = `${m} ${ch.key}`
      console.log(`Start processing '${n}'`)

      const [ds, ...es] = declaration(s)
      if (es.length !== 0) {
        for (const e of es) {
          console.error(e.message)
        }
      }

      for (let d of ds) {
        // The name property is mandatory for the future slug of the site page,
        // so we have to remove declarations that do not include it.
        if (!d.name) {
          continue
        }

        if (d instanceof OperationDeclaration) {
          const t = d.id
          const s = new State()

          d.request.method = m.toUpperCase()
          d.request.path = ch.key
          d = d.resolve(this.t.components.cache, s)
          d = d.normalize()

          for (const g of ds) {
            if (g instanceof GroupDeclaration) {
              const i = g.children.indexOf(t)
              if (i !== -1) {
                g.children[i] = d.id
              }
            }
          }
        }

        const s = d.toService()
        this.push(s)
      }

      console.log(`Finish processing '${n}'`)
    }

    console.log(`Finish processing '${ch.key}'`)
    cb()
  }
}

export class Transfer {
  components: TransferContainer<Component>
  declarations: TransferContainer<Service.Declaration>

  constructor() {
    const c = new ComponentsCache()
    this.components = new TransferContainer(c)

    const d = new DeclarationsCache()
    this.declarations = new TransferContainer(d)
  }
}

export class TransferContainer<T> {
  cache: Cache<T>

  constructor(c: Cache<T>) {
    this.cache = c
  }

  toWritable(): Writable {
    const b = this.cache
    return new Writable({
      objectMode: true,
      write(ch, _, cb) {
        b.add(ch)
        cb()
      },
    })
  }
}
