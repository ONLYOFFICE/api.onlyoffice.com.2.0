// todo: migrate to the d.ts file

/**
 * @import {type Declaration} from "@onlyoffice/service-declaration"
 */

import {createRequire} from "node:module"

const require = createRequire(import.meta.url)

/** @type {Declaration[]} */
const d = require("")

/** @type {Record<string, number>} */
const m = require("")

/**
 * @returns {Declaration[]}
 */
export function list() {
  return d
}

/**
 * @param id {string}
 * @returns {Declaration | undefined}
 */
export function retrieve(id) {
  const i = m[id]
  if (i === undefined) {
    return undefined
  }
  return d[i]
}
