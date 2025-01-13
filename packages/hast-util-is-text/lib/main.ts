import type * as T from "@onlyoffice/hastscript/texts.js"
import {type Text} from "hast"

export function isNewlineText(u: unknown): u is T.NewlineText {
  return isText(u) && u.value === "\n"
}

export function isText(u: unknown): u is Text {
  return Boolean(
    u &&
    typeof u === "object" &&
    "type" in u &&
    u.type === "text" &&
    "value" in u &&
    typeof u.value === "string",
  )
}
