import {createRequire} from "node:module"
import type {Resource} from "@onlyoffice/service-resource"
import {isBuild, isPreview} from "../config/mode.ts"

const require = createRequire(import.meta.url)

const {list, resolve} = resource("docspace-hosted-solutions")
export {list, resolve}

function resource(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild() || isPreview()) {
    return `@onlyoffice/docspace-hosted-solutions-resource/${n}.ts`
  }
  return "@onlyoffice/openapi-resource-fixtures/resource.ts"
}
