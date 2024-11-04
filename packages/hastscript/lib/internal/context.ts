import {type Children, type Component, Fragment as F, h} from "../builder.ts"

class State {
  static shared = new State()
  r: Record<string, unknown> = {}
  i = 0
}

export interface ProviderProperties<V> {
  value: V
}

export interface Context<V> {
  id: string
  dv: V
  Provider(this: void, p: ProviderProperties<V>, ch: Children): Component
  Destroyer(this: void): Component
}

export function useContext<V>(c: Context<V>): V {
  const m = State.shared
  const v = m.r[c.id]
  if (v === undefined && !(c.id in m.r)) {
    return c.dv
  }
  return v as V
}

export function createContext<V>(v: V): Context<V> {
  const m = State.shared
  m.i += 1

  const c: Context<V> = {
    id: `__cC${m.i}`,
    dv: v,
    Provider(this: void, p: ProviderProperties<V>, ch: Children): Component {
      const m = State.shared
      if (!(c.id in m.r) && p.value !== undefined) {
        m.r[c.id] = p.value
      }
      return h(F, [...ch, h(c.Destroyer)])
    },
    Destroyer(this: void): Component {
      const m = State.shared
      if (c.id in m.r) {
        delete m.r[c.id]
      }
      return h(F)
    },
  }

  return c
}
