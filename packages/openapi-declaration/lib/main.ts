import {createHash} from "node:crypto"
import process from "node:process"
import type {TransformCallback} from "node:stream"
import {Transform} from "node:stream"
import {Console} from "@onlyoffice/console"
import * as example from "@onlyoffice/service-declaration/example.ts"
import type * as REST from "@onlyoffice/service-declaration"
import * as service from "@onlyoffice/service-declaration"
import slugify from "@sindresorhus/slugify"
import type {OpenAPIV3_1 as OpenAPI} from "openapi-types"
import pack from "../package.json" with {type: "json"}

const console = new Console(pack.name, process.stdout, process.stderr)

// todo: calc a chance of collision.
function hash(s: string): string {
  return createHash("md5").update(s).digest("hex")
}

// todo: if the same component is defined in multiple files, it will be overwritten.
// todo: if two paths have the same title and summary, they will have the same slugs.

// at first check the method: get, post; if they are different, use them
// at second check the path and take cache from it

// todo: add prefix for the reference id
// it is useful if the result declarations created from multiple files

export type OpenAPIComponentsKey = keyof OpenAPI.ComponentsObject

export interface PathChunk {
  key: string
  value: OpenAPI.PathItemObject
}

export class ProcessPath extends Transform {
  _cache: Cache

  constructor(cache: Cache) {
    super({objectMode: true})
    this._cache = cache
  }

  _transform(ch: PathChunk, _: BufferEncoding, cb: TransformCallback): void {
    const p = ch.key
    const o = ch.value
    console.log(`start processing ${p}`)

    httpMethods().forEach((m) => {
      const e = `${m} ${p}`
      const s = o[m]
      if (s !== undefined) {
        console.info(`start processing "${e}"`)
        if (s.tags === undefined) {
          console.warn("tags is missing")
          console.info(`skipped processing "${e}"`)
        } else {
          const u = m.toUpperCase()
          s.tags.forEach((t) => {
            const a = t.split("/")
            a.forEach((t, i) => {
              const g = a.slice(0, i + 1).join("/")
              let ct = this._cache.groups[g]
              if (ct === undefined) {
                ct = {
                  kind: "group",
                  slug: g.split("/").map(slugify).join("/"),
                  title: t,
                  // description: null,
                  // requests: []
                }
                this._cache.groups[g] = ct
              }
            })

            // let ct = this._cache.groups[t]
            // if (ct === undefined) {
            //   ct = {
            //     kind: "group",
            //     slug: slugify(t),
            //     title: t,
            //     // description: null,
            //     // requests: []
            //   }
            //   this._cache.groups[t] = ct
            // }
            const r = createRequest(this._cache, u, p, {
              ...s,
              tags: [t]
            })
            r.id = hash(r.endpoint)

            let cdr = this._cache.declarations.requests[r.slug]
            if (cdr === undefined) {
              cdr = []
              this._cache.declarations.requests[r.slug] = cdr
            }
            cdr.push({id: r.id, method: u, path: p})

            // ct.requests.push(r.slug)
            this.push(r)
          })
          console.info(`finished processing "${e}"`)
        }
      }
    })

    console.log(`finished processing ${p}`)
    cb(null)
  }
}

export interface RequestChunk {
  key: string
  value: REST.RequestDeclaration
}

export class ProcessRequest extends Transform {
  _cache: Cache

  constructor(cache: Cache) {
    super({objectMode: true})
    this._cache = cache
  }

  _transform(ch: RequestChunk, _: BufferEncoding, cb: TransformCallback): void {
    const cr = this._cache.declarations.requests[ch.value.slug]
    if (cr !== undefined && cr.length > 1) {
      const i = cr.findIndex((r) => r.id === ch.value.id)
      if (i !== -1) {
        const c = cr[i]
        const mi = cr.findIndex((r) => r.id !== c.id && r.method !== c.method)
        if (mi !== -1) {
          ch.value.slug = `${ch.value.slug}-${c.method.toLocaleLowerCase()}`
          ch.value.title = `${ch.value.title} (${c.method})`
        } else {
          // todo: calc a chance of collision.
          ch.value.slug = `${ch.value.slug}-${c.id.slice(0, 4)}`
        }
      }
    }

    this.push(ch.value)
    cb(null)
  }
}

