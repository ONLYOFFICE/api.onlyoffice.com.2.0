import {type Data} from "@onlyoffice/eleventy-types"
import {Snapshot} from "@onlyoffice/snapshot"

export function data(): Data {
  return {
    layout: null,
    virtualPath: "../snapshot.schema.json",
    specificPath: "../snapshot.schema.json",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): string {
  return JSON.stringify(Snapshot.schema, null, 2)
}
