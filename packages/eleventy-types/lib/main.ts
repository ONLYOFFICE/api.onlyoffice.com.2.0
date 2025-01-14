// todo: write multiple interfaces for data cascade
// todo: move types to the @types/11ty__eleventy package

import type copy from "recursive-copy"

// todo: https://github.com/timkendrick/recursive-copy/pull/45/
export type RecursiveCopyOptions = Exclude<Parameters<typeof copy.default extends {
  (s: string, d: string, o?: infer O): unknown
  (s: string, d: string, c: (e: Error | null, r?: unknown[]) => void): unknown
} ? (s: string, d: string, o?: O) => unknown : never>[2], undefined>

/**
 * {@link https://github.com/11ty/eleventy/blob/v2.0.1/src/TemplateCollection.js/#L5 Eleventy Reference}
 */
export interface TemplateCollection {
  getAll(): Template[]
}

/**
 * {@link https://github.com/11ty/eleventy/blob/v2.0.1/src/Template.js#/L35 Eleventy Reference}
 */
export interface Template {
  data: Data
  outputPath: string
  url: string
  date: Date
}

/**
 * {@link https://www.11ty.dev/docs/config/ Eleventy Reference}
 */
export interface UserConfig {
  logger: ConsoleLogger

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
   * {@link https://www.11ty.dev/docs/collections/ Eleventy Reference}
   */
  addCollection(name: string, callback: (template: TemplateCollection) => unknown[]): void

  /**
   * {@link https://www.11ty.dev/docs/data-custom/ Eleventy Reference}
   */
  addDataExtension(extension: string, options: DataExtensionOptions): void

  /**
   * {@link https://www.11ty.dev/docs/languages/custom/ Eleventy Reference}
   */
  addExtension(extension: string, options: ExtensionOptions): void

  /**
   * {@link https://www.11ty.dev/docs/data-global-custom/ Eleventy Reference}
   */
  addGlobalData(key: string, value: unknown): void

  /**
   * {@link https://www.11ty.dev/docs/plugins/ Eleventy Reference}
   */
  addPlugin(plugin: unknown, ...a: unknown[]): void

  /**
   * {@link https://www.11ty.dev/docs/languages/custom/ Eleventy Reference}
   */
  addTemplateFormats(formats: string): void

  /**
   * {@link https://www.11ty.dev/docs/copy/ Eleventy Reference}
   */
  addPassthroughCopy(input: string | Record<string, string>, copy?: RecursiveCopyOptions): void

  /**
   * {@link https://www.11ty.dev/docs/transforms/ Eleventy Reference}
   */
  addTransform(name: string, callback: (content: unknown, file: string) => unknown): void

  /**
   * {@link https://www.11ty.dev/docs/config/#change-file-suffix-for-data-files Eleventy Reference}
   */
  setDataFileSuffixes(suffixes: string[]): void

  /**
   * {@link https://www.11ty.dev/docs/events/ Eleventy Reference}
   */
  on(type: string, cb: (context: EventContext) => unknown): void
}

/**
 * {@link https://www.11ty.dev/docs/events/ Eleventy Reference}
 */
export interface EventContext {
  dir: {
    input: string
    output: string
    includes: string
    data: string
    layouts?: string
  }
  outputMode: "fs" | "json" | "ndjson"
  runMode: "build" | "watch" | "serve"
}

/**
 * {@link https://www.11ty.dev/docs/languages/custom/ Eleventy Reference}
 */
export interface ExtensionOptions {
  key?: string
  outputFileExtension?: string
  compile?(content: string, file: string): (data: Data) => unknown
}

/**
 * {@link https://github.com/11ty/eleventy/blob/v2.0.1/src/Util/ConsoleLogger.js/#L8 Eleventy Reference}
 */
export interface ConsoleLogger {
  /**
   * {@link https://github.com/11ty/eleventy/blob/v2.0.1/src/Util/ConsoleLogger.js#L83 Eleventy Reference}
   */
  message(message: string, type?: "log" | "warn" | "error", chalkColor?: string, forceToConsole?: boolean, prefix?: string): void
}

/**
 * {@link https://www.11ty.dev/docs/data-custom/ Eleventy Reference}
 */
export interface DataExtensionOptions {
  parser?(content: string, file: string): Promise<unknown>
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
  data: string
  includes: string
  input: string
  layouts: string
  output: string
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
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  items?: any[]
  data?: string
  size?: number
  addAllPagesToCollections?: boolean
}

/**
 * {@link https://www.11ty.dev/docs/data-computed/ Eleventy Reference}
 */
export interface EleventyComputed {
  [k: string]: unknown

  /**
   * {@link https://www.11ty.dev/docs/layouts/ Eleventy Reference}
   */
  layout?(data: Data): string | undefined
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
export interface Context extends Data {
  collections: Collections
  content: Content
  eleventy: Eleventy
  page: Page
}

export interface Collections {}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type Content = any

/**
 * {@link https://www.11ty.dev/docs/data-eleventy-supplied/#eleventy-variable Eleventy Reference}
 */
export interface Eleventy {
  generator: string
}
