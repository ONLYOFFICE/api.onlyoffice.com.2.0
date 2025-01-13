import {
  isContainerReflection,
  isDeclarationReflection,
  isSignatureReflection,
} from "@onlyoffice/typedoc-util-is-reflection"
import {isReflectionType} from "@onlyoffice/typedoc-util-is-type"
import {type JSONOutput as J} from "typedoc"

export type FlatTrail = number[]

export function resolveTrail(o: J.Reflection, t: FlatTrail): J.Reflection | undefined {
  let c: J.Reflection | undefined = o

  for (const s of t) {
    if (!c) {
      break
    }

    let t: J.Reflection[] = []

    if (isSignatureReflection(c) && c.parameters) {
      t = c.parameters
    }

    if (isDeclarationReflection(c) && isReflectionType(c.type)) {
      t = [c.type.declaration]
    }

    if (isDeclarationReflection(c) && c.signatures) {
      t = c.signatures
    }

    if (isContainerReflection(c) && c.children) {
      t = c.children
    }

    if (t.length !== 0) {
      c = t[s]
      continue
    }

    break
  }

  return c
}
