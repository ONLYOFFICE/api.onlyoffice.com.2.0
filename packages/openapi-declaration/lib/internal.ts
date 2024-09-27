import {randomUUID} from "node:crypto"
import * as Service from "@onlyoffice/service-declaration"
import {type OpenAPIV3_1 as OpenApi} from "openapi-types"

type OpenApiComponentsKey = keyof OpenApi.ComponentsObject
type ValueOf<T> = T[keyof T]

export function component<K extends OpenApiComponentsKey>(
  k: K,
  s: ValueOf<NonNullable<OpenApi.ComponentsObject[K]>>,
): [Component, ...Error[]] {
  if (k === "responses") {
    const v = s as ValueOf<NonNullable<OpenApi.ComponentsObject["responses"]>>
    return ResponseComponent.fromOpenApi(v)
  }

  if (k === "schemas") {
    const v = s as ValueOf<NonNullable<OpenApi.ComponentsObject["schemas"]>>
    return EntityComponent.fromOpenApi(v)
  }

  if (k === "securitySchemes") {
    const v = s as ValueOf<NonNullable<OpenApi.ComponentsObject["securitySchemes"]>>
    return AuthorizationComponent.fromOpenApi(v)
  }

  const e = new Error(`The component '${k}' is not supported`)
  return [new NoopComponent(), e]
}

export type Component = ComponentMap[keyof ComponentMap]

export interface ComponentMap {
  authorization: AuthorizationComponent
  entity: EntityComponent
  noop: NoopComponent
  response: ResponseComponent
}

export class AuthorizationComponent implements ComponentNode {
  id = ""
  self: Authorization | Reference = new NoopAuthorization()

  static fromOpenApi(
    s: OpenApi.SecuritySchemeObject | OpenApi.ReferenceObject,
  ): [AuthorizationComponent, ...Error[]] {
    const es: Error[] = []
    const c = new AuthorizationComponent()

    let ne: Error[]
    let n: Authorization | Reference

    if ("$ref" in s) {
      [n, ...ne] = DirectReference.fromOpenApi(s)
    } else {
      [n, ...ne] = authorization(s)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    c.self = n

    return [c, ...es]
  }

  copy(): AuthorizationComponent {
    const c = new AuthorizationComponent()
    c.self = this.self
    return c
  }

  resolve(c: Cache<Component>, s: State): AuthorizationComponent {
    const r = this.copy()

    if (r.self instanceof DirectReference && s.includes(r.self.id)) {
      r.self = new CircularReference()
    } else if (r.self instanceof DirectReference) {
      s.push(r.self.id)

      const t = c.retrieve(r.self.id)
      if (!(t instanceof AuthorizationComponent)) {
        throw new TypeError("The DirectReference does not point to an AuthorizationComponent")
      }

      const v = t.resolve(c, s)
      r.self = v.self
      s.pop()
    }

    return r
  }
}

export class EntityComponent implements ComponentNode {
  id = ""
  self = new Entity()

  static fromOpenApi(s: OpenApi.SchemaObject): [EntityComponent, ...Error[]] {
    const es: Error[] = []
    const c = new EntityComponent()

    const [m, ...ne] = Entity.fromOpenApi(s)
    if (ne.length !== 0) {
      es.push(...ne)
    }

    c.self = m

    return [c, ...es]
  }
}

export class NoopComponent implements ComponentNode {
  id = ""
}

export class ResponseComponent implements ComponentNode {
  id = ""
  self: Response | Reference = new Response()

  static fromOpenApi(
    s: OpenApi.ResponseObject | OpenApi.ReferenceObject,
  ): [ResponseComponent, ...Error[]] {
    const es: Error[] = []
    const c = new ResponseComponent()

    let ne: Error[]
    let n: Response | Reference

    if ("$ref" in s) {
      [n, ...ne] = DirectReference.fromOpenApi(s)
    } else {
      [n, ...ne] = Response.fromOpenApi(s)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    c.self = n

    return [c, ...es]
  }

  copy(): ResponseComponent {
    const c = new ResponseComponent()
    c.self = this.self
    return c
  }

  resolve(c: Cache<Component>, s: State): ResponseComponent {
    const r = this.copy()

    if (r.self instanceof DirectReference && s.includes(r.self.id)) {
      r.self = new CircularReference()
    } else if (r.self instanceof DirectReference) {
      s.push(r.self.id)

      const t = c.retrieve(r.self.id)
      if (!(t instanceof ResponseComponent)) {
        throw new TypeError("The DirectReference does not point to an ResponseComponent")
      }

      const v = t.resolve(c, s)
      r.self = v.self
      s.pop()
    } else if (r.self instanceof Response) {
      r.self = r.self.resolve(c, s)
    }

    return r
  }
}

export interface ComponentNode {
  id: string
}

export function declaration(s: OpenApi.OperationObject): [Declaration[], ...Error[]] {
  if (!s.tags) {
    const e = new Error("The tags of the OperationObject is missing")
    return [[], e]
  }

  const ds: Declaration[] = []
  const es: Error[] = []

  for (const t of s.tags) {
    const a = t.split("/")

    const [n] = a
    const g = new GroupDeclaration()
    g.name = n.trim()
    ds.push(g)

    for (let i = 1; i < a.length; i += 1) {
      const n = a[i]
      const p = ds[ds.length - 1] as GroupDeclaration
      const c = new GroupDeclaration()
      c.name = n.trim()
      c.parent = p.id
      p.children.push(c.id)
      ds.push(c)
    }
  }

  const [o, ...ne] = OperationDeclaration.fromOpenApi(s)
  if (ne.length !== 0) {
    es.push(...ne)
  }

  const l = ds.length

  for (let i = 0; i < l; i += 1) {
    const g = ds[i] as GroupDeclaration
    if (g.children.length !== 0) {
      continue
    }

    const d = o.copy()
    g.children.push(d.id)
    d.parent = g.id
    ds.push(d)
  }

  return [ds, ...es]
}

export type Declaration = DeclarationMap[keyof DeclarationMap]

export interface DeclarationMap {
  group: GroupDeclaration
  operation: OperationDeclaration
}

export class GroupDeclaration implements DeclarationNode {
  id: string = randomUUID()
  name = ""
  description = ""
  parent = ""
  children: string[] = []

  copy(): GroupDeclaration {
    const g = new GroupDeclaration()
    g.name = this.name
    g.description = this.description
    g.parent = this.parent
    g.children = this.children
    return g
  }

  resolve(c: Cache<OpenApi.TagObject>): GroupDeclaration {
    const g = this.copy()

    try {
      const t = c.retrieve(g.name)
      if (t.description) {
        g.description = t.description
      }
    } catch {
      // The additional information on tags is optional, so we should not throw
      // an error if it does not exist.
    }

    return g
  }

