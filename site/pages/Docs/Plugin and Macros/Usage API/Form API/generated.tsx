import {createData} from "@/generated/jsdoc.ts"
import {pluginForm} from "@/resources/document-builder.ts"

export function data() {
  return createData(pluginForm.list, pluginForm.retrieve)
}
