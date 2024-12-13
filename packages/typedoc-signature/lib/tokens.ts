import {TextToken} from "@onlyoffice/signature"

export class NewlineToken extends TextToken {
  processed = false
  text = "_NEWLINE_"
}

export class IndentToken extends TextToken {
  processed = false
  text = "_INDENT_"
  indent: number
  constructor(i = 0) {
    super()
    this.indent = i
  }
}