  toService(): Service.GroupDeclaration {
    const d = new Service.GroupDeclaration()
    d.id = this.id
    d.name = this.name
    d.description = this.description
    d.parent = this.parent
    d.children = this.children
    return d
  }
}

export class OperationDeclaration implements DeclarationNode {
  id: string = randomUUID()
  name = ""
  parent = ""
  deprecated = false
  request = new Request()
  responses: ResponseRecord[] = []

  static fromOpenApi(s: OpenApi.OperationObject): [OperationDeclaration, ...Error[]] {
    const es: Error[] = []
    const d = new OperationDeclaration()

    if (!s.summary) {
      const e = new Error("The summary of the OperationObject is missing")
      es.push(e)
    } else {
      d.name = s.summary
    }

    if (s.deprecated) {
      d.deprecated = s.deprecated
    }

    const [r, ...re] = Request.fromOpenApi(s)
    if (re.length !== 0) {
      es.push(...re)
    }

    d.request = r

    if (s.responses) {
      for (const [k, v] of Object.entries(s.responses)) {
        const [r, ...ne] = ResponseRecord.fromOpenApi(v)
        if (ne.length !== 0) {
          es.push(...ne)
        }

        r.status = Number(k)

        if (r.self instanceof Response) {
          d.request = d.request.merge(r.self.request)
          r.self.request = new Request()
        }

        d.responses.push(r)
      }
    }

    return [d, ...es]
  }

  copy(): OperationDeclaration {
    const d = new OperationDeclaration()
    d.name = this.name
    d.parent = this.parent
    d.deprecated = this.deprecated
    d.request = this.request
    d.responses = this.responses
    return d
  }

  resolve(c: Cache<Component>, s: State): OperationDeclaration {
    const d = this.copy()
    d.request = d.request.resolve(c, s)

    for (const [i, r] of d.responses.entries()) {
      d.responses[i] = r.resolve(c, s)
    }

    return d
  }

  normalize(): OperationDeclaration {
    const d = this.copy()
    d.request = d.request.normalize()

    for (const [i, r] of d.responses.entries()) {
      d.responses[i] = r.normalize()
    }

    return d
  }

  toService(): Service.OperationDeclaration {
    const d = new Service.OperationDeclaration()

    d.id = this.id
    d.name = this.name
    d.parent = this.parent
    d.deprecated = this.deprecated
    d.request = this.request.toService()

    for (const r of this.responses) {
      const s = r.toService()
      d.responses.push(s)
    }

    return d
  }
}

export interface DeclarationNode {
  id: string
  name: string
  parent: string
}

export class Request {
  method = ""
  path = ""
  description = ""
  authorizations: Authorization[] = []
  authorizationRequirements: AuthorizationRequirement[] = []
  headerParameters = new Entity()
  cookieParameters = new Entity()
  pathParameters = new Entity()
  queryParameters = new Entity()
  bodyParameters: Entity | DirectReference = new Entity()
  unknownParameters: DirectReference[] = []

  static fromOpenApi(s: OpenApi.OperationObject): [Request, ...Error[]] {
    const es: Error[] = []
    const r = new Request()

    if (s.description) {
      r.description = s.description
    }

    if (s.security) {
      for (const o of s.security) {
        for (const [k, v] of Object.entries(o)) {
          const a = new AuthorizationRequirement()
          a.identifier = k
          a.scopes = v
          r.authorizationRequirements.push(a)
        }
      }
    }

    r.cookieParameters.type = new ObjectType()
    r.headerParameters.type = new ObjectType()
    r.pathParameters.type = new ObjectType()
    r.queryParameters.type = new ObjectType()

    if (s.parameters) {
      for (const o of s.parameters) {
        if ("$ref" in o) {
          const [n, ...ne] = DirectReference.fromOpenApi(o)
          if (ne.length !== 0) {
            es.push(...ne)
          }

          r.unknownParameters.push(n)
          continue
        }

        const [p, ...ne] = Parameter.fromOpenApi(o)
        if (ne.length !== 0) {
          es.push(...ne)
        }

        switch (o.in) {
        case "cookie":
          r.cookieParameters.type.properties.push(p)
          continue
        case "header":
          r.headerParameters.type.properties.push(p)
          continue
        case "path":
          r.pathParameters.type.properties.push(p)
          continue
        case "query":
          r.queryParameters.type.properties.push(p)
          continue
        }

        const e = new Error(`The parameter 'in' value '${o.in}' is not supported`)
        es.push(e)
      }
    }

    if (s.requestBody) {
      let ne: Error[]
      let n: Entity | DirectReference

      if ("$ref" in s.requestBody) {
        [n, ...ne] = DirectReference.fromOpenApi(s.requestBody)
      } else {
        const a = Object.entries(s.requestBody.content)
        const [[_, o]] = a

        if (!o.schema) {
          const e = new Error("The schema of the MediaTypeObject is missing")
          ne = [e]
          n = new Entity()
        } else if ("$ref" in o.schema) {
          [n, ...ne] = DirectReference.fromOpenApi(o.schema)
        } else {
          [n, ...ne] = Entity.fromOpenApi(o.schema)
        }

        const p = new Parameter()
        p.identifier = "Content-Type"
        p.self = new Entity()
        p.self.type = new EnumType()

        for (const [k] of a) {
          const y = new Entity()
          y.type = new LiteralType()
          y.type.base = new StringType()
          y.type.const = new PassthroughConst()
          y.type.const.value = k
          p.self.type.cases.push(y)
        }

        r.headerParameters.type.properties.push(p)
      }

      if (ne.length !== 0) {
        es.push(...ne)
      }

      r.bodyParameters = n
    }

    if (r.cookieParameters.type.properties.length === 0) {
      r.cookieParameters.type = new NoopType()
    }
    if (r.headerParameters.type.properties.length === 0) {
      r.headerParameters.type = new NoopType()
    }
    if (r.pathParameters.type.properties.length === 0) {
      r.pathParameters.type = new NoopType()
    }
    if (r.queryParameters.type.properties.length === 0) {
      r.queryParameters.type = new NoopType()
    }

    return [r, ...es]
  }

  merge(b: Request): Request {
    const c = new Request()
    c.method = this.method
    c.path = this.path
    c.description = this.description
    c.authorizations = this.authorizations
    c.authorizationRequirements = this.authorizationRequirements
    c.headerParameters = this.headerParameters.merge(b.headerParameters)
    c.cookieParameters = this.cookieParameters
    c.pathParameters = this.pathParameters
    c.queryParameters = this.queryParameters
    c.bodyParameters = this.bodyParameters
    c.unknownParameters = this.unknownParameters
    return c
  }

