import type {SiteDocumentEditorPlayground} from "./element.ts"

export class SiteDocumentEditorPlaygroundErrorEvent extends ErrorEvent {
  static get type(): string {
    return "sitedocumenteditorplaygrounderror"
  }

  constructor(eventInitDict?: ErrorEventInit) {
    super(SiteDocumentEditorPlaygroundErrorEvent.type, eventInitDict)
  }
}

export interface SiteDocumentEditorPlaygroundErrorListener extends EventListener {
  (this: SiteDocumentEditorPlayground, event: SiteDocumentEditorPlaygroundErrorEvent): void
}

export interface GlobalSiteDocumentEditorPlaygroundErrorHandler {
  (this: GlobalEventHandlers, ev: SiteDocumentEditorPlaygroundErrorEvent): void
}
