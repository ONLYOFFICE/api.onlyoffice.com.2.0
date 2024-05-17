// todo: normalize naming of eleventy, remark, and other plugins.

import {eleventyClean} from "@onlyoffice/eleventy-clean"
import {eleventyStarryNight} from "@onlyoffice/eleventy-starry-night"
import {eleventyYAML} from "@onlyoffice/eleventy-yaml"
import {markupPlugin} from "./config/markup.ts"
import {navigationPlugin} from "./config/navigation.ts"
import {previewPlugin} from "./config/preview.ts"
import {scriptPlugin} from "./config/script.ts"
import {staticPlugin} from "./config/static.ts"
import {stylePlugin} from "./config/style.ts"

import type {Eleventy} from "./config/eleventy.ts"
import {eleventyPlugin as sitemapPlugin} from "./config/sitemap.ts"

function config(uc: Eleventy.UserConfig): unknown {
  uc.addPlugin(eleventyClean)
  uc.addPlugin(staticPlugin)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(stylePlugin)
  uc.addPlugin(scriptPlugin)
  uc.addPlugin(navigationPlugin)
  uc.addPlugin(eleventyStarryNight)
  uc.addPlugin(previewPlugin)

  uc.addPlugin(eleventyYAML)
  uc.addPlugin(sitemapPlugin)

  return {
    dir: {
      data: "data",
      includes: "components",
      input: ".",
      layouts: "layouts",
      output: "dist"
    }
  }
}

// Eleventy does not understand the default export.
module.exports = config