  copy(): Request {
    const c = new Request()
    c.method = this.method
    c.path = this.path
    c.description = this.description
    c.authorizations = this.authorizations
    c.authorizationRequirements = this.authorizationRequirements
    c.headerParameters = this.headerParameters
    c.cookieParameters = this.cookieParameters
    c.pathParameters = this.pathParameters
    c.queryParameters = this.queryParameters
    c.bodyParameters = this.bodyParameters
    c.unknownParameters = this.unknownParameters
    return c
  }

  resolve(c: Cache<Component>, s: State): Request {
    const r = this.copy()

    for (const u of r.authorizationRequirements) {
      const a = u.resolve(c, s)
      r.authorizations.push(a)
    }

    r.authorizationRequirements = []
    r.headerParameters = r.headerParameters.resolve(c, s)
    r.cookieParameters = r.cookieParameters.resolve(c, s)
    r.pathParameters = r.pathParameters.resolve(c, s)
    r.queryParameters = r.queryParameters.resolve(c, s)

    if (r.bodyParameters instanceof DirectReference && s.includes(r.bodyParameters.id)) {
      throw new Error("The bodyParameters cannot be a CircularReference")
    } else if (r.bodyParameters instanceof DirectReference) {
      s.push(r.bodyParameters.id)

      const t = c.retrieve(r.bodyParameters.id)
      if (!(t instanceof EntityComponent)) {
        throw new TypeError("The DirectReference does not point to an EntityComponent")
      }

      r.bodyParameters = t.self.resolve(c, s)
      s.pop()
    } else if (r.bodyParameters instanceof Entity) {
      r.bodyParameters = r.bodyParameters.resolve(c, s)
    }

    return r
  }

  normalize(): Request {
    const r = this.copy()

    if (r.headerParameters.type instanceof ObjectType) {
      const t = r.headerParameters.type

      for (const p of t.properties) {
        if (
          (p.identifier === "Accept" || p.identifier === "Content-Type") &&
          p.self instanceof Entity &&
          p.self.type instanceof EnumType
        ) {
          p.self.type.cases = p.self.type.cases.sort((a, b) => {
            if (!(a.type instanceof LiteralType)) {
              throw new TypeError("The type of the Entity is not a LiteralType")
            }
            if (!(b.type instanceof LiteralType)) {
              throw new TypeError("The type of the Entity is not a LiteralType")
            }
            if (!(a.type.const instanceof PassthroughConst)) {
              throw new TypeError("The const of the LiteralType is not a PassthroughConst")
            }
            if (!(b.type.const instanceof PassthroughConst)) {
              throw new TypeError("The const of the LiteralType is not a PassthroughConst")
            }
            if (!(typeof a.type.const.value === "string")) {
              throw new TypeError("The value of the PassthroughConst is not a string")
            }
            if (!(typeof b.type.const.value === "string")) {
              throw new TypeError("The value of the PassthroughConst is not a string")
            }
            if (a.type.const.value === "application/json") {
              return -1
            }
            if (b.type.const.value === "application/json") {
              return 1
            }
            if (a.type.const.value === "multipart/form-data") {
              return -1
            }
            if (b.type.const.value === "multipart/form-data") {
              return 1
            }
            return a.type.const.value.localeCompare(b.type.const.value)
          })
        }
      }

      t.properties = t.properties.sort((a, b) => {
        return a.identifier.localeCompare(b.identifier)
      })
    }

    r.headerParameters = r.headerParameters.normalize()
    r.cookieParameters = r.cookieParameters.normalize()
    r.pathParameters = r.pathParameters.normalize()
    r.queryParameters = r.queryParameters.normalize()

    if (r.bodyParameters instanceof Entity) {
      r.bodyParameters = r.bodyParameters.normalize()
    }

    return r
  }

  toService(): Service.Request {
    if (this.unknownParameters.length !== 0) {
      throw new TypeError("The unknownParameters contains a Reference, which cannot be converted")
    }
    if (this.bodyParameters instanceof DirectReference) {
      throw new TypeError("The bodyParameters is a DirectReference, which cannot be converted")
    }

    const r = new Service.Request()
    r.method = this.method
    r.path = this.path
    r.description = this.description

    for (const u of this.authorizations) {
      // The NoopAuthorization exists for internal purposes only and can only
      // appear here if the component processing step fails to generate a real
      // Authorization structure. If so, the error was already registered. In
      // this situation, it is better not to throw an exception but simply omit
      // the processing of this structure to avoid interrupting data processing.
      if (u instanceof NoopAuthorization) {
        continue
      }

      const a = u.toService()
      r.authorizations.push(a)
    }

    r.headerParameters = this.headerParameters.toService()
    r.cookieParameters = this.cookieParameters.toService()
    r.pathParameters = this.pathParameters.toService()
    r.queryParameters = this.queryParameters.toService()
    r.bodyParameters = this.bodyParameters.toService()

    return r
  }
}

export type Authorization = AuthorizationMap[keyof AuthorizationMap]

export interface AuthorizationMap {
  apiKey: ApiKeyAuthorization
  noop: NoopAuthorization
}

export function authorization(s: OpenApi.SecuritySchemeObject): [Authorization, ...Error[]] {
  switch (s.type) {
  case "apiKey":
    return ApiKeyAuthorization.fromOpenApi(s)
  }

  const e = new Error(`The type '${s.type}' is not supported`)
  return [new NoopAuthorization(), e]
}

function isAuthorization(a: unknown): a is Authorization {
  return a instanceof ApiKeyAuthorization || a instanceof NoopAuthorization
}

export class ApiKeyAuthorization implements AuthorizationNode {
  identifier = ""
  description = ""
  "in": "cookie" | "header" | "query" | "" = ""
  scopes: string[] = []

  static fromOpenApi(s: OpenApi.ApiKeySecurityScheme): [Authorization, ...Error[]] {
    const es: Error[] = []
    const a = new ApiKeyAuthorization()

    // Even though the OpenAPI schema mandates the name property, some providers
    // might forget to include it.
    if (!s.name) {
      const e = new Error("The name of the ApiKeySecurityScheme is missing")
      es.push(e)
    } else {
      a.identifier = s.name
    }

    if (s.description) {
      a.description = s.description
    }

    switch (s.in) {
    case "cookie":
    case "header":
    case "query":
      a.in = s.in
      break
    default:
      const e = new Error(`The in '${s.in}' is not supported`)
      es.push(e)
    }

    return [a, ...es]
  }

  copy(): ApiKeyAuthorization {
    const a = new ApiKeyAuthorization()
    a.identifier = this.identifier
    a.description = this.description
    a.in = this.in
    a.scopes = this.scopes
    return a
  }

  toService(): Service.ApiKeyAuthorization {
    const a = new Service.ApiKeyAuthorization()
    a.identifier = this.identifier
    a.description = this.description
    a.in = this.in
    a.scopes = this.scopes
    return a
  }
}

export class NoopAuthorization implements AuthorizationNode {
  identifier = ""
  description = ""
}

export interface AuthorizationNode {
  identifier: string
  description: string
}

export class AuthorizationRequirement {
  identifier = ""
  scopes: string[] = []