export function httpMethods(): OpenAPI.HttpMethods[] {
  // I have no idea how to convert enum values to array.
  return [
    "delete", "get",  "head", "options",
    "patch",  "post", "put",  "trace"
  ] as OpenAPI.HttpMethods[]
}

interface OpenAPIComponentChunk<K extends OpenAPIComponentsKey> {
  key: string
  value: NonNullable<OpenAPI.ComponentsObject[K]>
}

export class ProcessComponent<K extends OpenAPIComponentsKey> extends Transform {
  _cache: Cache
  _key: K

  constructor(cache: Cache, key: K) {
    super({objectMode: true})
    this._cache = cache
    this._key = key
  }

  _transform(ch: OpenAPIComponentChunk<K>, _: BufferEncoding, cb: TransformCallback) {
    const key = `#/components/${this._key}/${ch.key}`
    console.log(`start processing "${key}"`)

    const c = {headers: {}}

    const value = createComponent(c, this._key, ch.value)
    if (value !== undefined) {
      this.push({key, value})
      console.info(`finished processing "${key}"`)
    } else {
      console.warn(`failed to process "${key}"`)
    }

    switch (this._key) {
    case "responses":
      this._cache.requests[key] = c
      break
    }

    cb(null)
  }
}

export class Cache {
  declarations: {
    groups: Partial<Record<string, REST.GroupDeclaration>>
    requests: Partial<Record<string, {id: string, method: string, path: string}[]>>
  } = {
    groups: {},
    requests: {}
  }
  // todo: components: {} = {}

  requests: Partial<Record<string, {headers: any}>> = {}
  groups: Partial<Record<string, REST.GroupDeclaration>> = {}
}

function createRequest(c: Cache, m: string, p: string, s: OpenAPI.OperationObject): REST.RequestDeclaration {
  const n = service.declarationNode()
  const r = service.requestDeclaration(n)
  populateRequestHero(r, m, p, s)
  populateRequestParameters(r, s)
  populateRequestResponses(c, r, s)
  populateRequestExamples(r)
  normalizeRequest(r)
  return r
}

function populateRequestHero(req: REST.RequestDeclaration, m: string, p: string, s: OpenAPI.OperationObject): void {
  req.endpoint = `${m} ${p}`

  if (s.summary !== undefined) {
    let a: string[] = []

    if (s.tags !== undefined) {
      const [t] = s.tags
      if (t !== undefined) {
        a = t.split("/")
      } else {
        console.warn("first tag is missing")
      }
    } else {
      console.warn("tags is missing")
    }

    a.push(s.summary)
    req.slug = a
      .map((s) => {
        return slugify(s)
      })
      .join("/")

    req.title = s.summary
  } else {
    console.warn("summary is missing")
  }

  if (s.description !== undefined) {
    req.description = s.description
  } else {
    console.warn("description is missing")
  }
}

function populateRequestParameters(req: REST.RequestDeclaration, s: OpenAPI.OperationObject): void {
  const path: REST.Property[] = []
  const query: REST.Property[] = []

  if (s.parameters !== undefined) {
    s.parameters.forEach((p) => {
      if ("$ref" in p) {
        console.warn("parameter reference not supported")
        return
      }
      switch (p.in) {
      case "path":
        const p0 = createParameter(p)
        if (p0 !== undefined) {
          path.push(p0)
        }
        break
      case "query":
        const p1 = createParameter(p)
        if (p1 !== undefined) {
          query.push(p1)
        }
        break
      default:
        console.warn(`parameter location "${p.in}" not supported`)
        break
      }
    })
  }

  const header: REST.Property[] = []
  let body: REST.Value | undefined = undefined

  if (s.requestBody !== undefined) {
    if ("$ref" in s.requestBody) {
      console.warn("request body reference not supported")
    } else {
      const e = Object.entries(s.requestBody.content)
      if (e.length !== 0) {
        const [k, v] = e[0]
        if (v.schema !== undefined) {
          let o = v.schema
          if (s.requestBody !== undefined) {
            if (s.requestBody.description !== undefined) {
              o.description = s.requestBody.description
            }
          }
          body = createValue(o)
          if (body !== undefined) {
            if (s.requestBody !== undefined) {
              if (s.requestBody.required === true) {
                body.required = true
              }
            }
          }
        } else {
          console.warn("schema for request body is missing")
        }

        const cases = [k]

        for (let i = 1; i < e.length; i += 1) {
          cases.push(e[i][0])
        }
        const h = createStringProperty({enum: cases})
        h.identifier = "Content-Type"
        header.push(h)
      } else {
        console.warn("content for request body is missing")
      }
    }
  }

  if (header.length > 0) {
    req.headerParameters = header
  }
  if (path.length > 0) {
    req.pathParameters = path
  }
  if (query.length > 0) {
    req.queryParameters = query
  }
  if (body !== undefined) {
    req.bodyParameters = body
  }
}

