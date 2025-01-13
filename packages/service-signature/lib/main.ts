import {
  ArrayType,
  ComplexType,
  type Declaration,
  Entity,
  EnumType,
  ObjectType,
  OperationDeclaration,
  type Property,
  type Request,
  type Response,
  type Type,
} from "@onlyoffice/service-declaration"
import {normalize} from "@onlyoffice/signature/utils.js"
import {entity, request} from "./internal.ts"

export function computeDeclaration(d: Declaration): void {
  if (d instanceof OperationDeclaration) {
    computeRequest(d.request)
    for (const r of d.responses) {
      computeResponse(r)
    }
  }
}

export function computeRequest(r: Request): void {
  computeEntity(r.headerParameters)
  computeEntity(r.cookieParameters)
  computeEntity(r.pathParameters)
  computeEntity(r.queryParameters)
  computeEntity(r.bodyParameters)
  r.signature = request(r)
  r.signature = normalize(r.signature)
}

export function computeResponse(r: Response): void {
  computeEntity(r.body)
}

export function computeProperty(p: Property): void {
  if (p.self instanceof Entity) {
    computeEntity(p.self)
  }
}

export function computeEntity(e: Entity): void {
  computeType(e.type)
  e.signature = entity(e)
  e.signature = normalize(e.signature)
}

export function computeType(u: Type): void {
  if (u instanceof ArrayType) {
    if (u.items instanceof Entity) {
      computeEntity(u.items)
    }
    return
  }

  if (u instanceof ComplexType) {
    for (const e of u.entities) {
      computeEntity(e)
    }
    return
  }

  if (u instanceof EnumType) {
    for (const e of u.cases) {
      computeEntity(e)
    }
    return
  }

  // todo
  // if (u instanceof LiteralType) {
  //   computeType(u.base)
  //   return
  // }

  if (u instanceof ObjectType) {
    for (const p of u.properties) {
      computeProperty(p)
    }
  }

  // todo
  // if (u instanceof UnionType) {
  //   for (const t of u.types) {
  //     computeType(t)
  //   }
  // }
}
