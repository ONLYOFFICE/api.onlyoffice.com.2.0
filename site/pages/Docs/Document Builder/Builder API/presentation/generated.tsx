import {createData} from "@/generated/jsdoc.ts"
import {presentation} from "@/resources/document-builder.ts"

export function data() {
  return createData(presentation.list, presentation.retrieve)
}
