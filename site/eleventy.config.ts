/* eslint-disable import/no-import-module-exports */

import {tmpdir} from "node:os"
import {cwd} from "node:process"
import {eleventyClean} from "@onlyoffice/eleventy-clean"
import {isBuild} from "@onlyoffice/eleventy-env"
import {eleventyHtmlMinifierTerser} from "@onlyoffice/eleventy-html-minifier-terser"
import {eleventyPagefind} from "@onlyoffice/eleventy-pagefind"
import {eleventySnapshot} from "@onlyoffice/eleventy-snapshot"
import {eleventyStarryNight} from "@onlyoffice/eleventy-starry-night"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {Config} from "@onlyoffice/site-config"
import {configMode} from "@onlyoffice/site-env"
import esbuild from "esbuild"
import requireFromString from "require-from-string"
import {eleventyImage} from "./internal/image.tsx"
import {eleventyMarkdown} from "./internal/markdown.tsx"
import {eleventySitemap} from "./internal/sitemap.ts"
import {eleventyUrl} from "./internal/url.ts"

function config(uc: UserConfig): unknown {
  Config.shared = Config.read(cwd(), configMode())

  uc.setServerPassthroughCopyBehavior("passthrough")

  uc.addPlugin(eleventyClean)
  uc.addPlugin(eleventySnapshot)

  // https://github.com/11ty/eleventy/issues/235
  uc.addTemplateFormats("11ty.js")
  uc.addExtension("tsx", {key: "11ty.js"})

  // https://github.com/11ty/eleventy/issues/577#issuecomment-2145656296
  uc.setDataFileSuffixes([".data"])
  uc.addDataExtension("ts", {
    async parser(_, f) {
      const r = await esbuild.build({
        entryPoints: [f],
        format: "cjs",
        outdir: tmpdir(),
        write: false,
      })
      const m = requireFromString(r.outputFiles[0].text)
      return m.data()
    },
  })

  uc.addPlugin(eleventyImage)
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

  uc.addPlugin(eleventyUrl)
  uc.addPlugin(eleventyStarryNight)
  uc.addPlugin(eleventySitemap)
  uc.addPlugin(eleventyPagefind)

  uc.addPassthroughCopy({
    "node_modules/@onlyoffice/ui-kit/node_modules/@onlyoffice/ui-fonts/dist/*.woff": ".",
    "node_modules/@onlyoffice/ui-kit/node_modules/@onlyoffice/ui-fonts/dist/*.woff2": ".",
    "static": ".",
  })

  return {
    dir: {
      data: "data",
      includes: "../components",
      input: "pages",
      layouts: "../layouts",
      output: "dist",
    },
  }
}

// Eleventy does not understand the default export.
// eslint-disable-next-line unicorn/prefer-module
module.exports = config
