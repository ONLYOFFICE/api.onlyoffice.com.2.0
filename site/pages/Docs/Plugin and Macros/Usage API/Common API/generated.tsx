import {createData} from "@/generated/jsdoc.ts"
import {pluginCommon} from "@/resources/document-builder.ts"

export function data() {
  return createData(pluginCommon.list, pluginCommon.retrieve)
}
