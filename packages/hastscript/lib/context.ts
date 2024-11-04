import {type Children, type Component} from "./builder.ts"
import * as internal from "./internal/context.ts"

export {type ProviderProperties} from "./internal/context.ts"

export interface Context<V> {
  Provider(this: void, p: internal.ProviderProperties<V>, ch: Children): Component
}

export function createContext<V>(v: V): Context<V> {
  return internal.createContext(v)
}

export function useContext<V>(c: Context<V>): V {
  return internal.useContext(c as internal.Context<V>)
}
