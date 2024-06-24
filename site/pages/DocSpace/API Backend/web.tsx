import type {Data} from "@onlyoffice/eleventy-types"
import * as g from "@/generations/service.ts"
import {web as r} from "@/resources/docspace.ts"

export function data(): Data {
  return g.data(r)
}
