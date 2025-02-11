import {createRequire} from "node:module"
import {isBuild} from "@onlyoffice/eleventy-env"
import {type Resource} from "@onlyoffice/service-resource"

const require = createRequire(import.meta.url)

export const {list, retrieve} = resource("docspace-hosted-solutions")

function resource(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild()) {
    return `@onlyoffice/docspace-hosted-solutions-resource/${n}.ts`
  }
  return "@onlyoffice/openapi-resource-fixtures/resource.ts"
}
