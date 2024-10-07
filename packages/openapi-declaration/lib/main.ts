import {Transform, type TransformCallback, Writable} from "node:stream"
import * as Service from "@onlyoffice/service-declaration"
import {ExampleGenerator} from "@onlyoffice/service-declaration/example.ts"
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
  TagsCache,
  component,
  declaration,
} from "./internal.ts"

type OpenApiComponentsKey = keyof OpenApi.ComponentsObject
type ValueOf<T> = T[keyof T]

const {HttpMethods} = OpenAPIV3
const console = Console.shared

export interface TagChunk {
  key: number
  value: OpenApi.TagObject
}

export class ProcessTag extends Transform {
  constructor() {
    super({objectMode: true})
  }

  _transform(ch: TagChunk, _: BufferEncoding, cb: TransformCallback): void {
    console.log(`Start processing '${ch.value.name}' tag (${ch.key})`)
    this.push(ch.value)
    console.log(`Finish processing '${ch.value.name}' tag (${ch.key})`)
    cb()
  }
}

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

        if (d instanceof GroupDeclaration) {
          // All resolve methods of internal structures create a copy of their
          // holders. However, we cannot create a new copy of a group
          // declaration here because its ID is used in the transfer cache for
          // the other declarations. Changing the behavior of the resolve method
          // is probably not a good idea because it breaks the consistency with
          // other methods that serve the same purpose. Holding an ID here is
          // probably the best solution at the moment, despite it looking
          // unattractive.
          const g = d.resolve(this.t.tags.cache)
          g.id = d.id
          d = g
        } else if (d instanceof OperationDeclaration) {
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

        if (s instanceof Service.OperationDeclaration) {
          const g = new ExampleGenerator(s.request)
          s.request.examples = g.all()
        }

        this.push(s)
      }

      console.log(`Finish processing '${n}'`)
    }

    console.log(`Finish processing '${ch.key}'`)
    cb()
  }
}

export class Transfer {
  tags: TransferContainer<OpenApi.TagObject>
  components: TransferContainer<Component>
  declarations: TransferContainer<Service.Declaration>

  constructor() {
    const t = new TagsCache()
    this.tags = new TransferContainer(t)

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
