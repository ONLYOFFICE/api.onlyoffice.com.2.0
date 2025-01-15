import {starryNight} from "@onlyoffice/eleventy-starry-night"
import {type UserConfig} from "@onlyoffice/eleventy-types"
import {useSuspense} from "@onlyoffice/preact-suspense"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {rehypeClean} from "@onlyoffice/rehype-clean"
import {rehypeDescriptionList} from "@onlyoffice/rehype-description-list"
import {rehypeMetaobject} from "@onlyoffice/rehype-metaobject"
import {rehypeMetastring} from "@onlyoffice/rehype-metastring"
import {rehypeParameters} from "@onlyoffice/rehype-parameters"
import {rehypePreact} from "@onlyoffice/rehype-preact"
import {rehypeReferences} from "@onlyoffice/rehype-references"
import {rehypeSignature} from "@onlyoffice/rehype-signature"
import {rehypeStarryNight} from "@onlyoffice/rehype-starry-night"
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
import pack from "../package.json" with {type: "json"}
import {rehypeDocumentBuilderContainer} from "./document-builder-container.tsx"
import {rehypeImage} from "./image.tsx"
import {rehypeLink, resolveLink} from "./link.tsx"

declare module "@onlyoffice/eleventy-types" {
  interface Data {
    markdown?: MarkdownData
  }
}

export interface MarkdownData {}

export class MarkdownDatum implements MarkdownData {
  static fromVFile(_: VFile): MarkdownDatum {
    return new MarkdownDatum()
  }
}

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
      return async (data) => {
        const v = new VFile(c)
        v.path = f

        const m = markdown()

        const p = await m.process(v)

        if (p.messages.length !== 0) {
          const m = reporterPretty([p])
          warn(m)
        }

        data.markdown = MarkdownDatum.fromVFile(p)

        return p.result
      }
    },
  })

  uc.addGlobalData("markdown", () => {
    return new MarkdownDatum()
  })

  function warn(m: string): void {
    uc.logger.message(m, "warn", "yellow", false, `${pack.name}:markdown`)
  }
}

type MarkdownProcessor = Processor<Mdast.Root, Mdast.Root, Hast.Root, undefined, JSX.Element>

function markdown(): MarkdownProcessor {
  return unified()
    .use(remarkParse)
    .use(remarkGfm)
    .use(remarkRehype, {allowDangerousHtml: true})
    .use(rehypeDescriptionList)
    .use(rehypeMetastring)
    .use(rehypeRaw)
    .use(rehypeMetaobject)
    .use(rehypeSlug, {enableCustomId: true})
    .use(rehypeAutolink, {behavior: "wrap"})
    .use(rehypeLink)
    .use(rehypeImage)
    .use(rehypeSignature, {
      onLink(f, t) {
        return resolveLink(f.path, t.id)
      },
    })
    .use(rehypeStarryNight, starryNight)
    .use(rehypeDocumentBuilderContainer)
    .use(rehypeParameters)
    .use(rehypeReferences)
    .use(rehypeClean)
    .use(rehypePreact, {Fragment, jsx, jsxs})
    .freeze() as unknown as MarkdownProcessor
}
