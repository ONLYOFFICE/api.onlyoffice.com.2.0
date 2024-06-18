import {createData} from "@/generated/jsdoc.ts"
import {pluginPresentation} from "@/resources/document-builder.ts"

export function data() {
  return createData(pluginPresentation.list, pluginPresentation.retrieve)
}
