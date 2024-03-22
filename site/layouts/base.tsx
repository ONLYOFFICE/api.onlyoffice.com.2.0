import { Font } from "@onlyoffice/documentation-ui-kit"
import { h, isValidElement } from "preact"
import { renderToString } from "preact-render-to-string"
import type { Eleventy } from "../config/types.ts"
import { transformMarkup } from "../config/markup.ts"

export async function render(
  {
    eleventy,
    title,
    description,
    content
  }: Eleventy.Context
): Promise<string> {
  // todo: explain. DO NOT DELETE THE HACK BELLOW!
  await new Promise((res) => {
    setTimeout(res, 0)
  })

  // todo: validate the context.
  // For example, if description is missing, print an error.

  // todo: cache it!
  // const regular = await buildRegularTheme()

  const base = (
    // todo: do not forget to change the lang after localization.
    <html
      lang="en"
      data-dark-theme="regular"
      data-light-theme="regular"
      data-theme-preference="auto"
    >
      <head>
        <meta charset="utf-8" />
        <title>{title}</title>

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="view-transition" content="same-origin" />
        <meta name="description" content={description} />
        <meta name="generator" content={eleventy.generator} />

        <Font.Links root="/" />

        <link rel="stylesheet" href="/main.css" />
        {/* <meta name="theme-color" media="(prefers-color-scheme: light)" content="#000000" /> */}
        {/* <meta name="theme-color" media="(prefers-color-scheme: dark)" content="#000000" /> */}
        {/* <style media="(prefers-color-scheme: dark)">{dark}</style> */}
        {/* <style media="(prefers-color-scheme: light)">{light}</style> */}
        {/* <style>{regular}</style> */}

        <script defer src="/main.js" />
      </head>
      <body>
        {content}
      </body>
    </html>
  )

  if (!isValidElement(base)) {
    throw new Error("Invalid element")
  }

  let c = "<!DOCTYPE html>\n" + renderToString(base)
  return transformMarkup(c)
}
