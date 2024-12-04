import {createRequire} from "node:module"
import {isBuild} from "@onlyoffice/eleventy-env"
import {type Resource, nop} from "@onlyoffice/service-resource"

const require = createRequire(import.meta.url)

export const apisystem = or("apisystem")
export const data = or("data")
export const files = op("files")
export const people = op("people")
export const web = op("web")

function or(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild()) {
    return `@onlyoffice/docspace-resource/${n}.ts`
  }
  return "@onlyoffice/openapi-resource-fixtures/resource.ts"
}

function op(n: string): Resource {
  if (isBuild()) {
    return require(`@onlyoffice/docspace-resource/${n}.ts`)
  }
  return nop()
}
