import {document} from "@/resources/document-builder.ts"
import {createData} from "@/generated/jsdoc.ts"

export function data() {
  return createData(document.list, document.retrieve)
}
