export type Signature = (Token | Reference)[]

export type Token = TokenMap[keyof TokenMap]

export interface TokenMap {
  entity: EntityToken
  keyword: KeywordToken
  noop: NoopToken
  parameter: ParameterToken
  string: StringToken
  text: TextToken
  type: TypeToken
}

export class EntityToken implements TokenNode {
  type = "entity" as const
  text = ""
}

export class KeywordToken implements TokenNode {
  type = "keyword" as const
  text = ""
}

export class NoopToken implements TokenNode {
  type = "noop" as const
}

export class ParameterToken implements TokenNode {
  type = "parameter" as const
  text = ""
}

export class StringToken implements TokenNode {
  type = "string" as const
  text = ""
}

export class TextToken implements TokenNode {
  type = "text" as const
  text = ""
}

export class TypeToken implements TokenNode {
  type = "type" as const
  text = ""
}

export interface TokenNode {
  type: string
}

export class Reference {
  id = ""
  token: Token = new NoopToken()
}
