import {Fragment, type JSX, h} from "preact"

export function FontsPreload(): JSX.Element {
  return <>
    {[
      "OpenSans-Bold.woff2",
      "OpenSans-Medium.woff2",
      "OpenSans-Regular.woff2",
      "OpenSans-SemiBold.woff2",
      "UbuntuMono-Bold.woff2",
      "UbuntuMono-Regular.woff2",
    ].map((f) => <link
      as="font"
      crossorigin=""
      href={`/${f}`}
      rel="preload"
      type="font/woff2"
    />)}
  </>
}
