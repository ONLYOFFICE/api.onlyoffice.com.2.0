import {Resource as S} from "@onlyoffice/docspace-plugin-sdk-resource"
import {isBuild} from "@onlyoffice/eleventy-env"
import {Resource as F} from "@onlyoffice/fixture-resource/typedoc.js"

export const Resource = r()

type T = typeof S | typeof F
type I = T["shared"]

function r(): T {
  const T = t()
  f(T.shared)
  return T
}

function t(): T {
  if (isBuild()) {
    return S
  }
  return F
}

function f(r: I): void {
  const e = r.retrieve(0)

  if (e.type !== "declaration") {
    throw new Error(`Root entity must be a declaration: ${e.type}`)
  }

  e.declaration.name = "API"
}
