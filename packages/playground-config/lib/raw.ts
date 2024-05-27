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

export function merge(a: Config, b: Config): Config {
  const c = config()

  let de: DocumentEditor | undefined
  if (a.documentEditor && b.documentEditor) {
    de = mergeDocumentEditor(a.documentEditor, b.documentEditor)
  } else if (a.documentEditor) {
    de = a.documentEditor
  } else if (b.documentEditor) {
    de = b.documentEditor
  }
  if (de) {
    c.documentEditor = de
  }

  return c
}

function mergeDocumentEditor(a: DocumentEditor, b: DocumentEditor): DocumentEditor {
  const de = documentEditor()
  de.documentServerURL = a.documentServerURL
  if (b.documentServerURL !== "") {
    de.documentServerURL = b.documentServerURL
  }
  // todo?: support merging other properties
  de.config = a.config
  return de
}
