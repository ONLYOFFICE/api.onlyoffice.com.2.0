import {basename, dirname, extname, join} from "node:path"
import type {Context, Data} from "@onlyoffice/eleventy-types"
import {
  type HomePartParameters,
  Home,
  HomeHero,
  HomeIn,
  HomeLink,
  HomeLinks,
  HomePart,
  HomePreview
} from "@onlyoffice/site-home"
import * as icons from "@onlyoffice/ui-icons/rich/32.tsx"
import {CodePreview} from "@onlyoffice/ui-code-preview"
import {type JSX, h} from "preact"
import {SyntaxHighlight} from "@/components/syntax-highlight/syntax-highlight.ts"

import eleventyImage from "@11ty/eleventy-img"
import {useSuspense} from "@/components/suspense.tsx"
import type {HTMLAttributes} from "preact/compat"

export function data(): Data {
  return {
    title: "Welcome to ONLYOFFICE API",
    layout: "page"
  }
}

export function render({collections}: Context): JSX.Element {
  return <Home>
    <HomeHero>
      <h1>Welcome to ONLYOFFICE API</h1>
    </HomeHero>
    {collections.navigation.map((item, i) => {
      return <HomePart key={i} variant={variant()}>
        <HomeIn>
          <h2><a href={item.link}>{item.title}</a></h2>
          <p>{item.summary}</p>
          <a href={item.link}>More</a>
          <HomeLinks>
            {item.children.map((item, i) => <HomeLink key={i}>
              <Icon name={item.icon} height={32} width={32} />
              <a href={item.link}>{item.title}</a>
            </HomeLink>)}
          </HomeLinks>
        </HomeIn>
        <HomePreview>
          <a href={item.link} title={item.title}></a>
          <EleventyPicture class={cls()} src={src()} />
          <CodePreview>
            <pre><code><SyntaxHighlight syntax={item.sample.syntax}>
              {item.sample.code}
            </SyntaxHighlight></code></pre>
          </CodePreview>
        </HomePreview>
      </HomePart>

      function variant(): HomePartParameters["variant"] {
        if (i % 2 === 0) {
          return "default"
        }
        return "reverse"
      }

      function Icon({...props}): JSX.Element {
        const Icon = icons[props.name]
        delete props.name
        return <Icon {...props} />
      }

      function cls(): string {
        const e = extname(item.preview)
        return basename(item.preview, e)
      }

      function src(): string {
        const d = dirname(item.file)
        return join(d, item.preview)
      }
    })}
  </Home>
}

interface EleventyPictureParameters extends HTMLAttributes<HTMLImageElement> {}

function EleventyPicture({
  alt,
  class: cls,
  decoding = "async",
  loading = "lazy",
  src
}: EleventyPictureParameters): JSX.Element {
  let d: any

  const Suspense = useSuspense(async () => {
    const o = {
      formats: ["webp"],
      urlPath: "/assets/",
      outputDir: "dist/assets/",
      filenameFormat(id: string, s: string, w: number, f: string) {
        const e = extname(s)
        const n = basename(s, e)
        return `${n}-${w}w-${id}.${f}`
      }
    }

    const e = extname(src)
    if (e === ".svg") {
      o.formats = ["svg"]
    }

    const s = await eleventyImage(src, o)

    if (s.svg) {
      d = s.svg[0]
    } else {
      d = s.webp[0]
    }
  })

  return <Suspense><Suspender /></Suspense>

  function Suspender(): JSX.Element {
    return <picture>
      <source type={d.sourceType} srcset={d.srcset} />
      <img
        class={cls}
        alt={alt}
        aria-hidden={true}
        decoding={decoding}
        height={d.height}
        loading={loading}
        src={d.url}
        width={d.width}
      />
    </picture>
  }
}
