import {createData} from "@/generated/jsdoc.ts"
import {pluginDocument} from "@/resources/document-builder.ts"

export function data() {
  return createData(pluginDocument.list, pluginDocument.retrieve)
}
