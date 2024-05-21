import {createRequire} from "node:module"
import type {Resource} from "@onlyoffice/library-resource"
import {isBuild, isPreview} from "../config/mode.ts"

const require = createRequire(import.meta.url)

export const document = resource("document")
export const form = resource("form")
export const presentation = resource("presentation")
export const spreadsheet = resource("spreadsheet")
export const pluginCommon = resource("plugin-common")
export const pluginDocument = resource("plugin-document")
export const pluginForm = resource("plugin-form")
export const pluginPresentation = resource("plugin-presentation")
export const pluginSpreadsheet = resource("plugin-spreadsheet")

function resource(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild() || isPreview()) {
    return `@onlyoffice/document-builder-resource/${n}.ts`
  }
  return "@onlyoffice/jsdoc-resource-fixtures/resource.ts"
}
