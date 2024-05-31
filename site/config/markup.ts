import { tmpdir } from "node:os"
import type { UserConfig } from "@11ty/eleventy"
import { build } from "esbuild"
import htmlMinifier from "html-minifier-terser"
import { fromMarkdown } from "mdast-util-from-markdown"
import { toMarkdown } from "mdast-util-to-markdown"
import { isValidElement } from "preact"
import { render } from "preact-render-to-string"
import requireFromString from "require-from-string"
import { read } from "to-vfile"
import { matter } from "vfile-matter"
import { isBuild, isPreview } from "./mode.ts"

import {rehypePlugin as rehypeImage} from "../components/image/image.config.ts"
import remarkGFM from "remark-gfm"

import {starryNight} from "@onlyoffice/eleventy-starry-night"
import {rehypeStarryNight} from "@onlyoffice/rehype-starry-night"

import rehypeSlug from "rehype-slug"
import rehypeAutolink from "rehype-autolink-headings"
import {env} from "node:process"

import {remarkDocumentBuilder} from "@onlyoffice/remark-document-builder"
import {rehypeDocumentBuilderContainer} from "../components/document-builder-container/rehype.ts"

// todo: temp
// const doSkip = env.SKIP_REMOTE === "true"
const doSkip = true

// todo: refactor it.
// add support for hot reload
// profile memory usage

export function markupPlugin(uc: UserConfig): void {
  // https://github.com/11ty/eleventy/issues/235
  uc.addTemplateFormats("11ty.js")
  uc.addExtension("tsx", {
    key: "11ty.js"
  })

  uc.setDataFileSuffixes([".data"])
  uc.addDataExtension("ts", {
    // read: false,
    async parser(_: string, f: string) {
      const r = await build({
        entryPoints: [f],
        format: "cjs",
        // bundle: true,
        outdir: tmpdir(),
        write: false,
        plugins: [
        //   {
        //     name: "fix-slugify",
        //     setup(build) {
        //       console.log("setup")
        //       build.onResolve({ filter: /^@sindresorhus\/slugify$/ }, () => {
        //         console.log("here")
        //         return { path: require.resolve("@sindresorhus/slugify") }
        //       })
        //     }
        //   }
        ]
      })
      const m = requireFromString(r.outputFiles[0].text)
      return m.data()
    }
  })

  // https://github.com/11ty/eleventy/issues/636
  uc.addTemplateFormats("mdx")
  uc.addExtension("mdx", {
    // Do not delete the property bellow.
    outputFileExtension: "html",
    // read: false,
    compile(_: string, f: string) {
      return async (data) => {
        const { compile } = await import("@mdx-js/mdx")
        const r = await build({
          entryPoints: [f],
          format: "cjs",
          // bundle: true,
          outdir: tmpdir(),
          write: false,
          plugins: [
            {
              name: "mdx",
              setup(build) {
                build.onLoad({ filter: /\.mdx?$/ }, async (...a) => {
                  // todo: explain why this lib
                  // because vfile is already a third-party dependency.
                  // https://www.npmjs.com/package/gray-matter
                  let vf = await read(f)

                  // todo: wrap front matter to a function which attach defaults at first
                  // take defaults from the page.11tydata.cjs
                  // or create `config/frontmatter` and take defaults from there
                  matter(vf, { strip: true })

                  // todo: cache it
                  // todo: support assets
                  // todo: support relative links
                  // todo: move to config/remote
                  if (!doSkip && vf.data.matter.remote !== undefined) {
                    if (!isGitHubURL(vf.data.matter.remote)) {
                      throw new Error("Invalid remote URL")
                    }
                    vf.value = await fetchGitHubContent(vf.data.matter.remote)
                    const t = fromMarkdown(vf.value)
                    const i = t.children.findIndex((e) => e.type === "heading" && e.depth === 1)
                    if (i !== -1) {
                      t.children.splice(i, 1)
                    }
                    // t.children = t.children.flatMap((e) => {
                    //   if (e.type === "html") {
                    //     const r = e.value.match(markerExpression)
                    //     if (r !== null) {
                    //       return []
                    //     }
                    //   }
                    //   return e
                    // })
                    vf.value = toMarkdown(t, {
                      handlers: {
                        html(node) {
                          if (vf.data.matter.remote === "https://github.com/ONLYOFFICE/onlyoffice-redmine/blob/main/README.md/") {
                            const r = node.value.match(markerExpression)
                            if (r !== null) {
                              node.type = "text"
                              node.value = ""
                            }
                          }
                          return node.value
                        }
                      }
                    })
                  }

                  vf = await compile(vf, {
                    jsxImportSource: "preact",
                    rehypePlugins: [
                      rehypeSlug,
                      [rehypeAutolink, {behavior: "wrap"}],
                      rehypeImage,
                      [rehypeStarryNight, starryNight],
                      rehypeDocumentBuilderContainer
                    ],
                    remarkPlugins: [
                      remarkDocumentBuilder,
                      remarkGFM
                    ]
                  })

                  return {
                    contents: vf.value
                  }
                })
              }
            }
          ]
        })

        // todo: huh?
        // const _t = Buffer.from(r.outputFiles[0].text).toString("base64")
        // console.log(_t, r.outputFiles[0].text)
        // const u = await import(`data:text/javascript;base64,${_t}`)
        // console.log(u)

        const m = requireFromString(r.outputFiles[0].text)
        const p = m.default()
        if (isValidElement(p)) {
          if (data.layout && data.layout.endsWith(".tsx")) {
            return p
          }
          return render(p)
        }
        console.log(data.page)
        console.log("warn")
        return ""
      }
    }
  })
}

/**
 * @param c The markup to be transformed.
 * @returns The transformed markup.
 */
export async function transformMarkup(c: string): Promise<string> {
  const minify = isBuild() || isPreview()
  if (!minify) {
    return c
  }
  return htmlMinifier.minify(c, {
    collapseBooleanAttributes: true,
    collapseWhitespace: true,
    decodeEntities: true,
    includeAutoGeneratedTags: false,
    removeAttributeQuotes: true,
    removeComments: true,
    removeEmptyAttributes: true,
    removeRedundantAttributes: true,
    sortAttributes: true
  })
}

// https://github.com/syntax-tree/mdast-comment-marker/blob/44e67df88bf51ed2d80f6c54aedde7393ad8edff/lib/index.js#L32
const commentExpression = /\s*([a-zA-Z\d-]+)(\s+([\s\S]*))?\s*/
const markerExpression = new RegExp(
  '(\\s*<!--' + commentExpression.source + '-->\\s*)'
)

// todo: move to config/remote

function isGitHubURL(u: string): boolean {
  const o = new URL(u)
  return o.origin === "http://github.com" || o.origin === "https://github.com"
}

async function fetchGitHubContent(u: string): Promise<string> {
  const o = new URL(u)
  const [, owner, repo, blob, ref, ...path] = o.pathname.split("/")
  if (blob !== "blob") {
    throw new Error("Not a blob URL")
  }
  let p = path.join("/")
  if (p.endsWith("/")) {
    p = p.slice(0, -1)
  }
  u = `https://raw.githubusercontent.com/${owner}/${repo}/${ref}/${p}`
  const res = await fetch(u)
  if (res.status !== 200) {
    throw new Error("Failed to fetch GitHub content")
  }
  return await res.text()
}