  resolve(c: Cache<Component>, s: State): Authorization {
    const t = c.retrieve(this.identifier)
    if (!(t instanceof AuthorizationComponent)) {
      throw new TypeError("The AuthorizationRequirement does not point to an AuthorizationComponent")
    }

    const v = t.resolve(c, s)
    if (!isAuthorization(v.self)) {
      throw new TypeError("The self of the AuthorizationComponent points to a reference after resolving")
    }

    let a = v.self
    if (a instanceof ApiKeyAuthorization) {
      const c = a.copy()
      c.scopes = this.scopes
      a = c
    }

    return a
  }
}

export class ResponseRecord {
  status = -1
  self: Response | DirectReference = new Response()

  static fromOpenApi(
    s: OpenApi.ResponseObject | OpenApi.ReferenceObject,
  ): [ResponseRecord, ...Error[]] {
    const es: Error[] = []
    const r = new ResponseRecord()

    let ne: Error[]
    let n: Response | DirectReference

    if ("$ref" in s) {
      [n, ...ne] = DirectReference.fromOpenApi(s)
    } else {
      [n, ...ne] = Response.fromOpenApi(s)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    r.self = n

    return [r, ...es]
  }

  copy(): ResponseRecord {
    const r = new ResponseRecord()
    r.status = this.status
    r.self = this.self
    return r
  }

  resolve(c: Cache<Component>, s: State): ResponseRecord {
    const r = this.copy()

    if (r.self instanceof DirectReference && s.includes(r.self.id)) {
      throw new Error("The self cannot be a CircularReference")
    } else if (r.self instanceof DirectReference) {
      s.push(r.self.id)

      const t = c.retrieve(r.self.id)
      if (!(t instanceof ResponseComponent)) {
        throw new TypeError("The DirectReference does not point to an ResponseComponent")
      }

      const v = t.resolve(c, s)
      if (!(v.self instanceof Response)) {
        throw new TypeError("The self of the ResponseComponent points to a reference after resolving")
      }

      r.self = v.self
      s.pop()
    } else if (r.self instanceof Response) {
      r.self = r.self.resolve(c, s)
    }

    return r
  }

  normalize(): ResponseRecord {
    const r = this.copy()

    if (r.self instanceof Response) {
      r.self = r.self.normalize()
    }

    return r
  }

  toService(): Service.Response {
    if (this.self instanceof DirectReference) {
      throw new TypeError("The self is a DirectReference, which cannot be converted")
    }

    const r = this.self.toService()
    r.status = this.status

    return r
  }
}

export class Response {
  request = new Request()
  description = ""
  body: Entity | DirectReference = new Entity()

  static fromOpenApi(s: OpenApi.ResponseObject): [Response, ...Error[]] {
    const es: Error[] = []
    const r = new Response()

    if (s.description) {
      r.description = s.description
    }

    if (s.content) {
      const a = Object.entries(s.content)

      r.request.headerParameters.type = new ObjectType()

      const p = new Parameter()
      p.identifier = "Accept"
      p.self = new Entity()
      p.self.type = new EnumType()

      for (const [k] of a) {
        const y = new Entity()
        y.type = new LiteralType()
        y.type.base = new StringType()
        y.type.const = new PassthroughConst()
        y.type.const.value = k
        p.self.type.cases.push(y)
      }

      r.request.headerParameters.type.properties.push(p)

      let ne: Error[]
      let n: Entity | DirectReference

      const [[_, o]] = a

      if (!o.schema) {
        const e = new Error("The schema of the MediaTypeObject is missing")
        ne = [e]
        n = new Entity()
        n.type = new UnknownType()
      } else if ("$ref" in o.schema) {
        [n, ...ne] = DirectReference.fromOpenApi(o.schema)
      } else {
        [n, ...ne] = Entity.fromOpenApi(o.schema)
      }

      if (ne.length !== 0) {
        es.push(...ne)
      }

      r.body = n
    }

    return [r, ...es]
  }

  copy(): Response {
    const r = new Response()
    r.request = this.request
    r.description = this.description
    r.body = this.body
    return r
  }

  resolve(c: Cache<Component>, s: State): Response {
    const r = this.copy()

    if (r.body instanceof DirectReference && s.includes(r.body.id)) {
      throw new Error("The body cannot be a CircularReference")
    } else if (r.body instanceof DirectReference) {
      s.push(r.body.id)

      const t = c.retrieve(r.body.id)
      if (!(t instanceof EntityComponent)) {
        throw new TypeError("The DirectReference does not point to an EntityComponent")
      }

      r.body = t.self.resolve(c, s)
      s.pop()
    } else if (r.body instanceof Entity) {
      r.body = r.body.resolve(c, s)
    }

    return r
  }

  normalize(): Response {
    const r = this.copy()

    if (r.body instanceof Entity) {
      r.body = r.body.normalize()
    }

    return r
  }

  toService(): Service.Response {
    if (this.body instanceof DirectReference) {
      throw new TypeError("The body is a DirectReference, which cannot be converted")
    }

    const r = new Service.Response()
    r.description = this.description
    r.body = this.body.toService()

    return r
  }
}

export class Parameter {
  identifier = ""
  description = ""
  required = false
  deprecated = false
  self: Entity | DirectReference = new Entity()
  example: unknown = ""

