declare module "pagefind" {
  /**
   * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/lib/coupled_search.ts/#L629 Pagefind Reference}
   */
  export interface Pagefind {
    /**
     * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/lib/coupled_search.ts/#L645 Pagefind Reference}
     */
    init(): Promise<void>

    /**
     * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/lib/coupled_search.ts/#L648 Pagefind Reference}
     */
    destroy(): Promise<void>

    /**
     * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/lib/coupled_search.ts/#L657 Pagefind Reference}
     */
    search(term: string, options?: PagefindSearchOptions): Promise<PagefindSearchResults>
  }

  /**
   * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/types/index.d.ts/#L73 Pagefind Reference}
   */
  export interface PagefindSearchOptions {
    filters?: Record<string, unknown>
  }

  /**
   * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/types/index.d.ts/#L88 Pagefind Reference}
   */
  export interface PagefindSearchResults {
    results: PagefindSearchResult[]
  }

  /**
   * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/types/index.d.ts/#L106 Pagefind Reference}
   */
  export interface PagefindSearchResult {
    data(): Promise<PagefindFragment>
  }

  /**
   * {@link https://github.com/CloudCannon/pagefind/blob/v1.1.0/pagefind_web_js/types/index.d.ts/#L123 Pagefind Reference}
   */
  export interface PagefindFragment {
    url: string
    meta?: PagefindFragmentMeta
    excerpt: string
  }

  export interface PagefindFragmentMeta {
    title?: string
  }
}
