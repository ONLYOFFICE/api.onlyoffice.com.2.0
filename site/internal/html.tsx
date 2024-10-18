import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {Config} from "@onlyoffice/site-config"
import {FontsPreload} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {GoogleTagManagerNoscript, GoogleTagManagerScript} from "./google-tag-manager.tsx"
import {Script} from "./script.tsx"
import {Style} from "./style.tsx"

export interface HtmlProperties extends ChildrenIncludable {
  title: string
  description: string
  generator: string
}

export function Html(p: HtmlProperties): JSX.Element {
  const c = Config.shared

  return <html
    lang="en"
    data-dark-theme="regular"
    data-light-theme="regular"
    data-theme-preference="auto"
  >
    <head>
      <meta charset="utf-8" />
      <title>{p.title}</title>
      <meta name="viewport" content="width=device-width,initial-scale=1" />
      <meta name="view-transition" content="same-origin" />
      <meta name="description" content={p.description} />
      <meta name="generator" content={p.generator} />
      <link rel="icon" href="/favicon.ico" sizes="any" />
      <link rel="icon" href="/favicon.svg" type="image/svg+xml" />
      <link rel="apple-touch-icon" href="/favicon.png" />
      <FontsPreload />
      {c.analytics && <GoogleTagManagerScript />}
      <Style href="/assets/main.css" />
      <Script async src="/assets/prerender.js" inline />
      <Script defer src="/assets/main.ts" />
    </head>
    <body>
      {c.analytics && <GoogleTagManagerNoscript />}
      {p.children}
    </body>
  </html>
}