  static fromOpenApi(s: OpenApi.ParameterObject): [Parameter, ...Error[]] {
    const es: Error[] = []
    const p = new Parameter()
    p.identifier = s.name

    if (s.description) {
      p.description = s.description
    }

    if (s.required) {
      p.required = s.required
    }

    if (s.deprecated) {
      p.deprecated = s.deprecated
    }

    let ne: Error[]
    let n: Entity | DirectReference

    if (!s.schema) {
      const e = new Error("The schema of the ParameterObject is missing")
      ne = [e]
      n = new Entity()
      n.type = new UnknownType()
    } else if ("$ref" in s.schema) {
      [n, ...ne] = DirectReference.fromOpenApi(s.schema)
    } else {
      [n, ...ne] = Entity.fromOpenApi(s.schema)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    p.self = n

    if (s.example) {
      p.example = s.example
    }

    return [p, ...es]
  }

  merge(b: Parameter): Parameter {
    if (this.identifier !== b.identifier) {
      throw new Error("The identifier of the Parameter is different")
    }
    if (this.self instanceof DirectReference) {
      throw new TypeError("The self is a DirectReference, which is not supported")
    }
    if (b.self instanceof DirectReference) {
      throw new TypeError("The b.self is a DirectReference, which is not supported")
    }

    const c = new Parameter()
    c.identifier = b.identifier
    c.description = b.description
    c.required = b.required
    c.deprecated = b.deprecated
    c.self = this.self.merge(b.self)
    c.example = b.example

    return c
  }

  copy(): Parameter {
    const p = new Parameter()
    p.identifier = this.identifier
    p.description = this.description
    p.required = this.required
    p.deprecated = this.deprecated
    p.self = this.self
    p.example = this.example
    return p
  }

  resolve(c: Cache<Component>, s: State): Parameter {
    const p = this.copy()

    if (p.self instanceof DirectReference && s.includes(p.self.id)) {
      throw new Error("The self cannot be a CircularReference")
    } else if (p.self instanceof DirectReference) {
      s.push(p.self.id)

      const r = c.retrieve(p.self.id)
      if (!(r instanceof EntityComponent)) {
        throw new TypeError("The DirectReference does not point to an EntityComponent")
      }

      p.self = r.self.resolve(c, s)
      s.pop()
    } else if (p.self instanceof Entity) {
      p.self = p.self.resolve(c, s)
    }

    return p
  }

  normalize(): Parameter {
    const p = this.copy()

    if (p.self instanceof Entity) {
      p.self = p.self.normalize()

      // A parameter is a structure of higher abstraction than an entity.
      // Therefore, if a parameter has an example, we should use it regardless
      // of whether the entity has an example.
      if (p.example) {
        p.self.example = p.example
        p.example = ""
      }
    }

    return p
  }

  toService(): Service.Property {
    if (this.self instanceof DirectReference) {
      throw new TypeError("The self is a DirectReference, which cannot be converted")
    }

    const p = new Service.Property()
    p.identifier = this.identifier
    p.required = this.required

    const y = this.self.toService()
    y.description = this.description
    y.deprecated = this.deprecated

    p.self = y

    return p
  }
}

export class Property {
  identifier = ""
  required = false
  self: Entity | Reference = new Entity()

  static fromOpenApi(s: OpenApi.SchemaObject | OpenApi.ReferenceObject): [Property, ...Error[]] {
    const es: Error[] = []
    const p = new Property()

    let ne: Error[]
    let n: Entity | Reference

    if ("$ref" in s) {
      [n, ...ne] = DirectReference.fromOpenApi(s)
    } else {
      [n, ...ne] = Entity.fromOpenApi(s)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    p.self = n

    return [p, ...es]
  }

  merge(b: Property): Property {
    const c = new Property()
    c.identifier = this.identifier
    c.required = this.required

    if (this.self instanceof Entity && b.self instanceof Entity) {
      c.self = this.self.merge(b.self)
    } else {
      throw new TypeError("The Reference cannot be merged")
    }

    return c
  }

  copy(): Property {
    const p = new Property()
    p.identifier = this.identifier
    p.required = this.required
    p.self = this.self
    return p
  }

  resolve(c: Cache<Component>, s: State): Property {
    const p = this.copy()

    if (p.self instanceof DirectReference && s.includes(p.self.id)) {
      p.self = new CircularReference()
    } else if (p.self instanceof DirectReference) {
      s.push(p.self.id)

      const r = c.retrieve(p.self.id)
      if (!(r instanceof EntityComponent)) {
        throw new TypeError("The DirectReference does not point to an EntityComponent")
      }

      p.self = r.self.resolve(c, s)
      s.pop()
    } else if (p.self instanceof Entity) {
      p.self = p.self.resolve(c, s)
    }

    return p
  }

  normalize(): Property {
    const p = this.copy()

    if (p.self instanceof Entity) {
      p.self = p.self.normalize()
    }

    return p
  }

  toService(): Service.Property {
    const p = new Service.Property()
    p.identifier = this.identifier
    p.required = this.required
    p.self = this.self.toService()
    return p
  }
}

export class Entity {
  description = ""
  deprecated = false
  type: Type = new NoopType()
  format = ""
  default: Const = new NoopConst()
  example: unknown = ""

  static fromOpenApi(s: OpenApi.SchemaObject): [Entity, ...Error[]] {
    const es: Error[] = []
    const y = new Entity()

    if (s.description) {
      y.description = s.description
    }

    if (s.deprecated) {
      y.deprecated = s.deprecated
    }

    const [t, ...ne] = type(s)
    if (ne.length !== 0) {
      es.push(...ne)
    }

    y.type = t

    if (s.format) {
      y.format = s.format
    }

    if (s.default) {
      y.default = new PassthroughConst()
      y.default.value = s.default
    }

    if (s.example) {
      y.example = s.example
    }

    return [y, ...es]
  }

  merge(b: Entity): Entity {
    const c = new Entity()
    c.description = this.description
    c.deprecated = this.deprecated

    if (this.type instanceof NoopType) {
      c.type = b.type
    } else if (b.type instanceof NoopType) {
      c.type = this.type
    } else {
      c.type = this.type.merge(b.type)
    }

    c.format = this.format
    c.default = this.default
    c.example = this.example

    return c
  }

  copy(): Entity {
    const y = new Entity()
    y.description = this.description
    y.deprecated = this.deprecated
    y.type = this.type
    y.format = this.format
    y.default = this.default
    y.example = this.example
    return y
  }

  resolve(c: Cache<Component>, s: State): Entity {
    const y = this.copy()
    y.type = y.type.resolve(c, s)
    return y
  }

  normalize(): Entity {
    const y = this.copy()
    y.type = y.type.normalize()

    if (
      y.type instanceof ArrayType &&
      y.type.items instanceof Entity &&
      y.type.items.example &&
      !y.example
    ) {
      y.example = [y.type.items.example]
    } else if (
      y.type instanceof EnumType &&
      y.type.cases.length !== 0 &&
      y.type.cases[0].type instanceof LiteralType &&
      y.type.cases[0].type.const instanceof PassthroughConst &&
      !y.example
    ) {
      y.example = y.type.cases[0].type.const.value
    } else if (
      y.type instanceof LiteralType &&
      y.type.const instanceof PassthroughConst &&
      !y.example
    ) {
      y.example = y.type.const.value
    } else if (
      y.type instanceof ObjectType &&
      y.type.properties.length !== 0 &&
      !y.example
    ) {
      const e: Record<string, unknown> = {}
      for (const p of y.type.properties) {
        if (p.self instanceof Entity && p.self.example) {
          e[p.identifier] = p.self.example
        }
      }
      if (Object.keys(e).length !== 0) {
        y.example = e
      }
    }

    return y
  }

  toService(): Service.Entity {
    const y = new Service.Entity()
    y.description = this.description
    y.deprecated = this.deprecated
    y.type = this.type.toService()
    y.format = this.format
    y.default = this.default.toService()
    y.example = this.example
    return y
  }
}

export type Const = ConstMap[keyof ConstMap]

export interface ConstMap {
  noop: NoopConst
  passthrough: PassthroughConst
}

export class NoopConst {
  toService(): Service.NoopConst {
    return new Service.NoopConst()
  }
}

export class PassthroughConst {
  value: unknown = ""

