import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export interface SelectProperties extends ChildrenIncludable {
  name?: string
}

export function Select(p: SelectProperties): JSX.Element {
  return <combobox-container name={p.name} class="select">
    {p.children}
  </combobox-container>
}

export function SelectCombobox(p: ChildrenIncludable): JSX.Element {
  return <div role="combobox">{p.children}</div>
}

export interface SelectListboxProperties extends ChildrenIncludable {
  hidden?: boolean
}

export function SelectListbox(p: SelectListboxProperties): JSX.Element {
  const {children, hidden = true} = p
  return <div role="listbox" hidden={hidden}>{children}</div>
}

export interface SelectOptionProperties extends ChildrenIncludable {
  selected?: boolean
  value?: string
}

interface OptionProperties {
  "aria-selected"?: boolean
  "data-value"?: string
}

export function SelectOption(p: SelectOptionProperties): JSX.Element {
  const {children, selected, value} = p

  return <div class="select__option-container">
    <div role="option" {...props()}>{children}</div>
  </div>

  function props(): OptionProperties {
    const o: OptionProperties = {}
    if (selected !== undefined) {
      o["aria-selected"] = selected
    }
    if (value !== undefined) {
      o["data-value"] = value
    }
    return o
  }
}
