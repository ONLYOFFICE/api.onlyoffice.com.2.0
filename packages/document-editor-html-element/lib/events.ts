/* eslint @stylistic/max-len: ["error", {code: 140}] */

import type {
  DocEditorDocumentDownloadAsEvent,
  DocEditorDocumentStateChangeEvent,
  DocEditorErrorEvent,
  DocEditorInfoEvent,
  DocEditorMakeActionLinkEvent,
  DocEditorMetaChangeEvent,
  DocEditorRequestHistoryDataEvent,
  DocEditorRequestInsertImageEvent,
  DocEditorRequestOpenEvent,
  DocEditorRequestReferenceDataEvent,
  DocEditorRequestReferenceSourceEvent,
  DocEditorRequestRenameEvent,
  DocEditorRequestRestoreEvent,
  DocEditorRequestSaveAsEvent,
  DocEditorRequestSelectDocumentEvent,
  DocEditorRequestSelectSpreadsheetEvent,
  DocEditorRequestSendNotifyEvent,
  DocEditorRequestUsersEvent,
  DocEditorWarningEvent
} from "@onlyoffice/document-server-types"
import type {DocumentEditor} from "./element.ts"

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onAppReady ONLYOFFICE Reference}
 */
export class DocumentEditorAppReadyEvent extends Event {
  static get type(): string {
    return "documenteditorappready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorAppReadyEvent.type, eventInitDict)
  }
}

export interface DocumentEditorAppReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorAppReadyEvent): void
}

export interface GlobalDocumentEditorAppReadyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorAppReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onCollaborativeChanges ONLYOFFICE Reference}
 */
export class DocumentEditorCollaborativeChangesEvent extends Event {
  static get type(): string {
    return "documenteditorcollaborativechanges"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorCollaborativeChangesEvent.type, eventInitDict)
  }
}

export interface DocumentEditorCollaborativeChangesListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorCollaborativeChangesEvent): void
}

export interface GlobalDocumentEditorCollaborativeChangesEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorCollaborativeChangesEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentReady ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentReadyEvent extends Event {
  static get type(): string {
    return "documenteditordocumentready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorDocumentReadyEvent.type, eventInitDict)
  }
}

export interface DocumentEditorDocumentReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDocumentReadyEvent): void
}

export interface GlobalDocumentEditorDocumentReadyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorDocumentReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDocumentStateChange ONLYOFFICE Reference}
 */
export class DocumentEditorDocumentStateChangeEvent extends Event {
  static get type(): string {
    return "documenteditordocumentstatechange"
  }

  #data: DocumentEditorDocumentStateChangeEventInit["data"]

  get data(): DocumentEditorDocumentStateChangeEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorDocumentStateChangeEventInit) {
    super(DocumentEditorDocumentStateChangeEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorDocumentStateChangeEventInit extends EventInit, DocEditorDocumentStateChangeEvent {}

export interface DocumentEditorDocumentStateChangeListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDocumentStateChangeEvent): void
}

export interface GlobalDocumentEditorDocumentStateChangeEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorDocumentStateChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onDownloadAs ONLYOFFICE Reference}
 */
export class DocumentEditorDownloadAsEvent extends Event {
  static get type(): string {
    return "documenteditordownloadas"
  }

  #data: DocumentEditorDownloadAsEventInit["data"]

  get data(): DocumentEditorDownloadAsEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorDownloadAsEventInit) {
    super(DocumentEditorDownloadAsEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorDownloadAsEventInit extends EventInit, DocEditorDocumentDownloadAsEvent {}

export interface DocumentEditorDownloadAsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorDownloadAsEvent): void
}

export interface GlobalDocumentEditorDownloadAsEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorDownloadAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onError ONLYOFFICE Reference}
 */
export class DocumentEditorErrorEvent extends ErrorEvent {
  static get type(): string {
    return "documenteditorerror"
  }

  #data?: DocumentEditorErrorEventInit["data"]

  get data(): DocumentEditorErrorEventInit["data"] | undefined {
    return this.#data
  }

  constructor(eventInitDict?: DocumentEditorErrorEventInit) {
    super(DocumentEditorErrorEvent.type, eventInitDict)
    if (eventInitDict) {
      this.#data = eventInitDict.data
    }
  }
}

export interface DocumentEditorErrorEventInit extends ErrorEventInit {
  data?: DocEditorErrorEvent["data"]
}

export interface DocumentEditorErrorListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorErrorEvent): void
}

export interface GlobalDocumentEditorErrorEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorErrorEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onInfo ONLYOFFICE Reference}
 */
export class DocumentEditorInfoEvent extends Event {
  static get type(): string {
    return "documenteditorinfo"
  }

  #data: DocumentEditorInfoEventInit["data"]

