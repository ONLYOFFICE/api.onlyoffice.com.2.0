import * as E from "@onlyoffice/preact-elements"
import {clsx} from "clsx"
import {type JSX, createContext} from "preact"
import {useContext} from "preact/hooks"

class Context {
  tabId = ""
  controls: string[] = []
}

const C = createContext(new Context())

export function TabList(p: E.DivProperties): JSX.Element {
  const {...o} = p

  o.class = clsx("tab-list", o.class)

  return <C.Provider value={new Context()}>
    <E.Div {...o}>
      <tab-list-container>
        <tab-container>{p.children}</tab-container>
      </tab-list-container>
    </E.Div>
  </C.Provider>
}

export interface TabListTabListWrapperProperties extends Omit<E.DivProperties, "slot"> {}

export function TabListTabListWrapper(p: TabListTabListWrapperProperties): JSX.Element {
  const {...o} = p
  const q: E.DivProperties = o

  q.slot = "tablist-wrapper"
  q.class = clsx("tab-list__tab-list-wrapper", q.class)

  return <E.Div {...q} />
}

export interface TabListTabListProperties extends Omit<E.DivProperties, "aria-label" | "role"> {
  label: string
}

export function TabListTabList(p: TabListTabListProperties): JSX.Element {
  const {label, ...o} = p
  const q: E.DivProperties = o

  q["aria-label"] = label
  q.role = "tablist"
  q.class = clsx("tab-list__tab-list", q.class)

  return <E.Div {...q} />
}

export interface TabListTabProperties extends Omit<E.ButtonProperties, "controls" | "role" | "type"> {
  id: string
  controls?: string
}

export function TabListTab(p: TabListTabProperties): JSX.Element {
  const ctx = useContext(C)
  const {controls, ...o} = p
  const q: E.ButtonProperties = o

  if (controls) {
    q["aria-controls"] = controls
  }

  q.role = "tab"
  q.type = "button"
  q.class = clsx("tab-list__tab", q.class)

  if (!ctx.tabId) {
    ctx.tabId = p.id
    if (controls) {
      ctx.controls = controls.split(" ")
    }
  }

  return <E.Button {...q} />
}

export interface TabListExtraListProperties extends Omit<E.DivProperties, "aria-label"> {
  label: string
}

export function TabListExtraList(p: TabListExtraListProperties): JSX.Element {
  const {label, ...o} = p
  const q: E.DivProperties = o

  q["aria-label"] = label
  q.class = clsx("tab-list__extra-list", q.class)

  return <E.Div {...q} />
}

export interface TabListExtraProperties extends E.DivProperties {
  id?: string
}

export function TabListExtra(p: TabListExtraProperties): JSX.Element {
  const ctx = useContext(C)
  const {...o} = p

  o.class = clsx("tab-list__extra", o.class)

  if (o.id && ctx.controls && !ctx.controls.includes(o.id)) {
    o.hidden = true
  }

  return <E.Div {...o} />
}

export interface TabListTabPanelProperties extends Omit<E.DivProperties, "aria-labelledby" | "role"> {
  labelledby: string
}

export function TabListTabPanel(p: TabListTabPanelProperties): JSX.Element {
  const {labelledby, ...o} = p
  const q: E.DivProperties = o

  q["aria-labelledby"] = labelledby
  q.role = "tabpanel"
  q.class = clsx("tab-list__tab-panel", q.class)

  return <E.Div {...q} />
}