  toService(): Service.PassthroughConst {
    const s = new Service.PassthroughConst()
    s.value = this.value
    return s
  }
}

export type Type = TypeMap[keyof TypeMap]

export interface TypeMap {
  array: ArrayType
  boolean: BooleanType
  complex: ComplexType
  enum: EnumType
  integer: IntegerType
  literal: LiteralType
  noop: NoopType
  null: NullType
  number: NumberType
  object: ObjectType
  string: StringType
  union: UnionType
  unknown: UnknownType
}

export function type(s: OpenApi.SchemaObject): [Type, ...Error[]] {
  if (s.allOf || s.anyOf || s.oneOf) {
    return ComplexType.fromOpenApi(s)
  }

  if (s.enum) {
    return EnumType.fromOpenApi(s)
  }

  if (!s.type) {
    const e = new Error("The type of the SchemaObject is missing")
    return [new UnknownType(), e]
  }

  if (Array.isArray(s.type)) {
    return UnionType.fromOpenApi(s)
  }

  switch (s.type) {
  case "array":
    return ArrayType.fromOpenApi(s)
  case "boolean":
    return BooleanType.fromOpenApi()
  case "integer":
    return IntegerType.fromOpenApi()
  case "null":
    return NullType.fromOpenApi()
  case "number":
    return NumberType.fromOpenApi()
  case "object":
    return ObjectType.fromOpenApi(s)
  case "string":
    return StringType.fromOpenApi()
  default:
    break
  }

  const e = new Error(`The type '${s.type}' is not supported`)
  return [new UnknownType(), e]
}

export class ArrayType implements TypeNode {
  items: Entity | Reference = new Entity()

  static fromOpenApi(s: OpenApi.ArraySchemaObject): [ArrayType, ...Error[]] {
    const es: Error[] = []
    const t = new ArrayType()

    let ne: Error[]
    let n: Entity | Reference

    // Even though the OpenAPI schema mandates the items property, some
    // providers might forget to include it.
    if (!s.items) {
      const e = new Error("The items of the ArraySchemaObject is missing")
      ne = [e]
      n = new Entity()
      n.type = new UnknownType()
    } else if ("$ref" in s.items) {
      [n, ...ne] = DirectReference.fromOpenApi(s.items)
    } else {
      [n, ...ne] = Entity.fromOpenApi(s.items)
    }

    if (ne.length !== 0) {
      es.push(...ne)
    }

    t.items = n

    return [t, ...es]
  }

  merge(_: TypeNode): ArrayType {
    throw new Error("The ArrayType cannot be merged")
  }

  copy(): ArrayType {
    const t = new ArrayType()
    t.items = this.items
    return t
  }

  resolve(c: Cache<Component>, s: State): ArrayType {
    const t = this.copy()

    if (t.items instanceof DirectReference && s.includes(t.items.id)) {
      t.items = new CircularReference()
    } else if (t.items instanceof DirectReference) {
      s.push(t.items.id)

      const r = c.retrieve(t.items.id)
      if (!(r instanceof EntityComponent)) {
        throw new TypeError("The DirectReference does not point to an EntityComponent")
      }

      t.items = r.self.resolve(c, s)
      s.pop()
    } else if (t.items instanceof Entity) {
      t.items = t.items.resolve(c, s)
    }

    return t
  }

  normalize(): ArrayType {
    const t = this.copy()

    if (t.items instanceof Entity) {
      t.items = t.items.normalize()
    }

    return t
  }

  toService(): Service.ArrayType {
    const t = new Service.ArrayType()
    t.items = this.items.toService()
    return t
  }
}

export class BooleanType implements TypeNode {
  static fromOpenApi(): [BooleanType, ...Error[]] {
    return [new BooleanType()]
  }

  merge(_: TypeNode): BooleanType {
    throw new Error("The BooleanType cannot be merged")
  }

  copy(): BooleanType {
    return new BooleanType()
  }

  resolve(_: Cache<Component>, __: State): BooleanType {
    return this.copy()
  }

  normalize(): BooleanType {
    return this.copy()
  }

  toService(): Service.BooleanType {
    return new Service.BooleanType()
  }
}

export class EnumType implements TypeNode {
  cases: Entity[] = []

  static fromOpenApi(s: OpenApi.SchemaObject): [EnumType, ...Error[]] {
    const es: Error[] = []
    const t = new EnumType()

    if (!s.enum) {
      const e = new Error("The enum of the SchemaObject is missing")
      es.push(e)
    } else {
      const c = structuredClone(s)
      delete c.enum

      const [b, ...ne] = type(c)
      if (ne.length !== 0) {
        es.push(...ne)
      }

      for (const v of s.enum) {
        const e = new Entity()
        const l = new LiteralType()
        l.base = b
        l.const = new PassthroughConst()
        l.const.value = v
        e.type = l
        t.cases.push(e)
      }
    }

    return [t, ...es]
  }

  merge(b: TypeNode): EnumType {
    if (!(b instanceof EnumType)) {
      throw new TypeError("The EnumType cannot be merged with a different type")
    }

    const c = new EnumType()
    const t = new Map<unknown, Entity>()

    for (const y of this.cases) {
      if (!(y.type instanceof LiteralType)) {
        throw new TypeError("The type of the Entity is not a LiteralType")
      }
      if (!(y.type.const instanceof PassthroughConst)) {
        throw new TypeError("The const of the LiteralType is not a PassthroughConst")
      }
      t.set(y.type.const.value, y)
    }

    for (const y of b.cases) {
      if (!(y.type instanceof LiteralType)) {
        throw new TypeError("The type of the Entity is not a LiteralType")
      }
      if (!(y.type.const instanceof PassthroughConst)) {
        throw new TypeError("The const of the LiteralType is not a PassthroughConst")
      }
      if (!t.has(y.type.const.value)) {
        t.set(y.type.const.value, y)
      }
    }

    c.cases = [...t.values()]

    return c
  }

  copy(): EnumType {
    const c = new EnumType()
    c.cases = this.cases
    return c
  }

  resolve(c: Cache<Component>, s: State): EnumType {
    const t = this.copy()

    for (const [i, y] of t.cases.entries()) {
      t.cases[i] = y.resolve(c, s)
    }

    return t
  }

  normalize(): EnumType {
    const t = this.copy()

    for (const [i, y] of t.cases.entries()) {
      t.cases[i] = y.normalize()
    }

    return t
  }

  toService(): Service.EnumType {
    const t = new Service.EnumType()

    for (const c of this.cases) {
      const s = c.toService()
      t.cases.push(s)
    }

    return t
  }
}

export class ComplexType implements TypeNode {
  by: "allOf" | "anyOf" | "oneOf" | "" = ""
  entities: Entity[] = []