  get data(): DocumentEditorInfoEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorInfoEventInit) {
    super(DocumentEditorInfoEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorInfoEventInit extends EventInit, DocEditorInfoEvent {}

export interface DocumentEditorInfoListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorInfoEvent): void
}

export interface GlobalDocumentEditorInfoEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorInfoEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMakeActionLink ONLYOFFICE Reference}
 */
export class DocumentEditorMakeActionLinkEvent extends Event {
  static get type(): string {
    return "documenteditormakeactionlink"
  }

  #data: DocumentEditorMakeActionLinkEventInit["data"]

  get data(): DocumentEditorMakeActionLinkEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorMakeActionLinkEventInit) {
    super(DocumentEditorMakeActionLinkEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorMakeActionLinkEventInit extends EventInit, DocEditorMakeActionLinkEvent {}

export interface DocumentEditorMakeActionLinkListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorMakeActionLinkEvent): void
}

export interface GlobalDocumentEditorMakeActionLinkEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMakeActionLinkEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onMetaChange ONLYOFFICE Reference}
 */
export class DocumentEditorMetaChangeEvent extends Event {
  static get type(): string {
    return "documenteditormetachange"
  }

  #data: DocumentEditorMetaChangeEventInit["data"]

  get data(): DocumentEditorMetaChangeEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorMetaChangeEventInit) {
    super(DocumentEditorMetaChangeEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorMetaChangeEventInit extends EventInit, DocEditorMetaChangeEvent {}

export interface DocumentEditorMetaChangeListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorMetaChangeEvent): void
}

export interface GlobalDocumentEditorMetaChangeEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorMetaChangeEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onOutdatedVersion ONLYOFFICE Reference}
 */
export class DocumentEditorOutdatedVersionEvent extends Event {
  static get type(): string {
    return "documenteditoroutdatedversion"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorOutdatedVersionEvent.type, eventInitDict)
  }
}

export interface DocumentEditorOutdatedVersionListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorOutdatedVersionEvent): void
}

export interface GlobalDocumentEditorOutdatedVersionEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorOutdatedVersionEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onPluginsReady ONLYOFFICE Reference}
 */
export class DocumentEditorPluginsReadyEvent extends Event {
  static get type(): string {
    return "documenteditorpluginsready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorPluginsReadyEvent.type, eventInitDict)
  }
}

export interface DocumentEditorPluginsReadyListener extends EventListener {
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
  static get type(): string {
    return "documenteditorready"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorReadyEvent.type, eventInitDict)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorAppReadyListener} instead
 */
export interface DocumentEditorReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorReadyEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorAppReadyEventHandler} instead
 */
export interface GlobalDocumentEditorReadyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorReadyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCloseEvent extends Event {
  static get type(): string {
    return "documenteditorrequestclose"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestCloseEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestCloseListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCloseEvent): void
}

export interface GlobalDocumentEditorRequestCloseEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCompareFile ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentEvent} instead
 */
export class DocumentEditorRequestCompareFileEvent extends Event {
  static get type(): string {
    return "documenteditorrequestcomparefile"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestCompareFileEvent.type, eventInitDict)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectDocumentListener} instead
 */
export interface DocumentEditorRequestCompareFileListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCompareFileEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorRequestSelectDocumentEventHandler} instead
 */
export interface GlobalDocumentEditorRequestCompareFileEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestCompareFileEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestCreateNew ONLYOFFICE Reference}
 */
export class DocumentEditorRequestCreateNewEvent extends Event {
  static get type(): string {
    return "documenteditorrequestcreatenew"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestCreateNewEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestCreateNewListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestCreateNewEvent): void
}

export interface GlobalDocumentEditorRequestCreateNewEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestCreateNewEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestEditRights ONLYOFFICE Reference}
 */
export class DocumentEditorRequestEditRightsEvent extends Event {
  static get type(): string {
    return "documenteditorrequesteditrights"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestEditRightsEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestEditRightsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestEditRightsEvent): void
}

export interface GlobalDocumentEditorRequestEditRightsEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestEditRightsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistory ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryEvent extends Event {
  static get type(): string {
    return "documenteditorrequesthistory"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestHistoryEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestHistoryListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryEvent): void
}

export interface GlobalDocumentEditorRequestHistoryEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestHistoryEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryClose ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryCloseEvent extends Event {
  static get type(): string {
    return "documenteditorrequesthistoryclose"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestHistoryCloseEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestHistoryCloseListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryCloseEvent): void
}

export interface GlobalDocumentEditorRequestHistoryCloseEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestHistoryCloseEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestHistoryData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestHistoryDataEvent extends Event {
  static get type(): string {
    return "documenteditorrequesthistorydata"
  }

  #data: DocumentEditorRequestHistoryDataEventInit["data"]

