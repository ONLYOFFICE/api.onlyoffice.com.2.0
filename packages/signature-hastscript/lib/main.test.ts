import {type Component, h, render} from "@onlyoffice/hastscript"
import {test} from "uvu"
import {equal as eq} from "uvu/assert"
import {Signature, SignatureReference} from "./main.ts"

test("Signature(): creates an empty signature", () => {
  const a = h(Signature)
  const e = h("pre", {class: "signature"}, [h("code")])
  re(a, e)
})

test("Signature(): creates a signature with a default variant", () => {
  const a = h(Signature, {variant: "default"})
  const e = h("pre", {class: "signature signature_variant_default"}, [h("code")])
  re(a, e)
})

test("Signature(): creates a signature with a block variant", () => {
  const a = h(Signature, {variant: "block"})
  const e = h("pre", {class: "signature signature_variant_block"}, [h("code")])
  re(a, e)
})

test("Signature(): creates a signature with an inline variant", () => {
  const a = h(Signature, {variant: "inline"})
  const e = h("code", {class: "signature signature_variant_inline"})
  re(a, e)
})

test("Signature(): creates a signature with an empty signature", () => {
  const a = h(Signature, {signature: []})
  const e = h("pre", {class: "signature"}, [h("code")])
  re(a, e)
})

test("Signature(): creates a signature with a non-empty signature", () => {
  const a = h(Signature, {
    signature: [
      {type: "entity", text: "e"},
      {type: "keyword", text: "k"},
      {type: "noop"},
      {type: "parameter", text: "p"},
      {type: "string", text: "s"},
      {type: "text", text: "t"},
      {type: "type", text: "t"},
      {id: "#", token: {type: "entity", text: "e"}},
    ],
  })
  const e = h("pre", {class: "signature"}, [
    h("code", [
      h("span", {class: "sg-en"}, ["e"]),
      h("span", {class: "sg-kw"}, ["k"]),
      h("span", {class: "sg-pm"}, ["p"]),
      h("span", {class: "sg-st"}, ["s"]),
      "t",
      h("span", {class: "sg-tp"}, ["t"]),
      h("span", {class: "sg-en"}, ["e"]),
    ]),
  ])
  re(a, e)
})

test("SignatureReference(): creates a signature with a reference", () => {
  const a = h(Signature, {
    signature: [
      {id: "#", token: {type: "entity", text: "e"}},
    ],
  }, [
    h(SignatureReference, [
      (p, ch) => h("a", {href: p.reference.id}, ch),
    ]),
  ])
  const e = h("pre", {class: "signature"}, [
    h("code", [
      h("a", {href: "#"}, [
        h("span", {class: "sg-en"}, ["e"]),
      ]),
    ]),
  ])
  re(a, e)
})

test.run()

function re(a: Component, e: Component): void {
  eq(render(a), render(e))
}
