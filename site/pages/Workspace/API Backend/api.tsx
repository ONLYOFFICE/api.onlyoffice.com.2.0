import type {Data} from "@onlyoffice/eleventy-types"
import * as g from "@/generations/service.ts"
import * as r from "@/resources/community-server.ts"

export function data(): Data {
  return g.data(r)
}
