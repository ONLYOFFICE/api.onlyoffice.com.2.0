import {snapshot} from "@onlyoffice/eleventy-snapshot"
import {type Data} from "@onlyoffice/eleventy-types"

export function data(): Data {
  return {
    layout: null,
    virtualPath: "../snapshot.json",
    specificPath: "../snapshot.json",
    eleventyExcludeFromCollections: true,
  }
}

export function render(): string {
  return JSON.stringify(snapshot.toObject(), null, 2)
}
