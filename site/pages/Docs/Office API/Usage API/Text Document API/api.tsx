import {type Data} from "@onlyoffice/eleventy-types"
import * as g from "@/generations/library.ts"
import {word} from "@/resources/document-builder.ts"

export function data(): Data {
  return g.data(word)
}
