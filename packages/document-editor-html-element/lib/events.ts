/* eslint @stylistic/max-len: ["error", {code: 140}] */

import {
  type DocEditorDocumentDownloadAsEvent,
  type DocEditorDocumentStateChangeEvent,
  type DocEditorErrorEvent,
  type DocEditorInfoEvent,
  type DocEditorMakeActionLinkEvent,
  type DocEditorMetaChangeEvent,
  type DocEditorRequestHistoryDataEvent,
  type DocEditorRequestInsertImageEvent,
  type DocEditorRequestOpenEvent,
  type DocEditorRequestReferenceDataEvent,
  type DocEditorRequestReferenceSourceEvent,
  type DocEditorRequestRenameEvent,
  type DocEditorRequestRestoreEvent,
  type DocEditorRequestSaveAsEvent,
  type DocEditorRequestSelectDocumentEvent,
  type DocEditorRequestSelectSpreadsheetEvent,
  type DocEditorRequestSendNotifyEvent,
  type DocEditorRequestUsersEvent,
  type DocEditorWarningEvent,
} from "@onlyoffice/document-server-types"
import {type DocumentEditor} from "./element.ts"

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onAppReady ONLYOFFICE Reference}
 */
export class DocumentEditorAppReadyEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorAppReadyEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorappready" {
    return "documenteditorappready"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorAppReadyEvent.type, d)
  }
}

export interface DocumentEditorAppReadyEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorAppReadyEvent): void
}

export interface GlobalDocumentEditorAppReadyEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorAppReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onCollaborativeChanges ONLYOFFICE Reference}
 */
export class DocumentEditorCollaborativeChangesEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorCollaborativeChangesEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorcollaborativechanges" {
    return "documenteditorcollaborativechanges"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorCollaborativeChangesEvent.type, d)
  }
}

export interface DocumentEditorCollaborativeChangesEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorCollaborativeChangesEvent): void
}

export interface GlobalDocumentEditorCollaborativeChangesEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorCollaborativeChangesEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentReady ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentReadyEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorDocumentReadyEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditordocumentready" {
    return "documenteditordocumentready"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorDocumentReadyEvent.type, d)
  }
}

export interface DocumentEditorDocumentReadyEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorDocumentReadyEvent): void
}

export interface GlobalDocumentEditorDocumentReadyEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorDocumentReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentStateChange ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentStateChangeEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorDocumentStateChangeEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditordocumentstatechange" {
    return "documenteditordocumentstatechange"
  }

  #data: DocumentEditorDocumentStateChangeEventInit["data"]

  get data(): DocumentEditorDocumentStateChangeEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorDocumentStateChangeEventInit) {
    super(DocumentEditorDocumentStateChangeEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorDocumentStateChangeEventInit extends EventInit, DocEditorDocumentStateChangeEvent {}

export interface DocumentEditorDocumentStateChangeEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorDocumentStateChangeEvent): void
}

export interface GlobalDocumentEditorDocumentStateChangeEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorDocumentStateChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDownloadAs ONLYOFFICE Reference}
 */
export class DocumentEditorDownloadAsEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorDownloadAsEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditordownloadas" {
    return "documenteditordownloadas"
  }

  #data: DocumentEditorDownloadAsEventInit["data"]

  get data(): DocumentEditorDownloadAsEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorDownloadAsEventInit) {
    super(DocumentEditorDownloadAsEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorDownloadAsEventInit extends EventInit, DocEditorDocumentDownloadAsEvent {}

export interface DocumentEditorDownloadAsEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorDownloadAsEvent): void
}

export interface GlobalDocumentEditorDownloadAsEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorDownloadAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onError ONLYOFFICE Reference}
 */
