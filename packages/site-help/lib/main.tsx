import {type ChildrenIncludable} from "@onlyoffice/preact-types"
import {type JSX} from "preact"

export function Help({children}: ChildrenIncludable): JSX.Element {
  return <div class="help">{children}</div>
}
