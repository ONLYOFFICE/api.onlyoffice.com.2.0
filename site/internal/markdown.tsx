import {starryNight} from "@onlyoffice/eleventy-starry-night"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {useSuspense} from "@onlyoffice/preact-suspense"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {rehypePreact} from "@onlyoffice/rehype-preact"
import {rehypeStarryNight} from "@onlyoffice/rehype-starry-night"
import {remarkDocumentBuilder} from "@onlyoffice/remark-document-builder"
import type * as Hast from "hast"
import type * as Mdast from "mdast"
import {Fragment, type JSX, h} from "preact"
import {jsx, jsxs} from "preact/jsx-runtime"
import rehypeAutolink from "rehype-autolink-headings"
import rehypeRaw from "rehype-raw"
import rehypeSlug from "rehype-slug-custom-id"
import remarkGfm from "remark-gfm"
import remarkParse from "remark-parse"
import remarkRehype from "remark-rehype"
import {type Processor, unified} from "unified"
import {VFile} from "vfile"
import {reporterPretty} from "vfile-reporter-pretty"
import {rehypeDocumentBuilderContainer} from "../components/document-builder-container/rehype.ts"
import pack from "../package.json" with {type: "json"}
import {rehypeImage} from "./image.tsx"
import {rehypeLink} from "./link.tsx"

export function Markdown(p: ChildrenIncludable): JSX.Element {
  let r: JSX.Element | null = null

  const c = p.children
  if (!c || typeof c !== "string") {
    return <></>
  }

  const Suspense = useSuspense(async () => {
    const m = markdown()
    const v = await m.process(c)
    r = v.result
  })

  return <Suspense>{() => r}</Suspense>
}

export function eleventyMarkdown(uc: UserConfig): void {
  uc.addTemplateFormats("md")
  uc.addExtension("md", {
    outputFileExtension: "html",
    compile(c, f) {
      return async () => {
        const v = new VFile(c)
        v.path = f

        const m = markdown()
        const d = await m.process(v)

        const r = await m.process(v)
        if (r.messages.length !== 0) {
          const p = reporterPretty([r])
          warn(p)
        }

        return d.result
      }
    },
  })

  function warn(m: string): void {
    uc.logger.message(m, "warn", "yellow", false, `${pack.name}:markdown`)
  }
}

type MarkdownProcessor = Processor<Mdast.Root, Mdast.Root, Hast.Root, undefined, JSX.Element>

function markdown(): MarkdownProcessor {
  return unified()
    .use(remarkParse)
    .use(remarkDocumentBuilder)
    .use(remarkGfm)
    .use(remarkRehype, {allowDangerousHtml: true})
    .use(rehypeRaw)
    .use(rehypeSlug, {enableCustomId: true})
    .use(rehypeAutolink, {behavior: "wrap"})
    .use(rehypeLink)
    .use(rehypeImage)
    .use(rehypeStarryNight, starryNight)
    .use(rehypeDocumentBuilderContainer)
    .use(rehypePreact, {Fragment, jsx, jsxs})
    .freeze() as unknown as MarkdownProcessor
}
