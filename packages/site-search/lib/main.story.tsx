import {Content} from "@onlyoffice/ui-kit"
import {type Meta} from "@storybook/preact"
import {Fragment, type JSX, h} from "preact"
import {
  SearchClear,
  SearchContainer,
  type SearchContainerProperties,
  SearchField,
  SearchHidable,
  SearchOutput,
  SearchPlaceholder,
  SearchTemplate,
} from "./main.tsx"

export default {
  title: "Site Patterns / Search",
} satisfies Meta

export function Default({...props}: SearchContainerProperties): JSX.Element {
  return <SearchContainer {...props}>
    <SearchPlaceholder>Type <kbd>/</kbd> to search</SearchPlaceholder>
    <SearchField label="Search" />
    <SearchClear label="Clear" />
    <SearchTemplate>
      <li>
        <a data-search-container-link />
        <p data-search-container-matches />
      </li>
    </SearchTemplate>
  </SearchContainer>
}

export function WithContent(): JSX.Element {
  return <>
    <Default />
    <SearchHidable>
      <Content>
        <h1>Content</h1>
        content
      </Content>
    </SearchHidable>
    <SearchOutput>
      <Content>
        <h1 aria-live="polite"><span data-search-container-counter /> Results</h1>
        <ol data-search-container-results />
      </Content>
    </SearchOutput>
  </>
}
