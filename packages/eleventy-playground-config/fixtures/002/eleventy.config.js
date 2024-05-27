/**
 * @typedef {import("@onlyoffice/eleventy-types").UserConfig} UserConfig
 */

import {eleventyPlaygroundConfig} from "../../lib/main.ts"

/**
 * @param {UserConfig} uc
 * @returns {unknown}
 */
function config(uc) {
  uc.addPlugin(eleventyPlaygroundConfig)
  return {dir: {data: "data"}}
}

// eslint-disable-next-line unicorn/prefer-module
module.exports = config
