/**
 * {@link https://www.11ty.dev/docs/config/ Eleventy Reference}
 */
export interface UserConfig {
  /**
   * {@link https://www.11ty.dev/docs/data-custom/ Eleventy Reference}
   */
  dataExtensions: Map<string, DataExtension>

  /**
   * {@link https://www.11ty.dev/docs/config/ Eleventy Reference}
   */
  dir: UserConfigDir

  /**
   * {@link https://www.11ty.dev/docs/data-global-custom/ Eleventy Reference}
   */
  globalData: GlobalData

  /**
   * {@link https://www.11ty.dev/docs/data-custom/ Eleventy Reference}
   */
  addDataExtension(extension: string, options: unknown): void

  /**
   * {@link https://www.11ty.dev/docs/languages/custom/ Eleventy Reference}
   */
  addExtension(extension: string, options: unknown): void

  /**
   * {@link https://www.11ty.dev/docs/data-global-custom/ Eleventy Reference}
   */
  addGlobalData(key: string, value: unknown): void

  /**
   * {@link https://www.11ty.dev/docs/plugins/ Eleventy Reference}
   */
  addPlugin(plugin: unknown): void

  /**
   * {@link https://www.11ty.dev/docs/languages/custom/ Eleventy Reference}
   */
  addTemplateFormats(formats: string): void

  /**
   * {@link https://www.11ty.dev/docs/events/ Eleventy Reference}
   */
  on(type: string, cb: unknown): void
}

/**
 * {@link https://www.11ty.dev/docs/data-custom/ Eleventy Reference}
 */
export interface DataExtension {
  extension: string
  parser(...args: unknown[]): unknown
  options: unknown
}

/**
 * {@link https://www.11ty.dev/docs/config/ Eleventy Reference}
 */
export interface UserConfigDir {
  input: string
  output: string
  data: string
}

/**
 * {@link https://www.11ty.dev/docs/data/ Eleventy Reference}
 */
export interface Data {
  /**
   * {@link https://www.11ty.dev/docs/collections/ Eleventy Reference}
   */
  tags?: string[]

  /**
   * {@link https://www.11ty.dev/docs/collections/#how-to-exclude-content-from-collections Eleventy Reference}
   */
  eleventyExcludeFromCollections?: boolean

  /**
   * {@link https://www.11ty.dev/docs/layouts/ Eleventy Reference}
   */
  layout?: string

  /**
   * {@link https://www.11ty.dev/docs/permalinks/ Eleventy Reference}
   */
  permalink?: string | ((data: Data) => string | undefined)

  /**
   * {@link https://www.11ty.dev/docs/pagination/ Eleventy Reference}
   */
  pagination?: Pagination

  /**
   * {@link https://www.11ty.dev/docs/data-computed/ Eleventy Reference}
   */
  eleventyComputed?: EleventyComputed

  /**
   * {@link https://www.11ty.dev/docs/data-eleventy-supplied/ Eleventy Reference}
   */
  page?: Page
}

/**
 * {@link https://www.11ty.dev/docs/pagination/ Eleventy Reference}
 */
export interface Pagination {
  data?: string
  size?: number
  addAllPagesToCollections?: boolean
}

/**
 * {@link https://www.11ty.dev/docs/data-computed/ Eleventy Reference}
 */
export interface EleventyComputed {
  [k: string]: unknown
}

/**
 * {@link https://www.11ty.dev/docs/data-global-custom/ Eleventy Reference}
 */
export interface GlobalData {}

/**
 * {@link https://www.11ty.dev/docs/data-eleventy-supplied/ Eleventy Reference}
 */
export interface Page {
  url: string
  fileSlug: string
  filePathStem: string
  date: Date
  inputPath: string
  outputPath: string
  outputFileExtension: string
  templateSyntax: string
}

/**
 * {@link https://www.11ty.dev/docs/data-eleventy-supplied/ Eleventy Reference}
 */
export interface Context {
  collections: Collections
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  content: any
}

export interface Collections {}
