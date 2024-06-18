import * as g from "@/generations/service.ts"
import {people as r} from "@/resources/docspace.ts"
import type {Data} from "@onlyoffice/eleventy-types"

export function data(): Data {
  return g.data(r)
}
