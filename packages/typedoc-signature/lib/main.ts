import {GroupEntity} from "@onlyoffice/library-declaration/next.js"
import {
  isCallSignatureReflection,
  isClassReflection,
  isConstructorReflection,
  isEnumMemberReflection,
  isEnumReflection,
  isFunctionReflection,
  isInterfaceReflection,
  isMethodReflection,
  isPropertyReflection,
  isSignatureReflection,
  isTypeAliasReflection,
  isVariableReflection,
} from "@onlyoffice/typedoc-util-is-reflection"
import * as C from "./concise.ts"
import {Console} from "./console.ts"
import {type Context} from "./context.ts"
import {Formatter} from "./formatter.ts"
import {State} from "./state.ts"
import {type Transport} from "./transport.ts"
import * as V from "./verbose.ts"

const console = Console.shared

export function compute(ct: Transport): void {
  for (const e of ct.entities) {
    if (e instanceof GroupEntity) {
      continue
    }

    console.log(`Start computing the signature for ${e.declaration.name} id = ${e.id}`)

    let ft = ct.trailOf(e.declaration)
    if (!ft) {
      console.error(`Trail for ${e.declaration.name} id = ${e.id} not found`)
      continue
    }

    const t = ct.reflectionOf(ft)
    if (!t) {
      console.error(`Target for ${e.declaration.name} id = ${e.id} not found`)
      continue
    }

    ft = ft.slice(0, -1)
    const p = ct.reflectionOf(ft)
    if (!t) {
      console.error(`Parent for ${e.declaration.name} id = ${e.id} not found`)
      continue
    }

    const cf: Context = {
      s: new State(),
      f: new Formatter(),
      t: ct,
    }

    const f = e.declaration.parameters
    const v = e.declaration.signature.verbose
    const c = e.declaration.signature.concise
    const r = e.declaration.returns.signature.concise

    if (f.length !== 0) {
      C.fragments(cf, f)
    }

    if (isClassReflection(t)) {
      v.push(...V.classDeclaration(cf, t))
      c.push(...C.classDeclaration(cf, t))
    } else if (isConstructorReflection(p) && isSignatureReflection(t)) {
      v.push(...V.constructorDeclaration(cf, t))
      c.push(...C.constructorDeclaration(t))
    } else if (isEnumMemberReflection(t)) {
      v.push(...V.enumMemberReflection(cf, t))
      c.push(...C.enumMemberReflection(cf, t))
    } else if (isEnumReflection(t)) {
      v.push(...V.enumReflection(cf, t))
      c.push(...C.enumReflection(cf, t))
    } else if (isFunctionReflection(p) && isCallSignatureReflection(t)) {
      v.push(...V.functionsDeclaration(cf, t))
      c.push(...C.functionsDeclaration(cf, t))
      r.push(...C.returns(cf, t.type))
    } else if (isInterfaceReflection(t)) {
      v.push(...V.interfaceReflection(cf, t))
      c.push(...C.interfaceReflection(cf, t))
    } else if (isMethodReflection(p) && isCallSignatureReflection(t)) {
      v.push(...V.methodDeclaration(cf, t, p))
      c.push(...C.methodDeclaration(cf, t))
      r.push(...C.returns(cf, t.type))
    } else if (isPropertyReflection(t)) {
      v.push(...V.propertyReflection(cf, t))
      c.push(...C.propertyReflection(cf, t))
    } else if (isTypeAliasReflection(t)) {
      v.push(...V.typeAliasReflection(cf, t))
      c.push(...C.typeAliasReflection(cf, t))
    } else if (isVariableReflection(t)) {
      v.push(...V.variableDeclaration(cf, t))
      c.push(...C.variableDeclaration(cf, t))
    }

    e.declaration.signature.verbose = cf.f.format(e.declaration.signature.verbose)

    console.log(`Finish computing the signature for ${e.declaration.name} id = ${e.id}`)
  }
}
