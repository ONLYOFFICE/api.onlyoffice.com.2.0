import type {ChildrenIncludable} from "@onlyoffice/preact-types"

export function Callback({children}: ChildrenIncludable): null {
  if (typeof children === "function") {
    children()
  }
  return null
}
