import {isCodeElement, isPreElement} from "@onlyoffice/hast-util-is-element"
import {isText} from "@onlyoffice/hast-util-is-text"
import {Fragment as F, h, render} from "@onlyoffice/hastscript"
import {type Reference} from "@onlyoffice/signature"
import {
  Signature,
  type SignaturePropertiesBase,
  SignatureReference,
  type SignatureVariant,
} from "@onlyoffice/signature-hastscript"
import {type Element, type Root} from "hast"
import {visit} from "unist-util-visit"
import {type VFile} from "vfile"
import yaml from "yaml"

declare module "hast" {
  interface Metaobject {
    signature?: MetaobjectSignature
  }
}

export interface MetaobjectSignature {
  variant?: SignatureVariant
}

export interface RehypeSignatureParameters {
  onLink(this: void, f: VFile, t: Reference): string
}

export interface RehypeSignatureTransform {
  (t: Root, f: VFile): void
}

export function rehypeSignature(
  p: RehypeSignatureParameters,
): RehypeSignatureTransform {
  const {onLink} = p

  return function transform(t, f) {
    visit(t, "element", (n, i, p) => {
      if (!p || i === undefined || !isPreElement(n)) {
        return
      }

      const [c] = n.children
      if (!isCodeElement(c)) {
        return
      }

      const [t] = c.children
      if (!isText(t)) {
        return
      }

      const m = c.properties.metaobject
      if (!m) {
        return
      }

      const y = language(c)
      if (!isYaml(y)) {
        return
      }

      const b: SignaturePropertiesBase = {
        signature: [],
      }

      if (m.signature) {
        b.variant = m.signature.variant
      }

      // Should the error be wrapped here?
      b.signature = yaml.parse(t.value)

      // Here, many things that could be attached to a node are lost, such as
      // metastring, metaobject, classes, and so on. Is this a bug or a feature?
      p.children[i] = render(
        h(Signature, b, [
          h(SignatureReference, [
            (p, ch) => {
              const u = onLink(f, p.reference)
              if (!u) {
                return h(F, ch)
              }
              return h("a", {href: u}, ch)
            },
          ]),
        ]),
      )
    })
  }
}

function isYaml(u: unknown): u is string {
  return typeof u === "string" && (u === "yml" || u === "yaml")
}

function language(n: Element): string {
  const c = n.properties.className
  if (!Array.isArray(c)) {
    return ""
  }

  for (const s of c) {
    if (typeof s === "string" && s.startsWith("language-")) {
      return s.slice(9)
    }
  }

  return ""
}
