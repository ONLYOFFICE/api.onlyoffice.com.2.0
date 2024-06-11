import type {JSX} from "preact"
import {h} from "preact"

export interface SelectParameters {
  children?: any
  name?: string
}

export function Select(
  {children, name}: SelectParameters
): JSX.Element {
  return <combobox-container name={name} class="select">
    {children}
  </combobox-container>
}

export interface SelectComboboxParameters {
  children?: any
}

export function SelectCombobox(
  {children}: SelectComboboxParameters
): JSX.Element {
  return <div role="combobox">{children}</div>
}

export interface SelectListboxParameters {
  children?: any
  hidden?: boolean
}

export function SelectListbox(
  {children, hidden = true}: SelectListboxParameters
): JSX.Element {
  return <div role="listbox" hidden={hidden}>{children}</div>
}

export interface SelectOptionParameters {
  children?: any
  selected?: boolean
  value?: string
}

interface SelectOptionProperties {
  "aria-selected"?: boolean
  "data-value"?: string
}

export function SelectOption(
  {children, selected, value}: SelectOptionParameters
): JSX.Element {
  return <div class="select__option-container">
    <div role="option" {...props()}>{children}</div>
  </div>

  function props(): SelectOptionProperties {
    const o: SelectOptionProperties = {}
    if (selected !== undefined) {
      o["aria-selected"] = selected
    }
    if (value !== undefined) {
      o["data-value"] = value
    }
    return o
  }
}
