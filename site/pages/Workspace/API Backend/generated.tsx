import * as g from "@/generations/service.ts"
import * as r from "@/resources/community-server.ts"
import type {Data} from "@onlyoffice/eleventy-types"

export function data(): Data {
  return g.data(r)
}
