// todo: migrate to the d.ts file

/**
 * @import {type Entity} from "@onlyoffice/library-declaration/next.js"
 */

import c from "./typedoc.json" with {type: "json"}

export class Resource {
  static shared = new Resource(c)

  /**
   * @type {Entity[]}
   */
  #c = []

  /**
   * @param {Entity[]} c
   */
  constructor(c) {
    this.#c = c
  }

  /**
   * @returns {Entity[]}
   */
  list() {
    return this.#c
  }

  /**
   * @param {number} id
   * @returns {Entity}
   */
  retrieve(id) {
    return this.#c[id]
  }
}