export function populateRequestExamples(req: REST.RequestDeclaration): void {
  req.examples = [
    example.curlExample(req),
    example.httpExample(req)
  ]
}

function populateRequestResponses(cache: Cache, req: REST.RequestDeclaration, s: OpenAPI.OperationObject): void {
  const headers: Record<string, REST.Property> = {}

  const responses: REST.Response[] = []

  if (s.responses !== undefined) {
    Object.entries(s.responses).forEach(([k, v]) => {
      // const r = createResponse({headers: {}}, v)
      // r.status = Number(k)

      let r: REST.Response = {
        status: Number(k)
      }

      if ("$ref" in v) {
        const o = createReference(v)
        r = {...r, ...o}
        const c = cache.requests[o.id]
        if (c !== undefined) {
          Object.entries(c.headers).forEach(([k, p]) => {
            switch (k) {
            case "Accept":
              if (headers.Accept !== undefined) {
                if ("id" in headers.Accept) {
                  console.warn("header reference not supported")
                } else {
                  if (headers.Accept.cases !== undefined) {
                    const s = new Set(headers.Accept.cases.concat(p.cases))
                    headers.Accept.cases = [...s]
                  } else {
                    headers.Accept.cases = p.cases
                  }
                }
              } else {
                headers.Accept = p
              }
              break
            default:
              console.warn(`header "${k}" not supported`)
            }
          })
        }
      } else {
        if (v.description !== undefined) {
          r.description = v.description
        }

        if (v.content !== undefined) {
          const cases: string[] = []

          const e = Object.entries(v.content)
          if (e.length !== 0) {
            const [c, o] = e[0]
            cases.push(c)

            if (o.schema !== undefined) {
              r.body = createValue(o.schema)
            } else {
              console.warn("schema for response is missing")
            }

            for (let i = 1; i < e.length; i += 1) {
              cases.push(e[i][0])
            }
          } else {
            console.warn("content for response is missing")
          }

          const a = createStringProperty({enum: cases})
          a.identifier = "Accept"
          if (headers[a.identifier] !== undefined) {
            const h = headers[a.identifier]
            if ("id" in h) {
              console.warn("header reference not supported")
            } else {
              if (h.cases !== undefined) {
                const s = new Set(h.cases.concat(a.cases))
                h.cases = [...s]
              } else {
                h.cases = a.cases
              }
            }
          } else {
            headers[a.identifier] = a
          }
        }
      }

      responses.push(r)
    })
  } else {
    console.warn("responses for request is missing")
  }

  if (responses.length > 0) {
    req.responses = responses
  }
  const h = Object.values(headers)
  if (h.length > 0) {
    if (req.headerParameters === undefined) {
      req.headerParameters = h
    } else {
      req.headerParameters = req.headerParameters.concat(h)
    }
  }
}

function normalizeRequest(req: REST.RequestDeclaration): void {
  if (req.headerParameters !== undefined) {
    req.headerParameters = req.headerParameters.sort((a, b) => {
      return a.identifier.localeCompare(b.identifier)
    })
  }
}

function createComponent<T extends OpenAPIComponentsKey>(cache: Cache, t: T, s: NonNullable<OpenAPI.ComponentsObject[T]>) {
  switch (t) {
  case "schemas":
    const s = as("schemas")
    return createType(s)
  case "responses":
    const r = as("responses")
    return createResponseComponent(cache, r)
  default:
    console.warn(`"${t}" not supported`)
    break
  }

  /**
   * @template {OpenAPIComponentsKey} T
   * @param {T} _
   * @returns {NonNullable<OpenAPIComponentsObject[T]>[""]}
   */
  function as(_) {
    return s
  }
}