export class DocumentEditorErrorEvent extends ErrorEvent {
  static get handlerName(): `on${typeof DocumentEditorErrorEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorerror" {
    return "documenteditorerror"
  }

  #data?: DocumentEditorErrorEventInit["data"]

  get data(): DocumentEditorErrorEventInit["data"] | undefined {
    return this.#data
  }

  constructor(d?: DocumentEditorErrorEventInit) {
    super(DocumentEditorErrorEvent.type, d)
    if (d) {
      this.#data = d.data
    }
  }
}

export interface DocumentEditorErrorEventInit extends ErrorEventInit {
  data?: DocEditorErrorEvent["data"]
}

export interface DocumentEditorErrorEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorErrorEvent): void
}

export interface GlobalDocumentEditorErrorEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorErrorEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onInfo ONLYOFFICE Reference}
 */
export class DocumentEditorInfoEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorInfoEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorinfo" {
    return "documenteditorinfo"
  }

  #data: DocumentEditorInfoEventInit["data"]

  get data(): DocumentEditorInfoEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorInfoEventInit) {
    super(DocumentEditorInfoEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorInfoEventInit extends EventInit, DocEditorInfoEvent {}

export interface DocumentEditorInfoEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorInfoEvent): void
}

export interface GlobalDocumentEditorInfoEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorInfoEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMakeActionLink ONLYOFFICE Reference}
 */
export class DocumentEditorMakeActionLinkEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorMakeActionLinkEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditormakeactionlink" {
    return "documenteditormakeactionlink"
  }

  #data: DocumentEditorMakeActionLinkEventInit["data"]

  get data(): DocumentEditorMakeActionLinkEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorMakeActionLinkEventInit) {
    super(DocumentEditorMakeActionLinkEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorMakeActionLinkEventInit extends EventInit, DocEditorMakeActionLinkEvent {}

export interface DocumentEditorMakeActionLinkEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorMakeActionLinkEvent): void
}

export interface GlobalDocumentEditorMakeActionLinkEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorMakeActionLinkEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMetaChange ONLYOFFICE Reference}
 */
export class DocumentEditorMetaChangeEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorMetaChangeEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditormetachange" {
    return "documenteditormetachange"
  }

  #data: DocumentEditorMetaChangeEventInit["data"]

  get data(): DocumentEditorMetaChangeEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorMetaChangeEventInit) {
    super(DocumentEditorMetaChangeEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorMetaChangeEventInit extends EventInit, DocEditorMetaChangeEvent {}

export interface DocumentEditorMetaChangeEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorMetaChangeEvent): void
}

export interface GlobalDocumentEditorMetaChangeEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorMetaChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onOutdatedVersion ONLYOFFICE Reference}
 */
export class DocumentEditorOutdatedVersionEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorOutdatedVersionEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditoroutdatedversion" {
    return "documenteditoroutdatedversion"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorOutdatedVersionEvent.type, d)
  }
}

export interface DocumentEditorOutdatedVersionEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorOutdatedVersionEvent): void
}

export interface GlobalDocumentEditorOutdatedVersionEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorOutdatedVersionEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onPluginsReady ONLYOFFICE Reference}
 */
export class DocumentEditorPluginsReadyEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorPluginsReadyEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorpluginsready" {
    return "documenteditorpluginsready"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorPluginsReadyEvent.type, d)
  }
}

export interface DocumentEditorPluginsReadyEventListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorPluginsReadyEvent): void
}

export interface GlobalDocumentEditorPluginsReadyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorPluginsReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onReady ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorAppReadyEvent} instead
 */
export class DocumentEditorReadyEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorReadyEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorready" {
    return "documenteditorready"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorReadyEvent.type, d)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorAppReadyEventListener} instead
 */
export interface DocumentEditorReadyEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorReadyEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorAppReadyEventHandler} instead
 */
export interface GlobalDocumentEditorReadyEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCloseEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestCloseEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestclose" {
    return "documenteditorrequestclose"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestCloseEvent.type, d)
  }
}

export interface DocumentEditorRequestCloseEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestCloseEvent): void
}

export interface GlobalDocumentEditorRequestCloseEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCompareFile ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentEvent} instead
 */
export class DocumentEditorRequestCompareFileEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestCompareFileEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestcomparefile" {
    return "documenteditorrequestcomparefile"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestCompareFileEvent.type, d)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentEventListener} instead
 */
export interface DocumentEditorRequestCompareFileEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestCompareFileEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorRequestSelectDocumentEventHandler} instead
 */
export interface GlobalDocumentEditorRequestCompareFileEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestCompareFileEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCreateNew ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCreateNewEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestCreateNewEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestcreatenew" {
    return "documenteditorrequestcreatenew"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestCreateNewEvent.type, d)
  }
}

export interface DocumentEditorRequestCreateNewEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestCreateNewEvent): void
}

export interface GlobalDocumentEditorRequestCreateNewEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestCreateNewEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestEditRights ONLYOFFICE Reference}
 */
export class DocumentEditorRequestEditRightsEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestEditRightsEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequesteditrights" {
    return "documenteditorrequesteditrights"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestEditRightsEvent.type, d)
  }
}

export interface DocumentEditorRequestEditRightsEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestEditRightsEvent): void
}

export interface GlobalDocumentEditorRequestEditRightsEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestEditRightsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryCloseEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestHistoryCloseEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequesthistoryclose" {
    return "documenteditorrequesthistoryclose"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestHistoryCloseEvent.type, d)
  }
}

export interface DocumentEditorRequestHistoryCloseEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestHistoryCloseEvent): void
}

export interface GlobalDocumentEditorRequestHistoryCloseEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestHistoryCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryDataEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestHistoryDataEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequesthistorydata" {
    return "documenteditorrequesthistorydata"
  }

  #data: DocumentEditorRequestHistoryDataEventInit["data"]

  get data(): DocumentEditorRequestHistoryDataEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestHistoryDataEventInit) {
    super(DocumentEditorRequestHistoryDataEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestHistoryDataEventInit extends EventInit, DocEditorRequestHistoryDataEvent {}

export interface DocumentEditorRequestHistoryDataEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestHistoryDataEvent): void
}

export interface GlobalDocumentEditorRequestHistoryDataEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestHistoryDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistory ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestHistoryEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequesthistory" {
    return "documenteditorrequesthistory"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestHistoryEvent.type, d)
  }
}

export interface DocumentEditorRequestHistoryEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestHistoryEvent): void
}

export interface GlobalDocumentEditorRequestHistoryEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestHistoryEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestInsertImage ONLYOFFICE Reference}
 */
export class DocumentEditorRequestInsertImageEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestInsertImageEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestinsertimage" {
    return "documenteditorrequestinsertimage"
  }

  #data: DocumentEditorRequestInsertImageEventInit["data"]

  get data(): DocumentEditorRequestInsertImageEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestInsertImageEventInit) {
    super(DocumentEditorRequestInsertImageEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestInsertImageEventInit extends EventInit, DocEditorRequestInsertImageEvent {}

export interface DocumentEditorRequestInsertImageEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestInsertImageEvent): void
}

export interface GlobalDocumentEditorRequestInsertImageEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestInsertImageEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestMailMergeRecipients ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetEvent} instead.
 */
export class DocumentEditorRequestMailMergeRecipientsEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestMailMergeRecipientsEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestmailmergerecipients" {
    return "documenteditorrequestmailmergerecipients"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestMailMergeRecipientsEvent.type, d)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetEventListener} instead.
 */
export interface DocumentEditorRequestMailMergeRecipientsEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestMailMergeRecipientsEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorRequestSelectSpreadsheetEventHandler} instead.
 */
export interface GlobalDocumentEditorRequestMailMergeRecipientsEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestMailMergeRecipientsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestOpen ONLYOFFICE Reference}
 */
export class DocumentEditorRequestOpenEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestOpenEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestopen" {
    return "documenteditorrequestopen"
  }

  #data: DocumentEditorRequestOpenEventInit["data"]

  get data(): DocumentEditorRequestOpenEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestOpenEventInit) {
    super(DocumentEditorRequestOpenEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestOpenEventInit extends EventInit, DocEditorRequestOpenEvent {}

export interface DocumentEditorRequestOpenEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestOpenEvent): void
}

export interface GlobalDocumentEditorRequestOpenEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestOpenEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceDataEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestReferenceDataEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestreferencedata" {
    return "documenteditorrequestreferencedata"
  }

  #data: DocumentEditorRequestReferenceDataEventInit["data"]

  get data(): DocumentEditorRequestReferenceDataEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestReferenceDataEventInit) {
    super(DocumentEditorRequestReferenceDataEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestReferenceDataEventInit extends EventInit, DocEditorRequestReferenceDataEvent {}

export interface DocumentEditorRequestReferenceDataEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestReferenceDataEvent): void
}

export interface GlobalDocumentEditorRequestReferenceDataEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestReferenceDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceSource ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceSourceEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestReferenceSourceEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestreferencesource" {
    return "documenteditorrequestreferencesource"
  }

  #data: DocumentEditorRequestReferenceSourceEventInit["data"]

  get data(): DocumentEditorRequestReferenceSourceEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestReferenceSourceEventInit) {
    super(DocumentEditorRequestReferenceSourceEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestReferenceSourceEventInit extends EventInit, DocEditorRequestReferenceSourceEvent {}

export interface DocumentEditorRequestReferenceSourceEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestReferenceSourceEvent): void
}

export interface GlobalDocumentEditorRequestReferenceSourceEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestReferenceSourceEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRename ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRenameEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestRenameEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestrename" {
    return "documenteditorrequestrename"
  }

  #data: DocumentEditorRequestRenameEventInit["data"]

  get data(): DocumentEditorRequestRenameEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestRenameEventInit) {
    super(DocumentEditorRequestRenameEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestRenameEventInit extends EventInit, DocEditorRequestRenameEvent {}

export interface DocumentEditorRequestRenameEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestRenameEvent): void
}

export interface GlobalDocumentEditorRequestRenameEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestRenameEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRestore ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRestoreEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestRestoreEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestrestore" {
    return "documenteditorrequestrestore"
  }

  #data: DocumentEditorRequestRestoreEventInit["data"]

  get data(): DocumentEditorRequestRestoreEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestRestoreEventInit) {
    super(DocumentEditorRequestRestoreEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestRestoreEventInit extends EventInit, DocEditorRequestRestoreEvent {}

export interface DocumentEditorRequestRestoreEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestRestoreEvent): void
}

export interface GlobalDocumentEditorRequestRestoreEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestRestoreEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSaveAs ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSaveAsEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestSaveAsEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestsaveas" {
    return "documenteditorrequestsaveas"
  }

  #data: DocumentEditorRequestSaveAsEventInit["data"]

  get data(): DocumentEditorRequestSaveAsEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestSaveAsEventInit) {
    super(DocumentEditorRequestSaveAsEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestSaveAsEventInit extends EventInit, DocEditorRequestSaveAsEvent {}

export interface DocumentEditorRequestSaveAsEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestSaveAsEvent): void
}

export interface GlobalDocumentEditorRequestSaveAsEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestSaveAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectDocument ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectDocumentEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestSelectDocumentEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestselectdocument" {
    return "documenteditorrequestselectdocument"
  }

  #data: DocumentEditorRequestSelectDocumentEventInit["data"]

  get data(): DocumentEditorRequestSelectDocumentEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestSelectDocumentEventInit) {
    super(DocumentEditorRequestSelectDocumentEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestSelectDocumentEventInit extends EventInit, DocEditorRequestSelectDocumentEvent {}

export interface DocumentEditorRequestSelectDocumentEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestSelectDocumentEvent): void
}

export interface GlobalDocumentEditorRequestSelectDocumentEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestSelectDocumentEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectSpreadsheet ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectSpreadsheetEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestSelectSpreadsheetEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestselectspreadsheet" {
    return "documenteditorrequestselectspreadsheet"
  }

  #data: DocumentEditorRequestSelectSpreadsheetEventInit["data"]

  get data(): DocumentEditorRequestSelectSpreadsheetEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestSelectSpreadsheetEventInit) {
    super(DocumentEditorRequestSelectSpreadsheetEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestSelectSpreadsheetEventInit extends EventInit, DocEditorRequestSelectSpreadsheetEvent {}

export interface DocumentEditorRequestSelectSpreadsheetEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestSelectSpreadsheetEvent): void
}

export interface GlobalDocumentEditorRequestSelectSpreadsheetEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestSelectSpreadsheetEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSendNotify ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSendNotifyEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestSendNotifyEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestsendnotify" {
    return "documenteditorrequestsendnotify"
  }

  #data: DocumentEditorRequestSendNotifyEventInit["data"]

  get data(): DocumentEditorRequestSendNotifyEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestSendNotifyEventInit) {
    super(DocumentEditorRequestSendNotifyEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestSendNotifyEventInit extends EventInit, DocEditorRequestSendNotifyEvent {}

export interface DocumentEditorRequestSendNotifyEventListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSendNotifyEvent): void
}

export interface GlobalDocumentEditorRequestSendNotifyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSendNotifyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSharingSettings ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSharingSettingsEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestSharingSettingsEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestsharingsettings" {
    return "documenteditorrequestsharingsettings"
  }

  constructor(d?: EventInit) {
    super(DocumentEditorRequestSharingSettingsEvent.type, d)
  }
}

export interface DocumentEditorRequestSharingSettingsEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestSharingSettingsEvent): void
}

export interface GlobalDocumentEditorRequestSharingSettingsEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestSharingSettingsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestUsers ONLYOFFICE Reference}
 */
export class DocumentEditorRequestUsersEvent extends Event {
  static get handlerName(): `on${typeof DocumentEditorRequestUsersEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorrequestusers" {
    return "documenteditorrequestusers"
  }

