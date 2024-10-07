import {type Metadata, generateObject} from "@11ty/eleventy-img"
import {Fragment, type JSX, h} from "preact"

export interface ImageAttributes {
  alt: string
}

export function toJsxRuntime(m: Metadata, a: ImageAttributes): JSX.Element {
  const o = generateObject(m, a)

  if ("picture" in o) {
    return <picture>
      {o.picture.map((e) => <>
        {"source" in e && <source {...e.source} />}
        {"img" in e && <img {...a} {...e.img} />}
      </>)}
    </picture>
  }

  if ("img" in o) {
    return <img {...a} {...o.img} />
  }

  throw new Error("Unexpected return value.")
}
