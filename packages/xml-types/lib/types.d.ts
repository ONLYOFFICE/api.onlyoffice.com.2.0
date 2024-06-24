declare global {
  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        lastmod: IntrinsicElements["span"]
        loc: IntrinsicElements["span"]
        url: IntrinsicElements["span"]
        urlset: IntrinsicElements["span"] & {xmlns?: string}
      }
    }
  }
}

export {}