  static fromOpenApi(s: OpenApi.SchemaObject): [ComplexType, ...Error[]] {
    const es: Error[] = []
    const t = new ComplexType()

    let k: "allOf" | "anyOf" | "oneOf" | "" = ""
    let a: (OpenApi.SchemaObject | OpenApi.ReferenceObject)[] = []

    if (!s.allOf && !s.anyOf && !s.oneOf) {
      const e = new Error("The allOf, anyOf, or oneOf of the SchemaObject is missing")
      es.push(e)
    } else if (s.allOf) {
      k = "allOf"
      a = s.allOf
    } else if (s.anyOf) {
      k = "anyOf"
      a = s.anyOf
    } else if (s.oneOf) {
      k = "oneOf"
      a = s.oneOf
    }

    t.by = k

    for (const x of a) {
      const [e, ...ne] = Entity.fromOpenApi(x)
      if (ne.length !== 0) {
        es.push(...ne)
      }
      t.entities.push(e)
    }

    return [t, ...es]
  }

  merge(_: TypeNode): ComplexType {
    throw new Error("The ComplexType cannot be merged")
  }

  copy(): ComplexType {
    const t = new ComplexType()
    t.by = this.by
    t.entities = this.entities
    return t
  }

  resolve(c: Cache<Component>, s: State): ComplexType {
    const t = this.copy()

    for (const [i, y] of t.entities.entries()) {
      t.entities[i] = y.resolve(c, s)
    }

    return t
  }

  normalize(): ComplexType {
    const t = this.copy()

    for (const [i, y] of t.entities.entries()) {
      t.entities[i] = y.normalize()
    }

    return t
  }

  toService(): Service.ComplexType {
    const t = new Service.ComplexType()
    t.by = this.by

    for (const y of this.entities) {
      const s = y.toService()
      t.entities.push(s)
    }

    return t
  }
}

export class IntegerType implements TypeNode {
  static fromOpenApi(): [IntegerType, ...Error[]] {
    return [new IntegerType()]
  }

  merge(_: TypeNode): IntegerType {
    throw new Error("The IntegerType cannot be merged")
  }

  copy(): IntegerType {
    return new IntegerType()
  }

  resolve(_: Cache<Component>, __: State): IntegerType {
    return this.copy()
  }

  normalize(): IntegerType {
    return this.copy()
  }

  toService(): Service.IntegerType {
    return new Service.IntegerType()
  }
}

export class LiteralType implements TypeNode {
  base: Type = new NoopType()
  "const": Const = new NoopConst()

  merge(_: TypeNode): LiteralType {
    throw new Error("The LiteralType cannot be merged")
  }

  copy(): LiteralType {
    const c = new LiteralType()
    c.base = this.base
    c.const = this.const
    return c
  }

  resolve(_: Cache<Component>, __: State): LiteralType {
    return this.copy()
  }

  normalize(): LiteralType {
    return this.copy()
  }

  toService(): Service.LiteralType {
    const t = new Service.LiteralType()
    t.base = this.base.toService()
    t.const = this.const.toService()
    return t
  }
}

export class NoopType implements TypeNode {
  merge(_: TypeNode): NoopType {
    throw new Error("The NoopType cannot be merged")
  }

  copy(): NoopType {
    return new NoopType()
  }

  resolve(_: Cache<Component>, __: State): NoopType {
    return this.copy()
  }

  normalize(): NoopType {
    return this.copy()
  }

  toService(): Service.NoopType {
    return new Service.NoopType()
  }
}

export class NullType implements TypeNode {
  static fromOpenApi(): [NullType, ...Error[]] {
    return [new NullType()]
  }

  merge(_: TypeNode): NullType {
    throw new Error("The NullType cannot be merged")
  }

  copy(): NullType {
    return new NullType()
  }

  resolve(_: Cache<Component>, __: State): NullType {
    return this.copy()
  }

  normalize(): NullType {
    return this.copy()
  }

  toService(): Service.NullType {
    return new Service.NullType()
  }
}

export class NumberType implements TypeNode {
  static fromOpenApi(): [NumberType, ...Error[]] {
    return [new NumberType()]
  }

  merge(_: TypeNode): NumberType {
    throw new Error("The NumberType cannot be merged")
  }

  copy(): NumberType {
    return new NumberType()
  }

  resolve(_: Cache<Component>, __: State): NumberType {
    return this.copy()
  }

  normalize(): NumberType {
    return this.copy()
  }

  toService(): Service.NumberType {
    return new Service.NumberType()
  }
}

export class ObjectType implements TypeNode {
  properties: Property[] = []

  static fromOpenApi(s: OpenApi.NonArraySchemaObject): [ObjectType, ...Error[]] {
    const es: Error[] = []
    const t = new ObjectType()

    if (!s.properties) {
      const e = new Error("The properties of the NonArraySchemaObject is missing")
      es.push(e)
    } else {
      for (const [k, v] of Object.entries(s.properties)) {
        const [p, ...ne] = Property.fromOpenApi(v)
        if (ne.length !== 0) {
          es.push(...ne)
        }

        p.identifier = k

        if (s.required && s.required.includes(k)) {
          p.required = true
        }

        t.properties.push(p)
      }
    }

    return [t, ...es]
  }

  merge(b: TypeNode): ObjectType {
    if (!(b instanceof ObjectType)) {
      throw new TypeError("The ObjectType cannot be merged with a different type")
    }

    const c = new ObjectType()
    const t = new Map<string, Property>()

    for (const x of this.properties) {
      t.set(x.identifier, x)
    }

    for (const y of b.properties) {
      let x = t.get(y.identifier)
      if (!x) {
        x = y
      } else {
        x = x.merge(y)
      }
      t.set(x.identifier, x)
    }

    c.properties = [...t.values()]

    return c
  }

  copy(): ObjectType {
    const t = new ObjectType()
    t.properties = this.properties
    return t
  }

  resolve(c: Cache<Component>, s: State): ObjectType {
    const t = this.copy()

    for (const [i, p] of t.properties.entries()) {
      t.properties[i] = p.resolve(c, s)
    }

    return t
  }

  normalize(): ObjectType {
    const t = this.copy()

    for (const [i, p] of t.properties.entries()) {
      t.properties[i] = p.normalize()
    }

    return t
  }

  toService(): Service.ObjectType {
    const t = new Service.ObjectType()

    for (const p of this.properties) {
      const s = p.toService()
      t.properties.push(s)
    }

    return t
  }
}

export class StringType implements TypeNode {
  static fromOpenApi(): [StringType, ...Error[]] {
    return [new StringType()]
  }

