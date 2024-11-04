import {type Text as HastText} from "hast"

export interface TextParis {
  "\n": "newline"
}

export type NewlineText = Text<"\n">

export interface Text<V extends keyof TextParis> extends HastText {
  value: V
}