  get data(): DocumentEditorRequestHistoryDataEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestHistoryDataEventInit) {
    super(DocumentEditorRequestHistoryDataEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestHistoryDataEventInit extends EventInit, DocEditorRequestHistoryDataEvent {}

export interface DocumentEditorRequestHistoryDataListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestHistoryDataEvent): void
}

export interface GlobalDocumentEditorRequestHistoryDataEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestHistoryDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestInsertImage ONLYOFFICE Reference}
 */
export class DocumentEditorRequestInsertImageEvent extends Event {
  static get type(): string {
    return "documenteditorrequestinsertimage"
  }

  #data: DocumentEditorRequestInsertImageEventInit["data"]

  get data(): DocumentEditorRequestInsertImageEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestInsertImageEventInit) {
    super(DocumentEditorRequestInsertImageEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestInsertImageEventInit extends EventInit, DocEditorRequestInsertImageEvent {}

export interface DocumentEditorRequestInsertImageListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestInsertImageEvent): void
}

export interface GlobalDocumentEditorRequestInsertImageEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestInsertImageEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestMailMergeRecipients ONLYOFFICE Reference}
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetEvent} instead.
 */
export class DocumentEditorRequestMailMergeRecipientsEvent extends Event {
  static get type(): string {
    return "documenteditorrequestmailmergerecipients"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestMailMergeRecipientsEvent.type, eventInitDict)
  }
}

/**
 * @deprecated Prefer {@link DocumentEditorRequestSelectSpreadsheetListener} instead.
 */
export interface DocumentEditorRequestMailMergeRecipientsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestMailMergeRecipientsEvent): void
}

/**
 * @deprecated Prefer {@link GlobalDocumentEditorRequestSelectSpreadsheetEventHandler} instead.
 */
export interface GlobalDocumentEditorRequestMailMergeRecipientsEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestMailMergeRecipientsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestOpen ONLYOFFICE Reference}
 */
export class DocumentEditorRequestOpenEvent extends Event {
  static get type(): string {
    return "documenteditorrequestopen"
  }

  #data: DocumentEditorRequestOpenEventInit["data"]

  get data(): DocumentEditorRequestOpenEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestOpenEventInit) {
    super(DocumentEditorRequestOpenEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestOpenEventInit extends EventInit, DocEditorRequestOpenEvent {}

export interface DocumentEditorRequestOpenListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestOpenEvent): void
}

export interface GlobalDocumentEditorRequestOpenEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestOpenEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceData ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceDataEvent extends Event {
  static get type(): string {
    return "documenteditorrequestreferencedata"
  }

  #data: DocumentEditorRequestReferenceDataEventInit["data"]

  get data(): DocumentEditorRequestReferenceDataEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestReferenceDataEventInit) {
    super(DocumentEditorRequestReferenceDataEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestReferenceDataEventInit extends EventInit, DocEditorRequestReferenceDataEvent {}

export interface DocumentEditorRequestReferenceDataListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestReferenceDataEvent): void
}

export interface GlobalDocumentEditorRequestReferenceDataEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestReferenceDataEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestReferenceSource ONLYOFFICE Reference}
 */
export class DocumentEditorRequestReferenceSourceEvent extends Event {
  static get type(): string {
    return "documenteditorrequestreferencesource"
  }

  #data: DocumentEditorRequestReferenceSourceEventInit["data"]

  get data(): DocumentEditorRequestReferenceSourceEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestReferenceSourceEventInit) {
    super(DocumentEditorRequestReferenceSourceEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestReferenceSourceEventInit extends EventInit, DocEditorRequestReferenceSourceEvent {}

export interface DocumentEditorRequestReferenceSourceListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestReferenceSourceEvent): void
}

export interface GlobalDocumentEditorRequestReferenceSourceEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestReferenceSourceEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRename ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRenameEvent extends Event {
  static get type(): string {
    return "documenteditorrequestrename"
  }

  #data: DocumentEditorRequestRenameEventInit["data"]

  get data(): DocumentEditorRequestRenameEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestRenameEventInit) {
    super(DocumentEditorRequestRenameEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestRenameEventInit extends EventInit, DocEditorRequestRenameEvent {}

export interface DocumentEditorRequestRenameListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestRenameEvent): void
}

export interface GlobalDocumentEditorRequestRenameEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestRenameEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestRestore ONLYOFFICE Reference}
 */
export class DocumentEditorRequestRestoreEvent extends Event {
  static get type(): string {
    return "documenteditorrequestrestore"
  }

  #data: DocumentEditorRequestRestoreEventInit["data"]

  get data(): DocumentEditorRequestRestoreEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestRestoreEventInit) {
    super(DocumentEditorRequestRestoreEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestRestoreEventInit extends EventInit, DocEditorRequestRestoreEvent {}

export interface DocumentEditorRequestRestoreListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestRestoreEvent): void
}

export interface GlobalDocumentEditorRequestRestoreEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestRestoreEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSaveAs ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSaveAsEvent extends Event {
  static get type(): string {
    return "documenteditorrequestsaveas"
  }

