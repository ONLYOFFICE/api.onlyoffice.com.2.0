export interface Config {
  documentEditor?: DocumentEditor
}

export function config(): Config {
  return {
    documentEditor: undefined
  }
}

export interface DocumentEditor {
  documentServerURL?: string
  config?: Property[]
}

export function documentEditor(): DocumentEditor {
  return {
    documentServerURL: undefined,
    config: undefined
  }
}

export interface Property {
  path: string
  href: string
  type: "boolean" | "function" | "number" | "string"
  format?: "percent"
  cases?: (boolean | number | string)[]
  default?: boolean | number | string
}

export function property(t: "boolean" | "function" | "number" | "string"): Property {
  return {
    path: "",
    href: "",
    type: t,
    format: undefined,
    cases: undefined,
    default: undefined
  }
}

// todo
// export function merge(a: Config, b: Config): Config {
//   const de = mergeDocumentEditor(a.documentEditor, b.documentEditor)
//   return config(de)
// }
