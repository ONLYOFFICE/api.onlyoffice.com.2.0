import {type PagefindSearchOptions} from "@onlyoffice/pagefind-types"
import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {useSlots} from "@onlyoffice/preact-slots"
import {CancelIcon, MagnifyingGlassIcon} from "@onlyoffice/ui-icons/poor/24.tsx"
import {
  Template,
  TextInput,
  TextInputAction,
  TextInputControl,
  TextInputLeading,
  TextInputPlaceholder,
  TextInputTrailing,
} from "@onlyoffice/ui-kit"
import {type JSX, h} from "preact"

export interface SearchContainerProperties extends ChildrenIncludable {
  "search-options"?: PagefindSearchOptions
}

export function SearchContainer(p: SearchContainerProperties): JSX.Element {
  const [slots] = useSlots(p.children, {
    placeholder: SearchPlaceholder,
    field: SearchField,
    clear: SearchClear,
    template: SearchTemplate,
  })

  const o: Record<string, string> = {}
  if (p["search-options"]) {
    o["search-options"] = JSON.stringify(p["search-options"])
  }

  return <search-container class="search" {...o}>
    <form id="search" action="https://duckduckgo.com/" method="get">
      <TextInput>
        <TextInputLeading>
          <MagnifyingGlassIcon class="search__glass" />
        </TextInputLeading>
        <TextInputPlaceholder>
          {slots.placeholder}
        </TextInputPlaceholder>
        <TextInputControl>
          {slots.field}
        </TextInputControl>
        <TextInputTrailing>
          <TextInputAction>
            {slots.clear}
          </TextInputAction>
        </TextInputTrailing>
      </TextInput>
    </form>
  </search-container>
}

export function SearchPlaceholder({children}: ChildrenIncludable): JSX.Element {
  return children
}

export interface SearchFieldProperties {
  label?: string
}

export function SearchField({label}: SearchFieldProperties): JSX.Element {
  return <input name="q" type="search" aria-label={label} autocomplete="off" />
}

export interface SearchClearProperties {
  label?: string
}

export function SearchClear({label}: SearchClearProperties): JSX.Element {
  return <button type="button" value="clear" aria-label={label}>
    <CancelIcon width={16} height={16} />
  </button>
}

export function SearchTemplate({children}: ChildrenIncludable): JSX.Element {
  return <Template>{children}</Template>
}

export function SearchHidable({children}: ChildrenIncludable): JSX.Element {
  return <div data-search-container-hidable>{children}</div>
}

export interface SearchOutputProperties extends ChildrenIncludable {
  hidden?: boolean
}

export function SearchOutput({children, hidden = true}: SearchOutputProperties): JSX.Element {
  return <output data-search-container-output for="search" hidden={hidden}>{children}</output>
}
