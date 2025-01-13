import {createRequire} from "node:module"
import {isBuild} from "@onlyoffice/eleventy-env"
import {type Resource} from "@onlyoffice/library-resource"

const require = createRequire(import.meta.url)

export const word = resource("word")
export const form = resource("form")
export const slide = resource("slide")
export const cell = resource("cell")
export const pluginCommon = resource("plugin-common")
export const pluginWord = resource("plugin-word")
export const pluginForm = resource("plugin-form")
export const pluginSlide = resource("plugin-slide")
export const pluginCell = resource("plugin-cell")

function resource(n: string): Resource {
  const f = file(n)
  return require(f)
}

function file(n: string): string {
  if (isBuild()) {
    return `@onlyoffice/document-builder-resource/${n}.js`
  }
  return "@onlyoffice/jsdoc-resource-fixtures/resource.js"
}
