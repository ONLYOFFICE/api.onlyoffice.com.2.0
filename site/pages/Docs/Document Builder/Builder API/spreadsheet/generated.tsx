import {createData} from "@/generated/jsdoc.ts"
import {spreadsheet} from "@/resources/document-builder.ts"

export function data() {
  return createData(spreadsheet.list, spreadsheet.retrieve)
}
