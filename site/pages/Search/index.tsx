import {type Context, type Data} from "@onlyoffice/eleventy-types"
import {
  Chapter,
  ChapterContent,
  ChapterNavigation as SChapterNavigation,
  SearchClear,
  SearchContainer,
  SearchField,
  SearchOutput,
  SearchPlaceholder,
  SearchTemplate,
} from "@onlyoffice/site-kit"
import {Content} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"
import {Breadcrumb} from "../../internal/breadcrumb.tsx"
import {Explorer} from "../../internal/explorer.tsx"

export function data(): Data {
  return {
    layout: "page",
    eleventyExcludeFromCollections: true,
  }
}

export function render({content, ...ctx}: Context): JSX.Element {
  return <Chapter>
    <SChapterNavigation>
      <SearchContainer>
        <SearchPlaceholder>Type <kbd>/</kbd> to search</SearchPlaceholder>
        <SearchField label="Search" />
        <SearchClear label="Clear" />
        <SearchTemplate>
          <li>
            <p><a data-search-container-link /></p>
            <p data-search-container-matches />
          </li>
        </SearchTemplate>
      </SearchContainer>
      <Explorer level={0} url="/" />
    </SChapterNavigation>
    <ChapterContent>
      <Breadcrumb url={ctx.page.url} />
      <SearchOutput hidden={false}>
        <Content>
          <h1 aria-live="polite"><span data-search-container-counter /> Results</h1>
          <ol data-search-container-results />
        </Content>
      </SearchOutput>
    </ChapterContent>
  </Chapter>
}