function createResponseComponent(cache: REST.ComponentCache, s: OpenAPI.ReferenceObject | OpenAPI.ResponseObject): REST.Response {
  let r: REST.Response = {
    // todo: resolve it.
    status: 0
  }

  if ("$ref" in s) {
    const o = createReference(s)
    r = {...r, ...o}
  } else {
    if (s.description !== undefined) {
      r.description = s.description
    }

    if (s.content !== undefined) {
      const cases: string[] = []

      const e = Object.entries(s.content)
      if (e.length !== 0) {
        const [c, o] = e[0]
        cases.push(c)

        if (o.schema !== undefined) {
          r.body = createValue(o.schema)
        } else {
          console.warn("schema for response is missing")
        }

        for (let i = 1; i < e.length; i += 1) {
          cases.push(e[i][0])
        }
      } else {
        console.warn("content for response is missing")
      }

      const a = createStringProperty({enum: cases})
      a.identifier = "Accept"
      cache.headers[a.identifier] = a
    }
  }

  return r
}

// todo: param {OpenAPIReferenceObject | OpenAPIParameterObject} s
function createParameter(s: OpenAPI.ParameterObject): REST.Property | undefined {
  if (s.schema === undefined) {
    console.warn(`missing schema for parameter "${s.name}"`)
    return
  }
  const p = createProperty(s.schema)
  p.identifier = s.name
  if (s.required === true) {
    p.required = true
  }
  return p
}

