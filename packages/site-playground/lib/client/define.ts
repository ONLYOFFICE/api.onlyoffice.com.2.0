import {SitePlayground} from "./element.ts"
import type {GlobalSitePlaygroundErrorHandler, SitePlaygroundErrorListener} from "./events.ts"
import {SitePlaygroundErrorEvent} from "./events.ts"

declare global {
  interface Window {
    SitePlayground: typeof SitePlayground
    SitePlaygroundErrorEvent: typeof SitePlaygroundErrorEvent
  }

  interface HTMLElementTagNameMap {
    "site-playground": SitePlayground
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "site-playground": HTMLAttributes<SitePlayground>
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    siteplaygrounderror: SitePlaygroundErrorListener
  }

  interface GlobalEventHandlers {
    onsiteplaygrounderror: GlobalSitePlaygroundErrorHandler | null
  }
}

export function define(): void {
  if (window.customElements.get(SitePlayground.tagName)) {
    return
  }
  window.SitePlayground = SitePlayground
  window.customElements.define(SitePlayground.tagName, SitePlayground)
  window.SitePlaygroundErrorEvent = SitePlaygroundErrorEvent
}