  #data: DocumentEditorRequestSaveAsEventInit["data"]

  get data(): DocumentEditorRequestSaveAsEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestSaveAsEventInit) {
    super(DocumentEditorRequestSaveAsEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSaveAsEventInit extends EventInit, DocEditorRequestSaveAsEvent {}

export interface DocumentEditorRequestSaveAsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSaveAsEvent): void
}

export interface GlobalDocumentEditorRequestSaveAsEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSaveAsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectDocument ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectDocumentEvent extends Event {
  static get type(): string {
    return "documenteditorrequestselectdocument"
  }

  #data: DocumentEditorRequestSelectDocumentEventInit["data"]

  get data(): DocumentEditorRequestSelectDocumentEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestSelectDocumentEventInit) {
    super(DocumentEditorRequestSelectDocumentEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSelectDocumentEventInit extends EventInit, DocEditorRequestSelectDocumentEvent {}

export interface DocumentEditorRequestSelectDocumentListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSelectDocumentEvent): void
}

export interface GlobalDocumentEditorRequestSelectDocumentEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSelectDocumentEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSelectSpreadsheet ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSelectSpreadsheetEvent extends Event {
  static get type(): string {
    return "documenteditorrequestselectspreadsheet"
  }

  #data: DocumentEditorRequestSelectSpreadsheetEventInit["data"]

  get data(): DocumentEditorRequestSelectSpreadsheetEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestSelectSpreadsheetEventInit) {
    super(DocumentEditorRequestSelectSpreadsheetEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSelectSpreadsheetEventInit extends EventInit, DocEditorRequestSelectSpreadsheetEvent {}

export interface DocumentEditorRequestSelectSpreadsheetListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSelectSpreadsheetEvent): void
}

export interface GlobalDocumentEditorRequestSelectSpreadsheetEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSelectSpreadsheetEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSendNotify ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSendNotifyEvent extends Event {
  static get type(): string {
    return "documenteditorrequestsendnotify"
  }

  #data: DocumentEditorRequestSendNotifyEventInit["data"]

  get data(): DocumentEditorRequestSendNotifyEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestSendNotifyEventInit) {
    super(DocumentEditorRequestSendNotifyEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestSendNotifyEventInit extends EventInit, DocEditorRequestSendNotifyEvent {}

export interface DocumentEditorRequestSendNotifyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSendNotifyEvent): void
}

export interface GlobalDocumentEditorRequestSendNotifyEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSendNotifyEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestSharingSettings ONLYOFFICE Reference}
 */
export class DocumentEditorRequestSharingSettingsEvent extends Event {
  static get type(): string {
    return "documenteditorrequestsharingsettings"
  }

  constructor(eventInitDict?: EventInit) {
    super(DocumentEditorRequestSharingSettingsEvent.type, eventInitDict)
  }
}

export interface DocumentEditorRequestSharingSettingsListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestSharingSettingsEvent): void
}

export interface GlobalDocumentEditorRequestSharingSettingsEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestSharingSettingsEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onRequestUsers ONLYOFFICE Reference}
 */
export class DocumentEditorRequestUsersEvent extends Event {
  static get type(): string {
    return "documenteditorrequestusers"
  }

  #data: DocumentEditorRequestUsersEventInit["data"]

  get data(): DocumentEditorRequestUsersEventInit["data"] {
    return this.#data
  }

  constructor(eventInitDict: DocumentEditorRequestUsersEventInit) {
    super(DocumentEditorRequestUsersEvent.type, eventInitDict)
    this.#data = eventInitDict.data
  }
}

export interface DocumentEditorRequestUsersEventInit extends EventInit, DocEditorRequestUsersEvent {}

export interface DocumentEditorRequestUsersListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorRequestUsersEvent): void
}

export interface GlobalDocumentEditorRequestUsersEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorRequestUsersEvent): void
}

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onWarning ONLYOFFICE Reference}
 */
export class DocumentEditorWarningEvent extends ErrorEvent {
  static get type(): string {
    return "documenteditorwarning"
  }

  #data?: DocumentEditorWarningEventInit["data"]

  get data(): DocumentEditorWarningEventInit["data"] | undefined {
    return this.#data
  }

  constructor(eventInitDict?: DocumentEditorWarningEventInit) {
    super(DocumentEditorWarningEvent.type, eventInitDict)
    if (eventInitDict) {
      this.#data = eventInitDict.data
    }
  }
}

export interface DocumentEditorWarningEventInit extends ErrorEventInit {
  data?: DocEditorWarningEvent["data"]
}

export interface DocumentEditorWarningListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorWarningEvent): void
}

export interface GlobalDocumentEditorWarningEventHandler {
  (this: GlobalEventHandlers, ev: DocumentEditorWarningEvent): void
}
