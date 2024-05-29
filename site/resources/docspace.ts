import {createRequire} from "node:module"
import type {Resource} from "@onlyoffice/service-resource"
import {nop} from "@onlyoffice/service-resource"
import {isBuild, isPreview} from "../config/mode.ts"

const require = createRequire(import.meta.url)

export const data = or("data")
export const files = op("files")
export const people = op("people")
export const web = op("web")

function or(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild() || isPreview()) {
    return `@onlyoffice/docspace-resource/${n}.ts`
  }
  return "@onlyoffice/openapi-resource-fixtures/resource.ts"
}

function op(n: string): Resource {
  if (isBuild() || isPreview()) {
    return require(`@onlyoffice/docspace-resource/${n}.ts`)
  }
  return nop()
}