  merge(_: TypeNode): StringType {
    throw new Error("The StringType cannot be merged")
  }

  copy(): StringType {
    return new StringType()
  }

  resolve(_: Cache<Component>, __: State): StringType {
    return this.copy()
  }

  normalize(): StringType {
    return this.copy()
  }

  toService(): Service.StringType {
    return new Service.StringType()
  }
}

export class UnionType implements TypeNode {
  types: Type[] = []

  static fromOpenApi(s: OpenApi.SchemaObject): [UnionType, ...Error[]] {
    const es: Error[] = []
    const t = new UnionType()

    if (!s.type) {
      const e = new Error("The type of the SchemaObject is missing")
      es.push(e)

      t.types = [new UnknownType()]
    } else if (!Array.isArray(s.type)) {
      const e = new Error("The type of the SchemaObject is not an array")
      es.push(e)

      t.types = [new UnknownType()]
    } else {
      const c = structuredClone(s)

      for (const v of s.type) {
        c.type = v

        const [n, ...ne] = type(c)
        if (ne.length !== 0) {
          es.push(...ne)
        }

        t.types.push(n)
      }
    }

    return [t, ...es]
  }

  merge(_: TypeNode): UnionType {
    throw new Error("The UnionType cannot be merged")
  }

  copy(): UnionType {
    const t = new UnionType()
    t.types = this.types
    return t
  }

  resolve(c: Cache<Component>, s: State): UnionType {
    const t = this.copy()

    for (const [i, u] of t.types.entries()) {
      t.types[i] = u.resolve(c, s)
    }

    return t
  }

  normalize(): UnionType {
    const t = this.copy()

    for (const [i, u] of t.types.entries()) {
      t.types[i] = u.normalize()
    }

    return t
  }

  toService(): Service.UnionType {
    const t = new Service.UnionType()

    for (const u of this.types) {
      const s = u.toService()
      t.types.push(s)
    }

    return t
  }
}

export class UnknownType implements TypeNode {
  merge(_: TypeNode): UnknownType {
    throw new Error("The UnknownType cannot be merged")
  }

  copy(): UnknownType {
    return new UnknownType()
  }

  resolve(_: Cache<Component>, __: State): UnknownType {
    return this.copy()
  }

  normalize(): UnknownType {
    return this.copy()
  }

  toService(): Service.UnknownType {
    return new Service.UnknownType()
  }
}

export interface TypeNode {
  merge(b: TypeNode): TypeNode
  copy(): TypeNode
  resolve(c: Cache<Component>, s: State): TypeNode
  normalize(): TypeNode
  toService(): Service.TypeNode
}

export type Reference = ReferenceMap[keyof ReferenceMap]

export interface ReferenceMap {
  circular: CircularReference
  direct: DirectReference
}

export class CircularReference {
  toService(): Service.CircularReference {
    return new Service.CircularReference()
  }
}

export class DirectReference {
  id = ""

  static fromOpenApi(s: OpenApi.ReferenceObject): [DirectReference, ...Error[]] {
    const r = new DirectReference()
    r.id = s.$ref
    return [r]
  }

  toService(): Service.Reference {
    throw new TypeError("The DirectReference cannot be converted")
  }
}

export class TagsCache implements Cache<OpenApi.TagObject> {
  indexes: Record<string, number> = {}
  list: OpenApi.TagObject[] = []

  add(t: OpenApi.TagObject): void {
    this.indexes[t.name] = this.list.length
    this.list.push(t)
  }

  retrieve(id: string): OpenApi.TagObject {
    const i = this.indexes[id]
    if (i === undefined) {
      throw new Error(`The tag '${id}' does not exist`)
    }

    const t = this.list[i]
    if (!t) {
      throw new Error(`The tag '${id}' is missing`)
    }

    return t
  }
}

export class ComponentsCache implements Cache<Component> {
  indexes: Record<string, number> = {}
  list: Component[] = []

  add(t: Component): void {
    this.indexes[t.id] = this.list.length
    this.list.push(t)
  }

  retrieve(id: string): Component {
    const i = this.indexes[id]
    if (i === undefined) {
      throw new Error(`The component '${id}' does not exist`)
    }

    const t = this.list[i]
    if (!t) {
      throw new Error(`The component '${id}' is missing`)
    }

    return t
  }
}

export class DeclarationsCache implements Cache<Service.Declaration> {
  #included: Record<string, string> = {}
  #excluded: Record<string, string> = {}

  indexes: Record<string, number> = {}
  list: Service.Declaration[] = []

  add(t: Service.Declaration): void {
    if (t instanceof Service.GroupDeclaration) {
      let p = ""
      let c = t

      while (c) {
        p = `${c.name}/${p}`

        let id = c.parent
        if (!id) {
          break
        }

        const e = this.#excluded[id]
        if (e) {
          id = e
        }

        const n = this.indexes[id]
        if (n === undefined) {
          throw new Error(`The group declaration '${id}' does not exists`)
        }

        const g = this.list[n]
        if (!g) {
          throw new Error(`The group declaration '${id}' is missing`)
        }
        if (!(g instanceof Service.GroupDeclaration)) {
          throw new TypeError(`The declaration '${g.id}' is not a GroupDeclaration`)
        }

        c = g
      }

      const id = this.#included[p]

      if (id) {
        const n = this.indexes[id]
        if (n === undefined) {
          throw new Error(`The group declaration '${id}' does not exists`)
        }

        const g = this.list[n]
        if (!g) {
          throw new Error(`The group declaration '${id}' is missing`)
        }
        if (!(g instanceof Service.GroupDeclaration)) {
          throw new TypeError(`The declaration '${id}' is not a GroupDeclaration`)
        }

        this.#excluded[t.id] = g.id
        return
      }

      this.#included[p] = t.id
    }

    const id = this.#excluded[t.parent]

    if (id) {
      const n = this.indexes[id]
      if (n === undefined) {
        throw new Error(`The group declaration '${id}' does not exists`)
      }

      const g = this.list[n]
      if (!g) {
        throw new Error(`The group declaration '${id}' is missing`)
      }
      if (!(g instanceof Service.GroupDeclaration)) {
        throw new TypeError(`The declaration '${id}' is not a GroupDeclaration`)
      }

      t.parent = g.id
      g.children.push(t.id)
    }

    this.indexes[t.id] = this.list.length
    this.list.push(t)
  }

  retrieve(id: string): Service.Declaration {
    const i = this.indexes[id]
    if (i === undefined) {
      throw new Error(`The declaration '${id}' does not exist`)
    }

    const t = this.list[i]
    if (!t) {
      throw new Error(`The declaration '${id}' is missing`)
    }

    return t
  }
}

export interface Cache<T> {
  indexes: Record<string, number>
  list: T[]
  add(t: T): void
  retrieve(id: string): T
}

export class State extends Array<string> {}
