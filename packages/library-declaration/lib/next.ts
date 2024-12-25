import {type Signature} from "@onlyoffice/signature"

export type Entity = EntityMap[keyof EntityMap]

export interface EntityMap {
  group: GroupEntity
  declaration: DeclarationEntity
}

export class GroupEntity implements EntityNode {
  id = -1
  type = "group" as const
  parentId = -1
  children: number[] = []
  group = new Group()
}

export class DeclarationEntity implements EntityNode {
  id = -1
  type = "declaration" as const
  parentId = -1
  children: number[] = []
  declaration = new Declaration()
}

export interface EntityNode {
  id: number
  type: string
  parentId: number
  children: number[]
}

export class Group {
  name = ""
  description = ""
}

export type Definition = DefinitionMap[keyof DefinitionMap]

export interface DefinitionMap {
  declaration: Declaration
  fragment: Fragment
}

export class Declaration {
  name = ""
  signature = new DeclarationSignature()
  summary = ""
  description = ""
  parameters: Fragment[] = []
  returns = new DeclarationReturns()
  examples = ""
}

export class DeclarationSignature {
  concise: Signature = []
  verbose: Signature = []
}

export class DeclarationReturns {
  signature = new FragmentSignature()
  description = ""
}

export class Fragment {
  name = ""
  signature = new FragmentSignature()
  optional = false
  default = ""
  example = ""
  description = ""
}

export class FragmentSignature {
  concise: Signature = []
}
