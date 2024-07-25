// todo: normalize naming of eleventy, remark, and other plugins.

import {cwd} from "node:process"
import {eleventyClean} from "@onlyoffice/eleventy-clean"
import {isBuild} from "@onlyoffice/eleventy-env"
import {eleventyEsbuild} from "@onlyoffice/eleventy-esbuild"
import {eleventyHtmlMinifierTerser} from "@onlyoffice/eleventy-html-minifier-terser"
import {eleventyPagefind} from "@onlyoffice/eleventy-pagefind"
import {eleventySitemap} from "@onlyoffice/eleventy-sitemap"
import {eleventyStarryNight} from "@onlyoffice/eleventy-starry-night"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {eleventyYAML} from "@onlyoffice/eleventy-yaml"
import {configMode} from "@onlyoffice/site-env"
import {Config} from "@onlyoffice/site-config"
import {markupPlugin} from "./config/markup.ts"
import {eleventyMarkdown} from "./internal/markdown.tsx"

function config(uc: UserConfig): unknown {
  Config.shared = Config.read(cwd(), configMode())

  uc.addPlugin(eleventyClean)
  uc.addPlugin(markupPlugin)
  uc.addPlugin(eleventyMarkdown)

  uc.addPlugin(eleventyHtmlMinifierTerser, {
    minify: isBuild(),
    collapseBooleanAttributes: true,
    collapseWhitespace: true,
    decodeEntities: true,
    includeAutoGeneratedTags: false,
    removeAttributeQuotes: true,
    removeComments: true,
    removeEmptyAttributes: true,
    sortAttributes: true,
  })

  uc.addPlugin(eleventyStarryNight)

  uc.addPlugin(eleventyYAML)
  uc.addPlugin(eleventySitemap)

  uc.addPlugin(eleventyEsbuild, () => {
    const c = Config.shared
    return {
      passthrough: {
        input: "assets/main.ts",
        target: "assets",
      },
      copy: {
        rename() {
          return "main.js"
        },
      },
      esbuild: {
        define: {
          "import.meta.env": JSON.stringify({
            DEV: !isBuild(),
            CONFIG_SERVER_BASE_URL: c.server.baseUrl,
          }),
        },
        format: "esm",
        minify: isBuild(),
        platform: "browser",
      },
    }
  })

  uc.addPlugin(eleventyPagefind)

  uc.addPassthroughCopy({static: "."})

  return {
    dir: {
      data: "data",
      includes: "../components",
      input: "pages",
      layouts: "../layouts",
      output: "dist"
    }
  }
}

// Eleventy does not understand the default export.
// eslint-disable-next-line unicorn/prefer-module
module.exports = config
