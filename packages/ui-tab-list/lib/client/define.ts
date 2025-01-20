import {TabListContainer} from "./element.ts"

export function define(w: Window): void {
  if (w.customElements.get(TabListContainer.tagName)) {
    return
  }

  w.TabListContainer = TabListContainer
  w.customElements.define(TabListContainer.tagName, TabListContainer)
}