function createProperty(s: OpenAPI.ReferenceObject | OpenAPI.SchemaObject): REST.Property {
  if ("$ref" in s) {
    return createPropertyReference(s)
  }
  switch (s.type) {
  case "array":
    return createArrayProperty(s)
  case "boolean":
    return createBooleanProperty(s)
  case "integer":
    return createIntegerProperty(s)
  case "number":
    return createNumberProperty(s)
  case "object":
    return createObjectProperty(s)
  case "string":
    return createStringProperty(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownProperty(s)
  }
}

function createPropertyReference(s: OpenAPI.ReferenceObject): REST.PropertyReference {
  const n = createPropertyNode(s)
  const v = createValueReference(s)
  return {...n, ...v}
}

function createArrayProperty(s: OpenAPI.ArraySchemaObject): REST.ArrayProperty {
  const n = createPropertyNode(s)
  const v = createArrayValue(s)
  return {...n, ...v}
}

function createBooleanProperty(s: OpenAPI.NonArraySchemaObject): REST.BooleanProperty {
  const n = createPropertyNode(s)
  const v = createBooleanValue(s)
  return {...n, ...v}
}

function createIntegerProperty(s: OpenAPI.NonArraySchemaObject): REST.IntegerProperty {
  const n = createPropertyNode(s)
  const v = createIntegerValue(s)
  return {...n, ...v}
}

function createNumberProperty(s: OpenAPI.NonArraySchemaObject): REST.NumberProperty {
  const n = createPropertyNode(s)
  const v = createNumberValue(s)
  return {...n, ...v}
}

function createObjectProperty(s: OpenAPI.NonArraySchemaObject): REST.ObjectProperty {
  const n = createPropertyNode(s)
  const v = createObjectValue(s)
  return {...n, ...v}
}

function createStringProperty(s: OpenAPI.NonArraySchemaObject): REST.StringProperty {
  const n = createPropertyNode(s)
  const v = createStringValue(s)
  return {...n, ...v}
}

function createUnknownProperty(s: OpenAPI.SchemaObject): REST.UnknownProperty {
  const n = createPropertyNode(s)
  const v = createUnknownValue(s)
  return {...n, ...v}
}

function createPropertyNode(s: OpenAPI.SchemaObject): REST.PropertyNode {
  return {
    identifier: ""
  }
}

function createValue(s: OpenAPI.ReferenceObject | OpenAPI.SchemaObject): REST.Value {
  if ("$ref" in s) {
    return createValueReference(s)
  }
  switch (s.type) {
  case "array":
    return createArrayValue(s)
  case "boolean":
    return createBooleanValue(s)
  case "integer":
    return createIntegerValue(s)
  case "number":
    return createNumberValue(s)
  case "object":
    return createObjectValue(s)
  case "string":
    return createStringValue(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownValue(s)
  }
}

function createValueReference(s: OpenAPI.ReferenceObject): REST.ValueReference {
  const n = createValueNode(s)
  const t = createReference(s)
  return {...n, ...t}
}

function createArrayValue(s: OpenAPI.ArraySchemaObject): REST.ArrayValue {
  const n = createValueNode(s)
  const t = createArrayType(s)
  return {...n, ...t}
}

function createBooleanValue(s: OpenAPI.NonArraySchemaObject): REST.BooleanValue {
  const n = createValueNode(s)
  const t = createBooleanType(s)
  return {...n, ...t}
}

function createIntegerValue(s: OpenAPI.NonArraySchemaObject): REST.IntegerValue {
  const n = createValueNode(s)
  const t = createIntegerType(s)
  return {...n, ...t}
}

function createNumberValue(s: OpenAPI.NonArraySchemaObject): REST.NumberValue {
  const n = createValueNode(s)
  const t = createNumberType(s)
  return {...n, ...t}
}

function createObjectValue(s: OpenAPI.NonArraySchemaObject): REST.ObjectValue {
  const n = createValueNode(s)
  const t = createObjectType(s)
  return {...n, ...t}
}

function createStringValue(s: OpenAPI.NonArraySchemaObject): REST.StringValue {
  const n = createValueNode(s)
  const t = createStringType(s)
  return {...n, ...t}
}

function createUnknownValue(s: OpenAPI.SchemaObject): REST.UnknownValue {
  const n = createValueNode(s)
  const t = createUnknownType(s)
  return {...n, ...t}
}

function createValueNode(s: OpenAPI.SchemaObject): REST.ValueNode {
  const n: REST.ValueNode = {}
  if (s.description !== undefined) {
    n.description = s.description
  }
  return n
}

function createType(s: OpenAPI.ReferenceObject | OpenAPI.SchemaObject): REST.Type {
  if ("$ref" in s) {
    return createReference(s)
  }
  switch (s.type) {
  case "array":
    return createArrayType(s)
  case "boolean":
    return createBooleanType(s)
  case "integer":
    return createIntegerType(s)
  case "number":
    return createNumberType(s)
  case "object":
    return createObjectType(s)
  case "string":
    return createStringType(s)
  default:
    console.warn(`type "${s.type}" not supported`)
    return createUnknownType(s)
  }
}

function createArrayType(s: OpenAPI.ArraySchemaObject): REST.ArrayType {
  const n = createTypeNode(s)
  const a: REST.ArrayType = {...n, type: "array"}

  if (s.items !== undefined) {
    a.items = createType(s.items)
  } else {
    console.warn("items for array is missing")
  }

  return a
}

function createBooleanType(s: OpenAPI.NonArraySchemaObject): REST.BooleanType {
  const n = createTypeNode(s)
  return {...n, type: "boolean"}
}

function createIntegerType(s: OpenAPI.NonArraySchemaObject): REST.IntegerType {
  const n = createTypeNode(s)
  return {...n, type: "integer"}
}

function createNumberType(s: OpenAPI.NonArraySchemaObject): REST.NumberType {
  const n = createTypeNode(s)
  return {...n, type: "number"}
}

function createObjectType(s: OpenAPI.NonArraySchemaObject): REST.ObjectType {
  const n = createTypeNode(s)
  const o: REST.ObjectType = {...n, type: "object"}

  if (s.properties !== undefined) {
    o.properties = Object
      .entries(s.properties)
      .map(([k, v]) => {
        const p = createProperty(v)
        p.identifier = k
        if (s.required !== undefined && s.required.includes(k)) {
          p.required = true
        }
        return p
      })
  } else {
    console.warn("properties for object is missing")
  }

  return o
}

function createStringType(s: OpenAPI.NonArraySchemaObject): REST.StringType {
  const n = createTypeNode(s)
  return {...n, type: "string"}
}

function createUnknownType(s: OpenAPI.SchemaObject): REST.UnknownType {
  const n = createTypeNode(s)
  return {...n, type: "unknown"}
}

function createTypeNode(s: OpenAPI.SchemaObject): REST.TypeNode {
  const n: REST.TypeNode = {
    type: "",
    // format: undefined,
    // cases: undefined
  }
  if (s.format !== undefined) {
    n.format = s.format
  }
  if (s.enum !== undefined) {
    n.cases = s.enum
  }
  return n
}

function createReference(s: OpenAPI.ReferenceObject): REST.Reference {
  return {id: s.$ref}
}
