import {TocContainer} from "./element.ts"

export function define(w: Window): void {
  if (w.customElements.get(TocContainer.tagName)) {
    return
  }

  w.TocContainer = TocContainer
  w.customElements.define(TocContainer.tagName, TocContainer)
}
