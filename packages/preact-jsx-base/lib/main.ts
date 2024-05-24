declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {}

      type JSXBase = JSX.IntrinsicElements extends {span: unknown}
        ? JSX.IntrinsicElements
        : Record<string, Record<string, unknown>>
    }
  }
}

export {}
