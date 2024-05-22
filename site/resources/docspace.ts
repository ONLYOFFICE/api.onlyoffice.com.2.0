import {createRequire} from "node:module"
import type {Resource} from "@onlyoffice/service-resource"
import {isBuild, isPreview} from "../config/mode.ts"

const require = createRequire(import.meta.url)

export const data = resource("data")
export const files = resource("files")
export const people = resource("people")
export const web = resource("web")

function resource(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild() || isPreview()) {
    return `@onlyoffice/docspace-resource/${n}.ts`
  }
  return "@onlyoffice/openapi-resource-fixtures/resource.ts"
}
