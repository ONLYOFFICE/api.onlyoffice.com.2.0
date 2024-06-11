import type {JSX} from "preact"
import {createContext, h} from "preact"
import {useContext} from "preact/hooks"

interface Contextual {
  for: string
}

const Context = createContext<Contextual>({for: ""})

export interface FormControlParameters {
  children?: any
  for?: string
}

export function FormControl(
  {children, ...props}: FormControlParameters
): JSX.Element {
  return <Context.Provider value={{for: props.for}}>
    <div class="form-control">{children}</div>
  </Context.Provider>
}

export interface FormControlLabelParameters {
  children?: any
}

export function FormControlLabel(
  {children}: FormControlLabelParameters
): JSX.Element {
  const ctx = useContext(Context)
  return <label class="form-control__label" for={ctx.for}>{children}</label>
}

export interface FormControlControlParameters {
  children?: any
}

export function FormControlControl(
  {children}: FormControlControlParameters
): JSX.Element {
  return <div class="form-control__control">{children}</div>
}