  #data: DocumentEditorRequestUsersEventInit["data"]

  get data(): DocumentEditorRequestUsersEventInit["data"] {
    return this.#data
  }

  constructor(d: DocumentEditorRequestUsersEventInit) {
    super(DocumentEditorRequestUsersEvent.type, d)
    this.#data = d.data
  }
}

export interface DocumentEditorRequestUsersEventInit extends EventInit, DocEditorRequestUsersEvent {}

export interface DocumentEditorRequestUsersEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorRequestUsersEvent): void
}

export interface GlobalDocumentEditorRequestUsersEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorRequestUsersEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onWarning ONLYOFFICE Reference}
 */
export class DocumentEditorWarningEvent extends ErrorEvent {
  static get handlerName(): `on${typeof DocumentEditorWarningEvent.type}` {
    return `on${this.type}`
  }

  static get type(): "documenteditorwarning" {
    return "documenteditorwarning"
  }

  #data?: DocumentEditorWarningEventInit["data"]

  get data(): DocumentEditorWarningEventInit["data"] | undefined {
    return this.#data
  }

  constructor(d?: DocumentEditorWarningEventInit) {
    super(DocumentEditorWarningEvent.type, d)
    if (d) {
      this.#data = d.data
    }
  }
}

export interface DocumentEditorWarningEventInit extends ErrorEventInit {
  data?: DocEditorWarningEvent["data"]
}

export interface DocumentEditorWarningEventListener extends EventListener {
  (this: DocumentEditor, e: DocumentEditorWarningEvent): void
}

export interface GlobalDocumentEditorWarningEventHandler {
  (this: GlobalEventHandlers, e: DocumentEditorWarningEvent): void
}
