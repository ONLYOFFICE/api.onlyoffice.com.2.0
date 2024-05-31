/**
 * @typedef {import("@onlyoffice/eleventy-types").UserConfig} UserConfig
 */

import {eleventySiteConfig} from "../../lib/main.ts"

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.addPlugin(eleventySiteConfig, "production")
}

module.exports = config
