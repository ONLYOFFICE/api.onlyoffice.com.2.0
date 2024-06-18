import {createData} from "@/generated/jsdoc.ts"
import {form} from "@/resources/document-builder.ts"

export function data() {
  return createData(form.list, form.retrieve)
}
