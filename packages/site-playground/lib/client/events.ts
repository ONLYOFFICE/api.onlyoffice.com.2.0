import type {SitePlayground} from "./element.ts"

export class SitePlaygroundErrorEvent extends ErrorEvent {
  static get type(): string {
    return "siteplaygrounderror"
  }

  constructor(eventInitDict?: ErrorEventInit) {
    super(SitePlaygroundErrorEvent.type, eventInitDict)
  }
}

export interface SitePlaygroundErrorListener extends EventListener {
  (this: SitePlayground, event: SitePlaygroundErrorEvent): void
}

export interface GlobalSitePlaygroundErrorHandler {
  (this: GlobalEventHandlers, ev: SitePlaygroundErrorEvent): void
}
