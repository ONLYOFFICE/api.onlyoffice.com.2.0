/* eslint @stylistic/max-len: ["error", {code: 140}] */

import type {DocumentEditorAttributes} from "./element.ts"
import {DocumentEditor} from "./element.ts"
import type {
  GlobalDocumentEditorAppReadyEventHandler,
  GlobalDocumentEditorCollaborativeChangesEventHandler,
  GlobalDocumentEditorDocumentReadyEventHandler,
  GlobalDocumentEditorDocumentStateChangeEventHandler,
  GlobalDocumentEditorDownloadAsEventHandler,
  GlobalDocumentEditorErrorEventHandler,
  GlobalDocumentEditorInfoEventHandler,
  GlobalDocumentEditorMakeActionLinkEventHandler,
  GlobalDocumentEditorMetaChangeEventHandler,
  GlobalDocumentEditorOutdatedVersionEventHandler,
  GlobalDocumentEditorPluginsReadyEventHandler,
  GlobalDocumentEditorReadyEventHandler,
  GlobalDocumentEditorRequestCloseEventHandler,
  GlobalDocumentEditorRequestCompareFileEventHandler,
  GlobalDocumentEditorRequestCreateNewEventHandler,
  GlobalDocumentEditorRequestEditRightsEventHandler,
  GlobalDocumentEditorRequestHistoryEventHandler,
  GlobalDocumentEditorRequestHistoryCloseEventHandler,
  GlobalDocumentEditorRequestHistoryDataEventHandler,
  GlobalDocumentEditorRequestInsertImageEventHandler,
  GlobalDocumentEditorRequestMailMergeRecipientsEventHandler,
  GlobalDocumentEditorRequestOpenEventHandler,
  GlobalDocumentEditorRequestReferenceDataEventHandler,
  GlobalDocumentEditorRequestReferenceSourceEventHandler,
  GlobalDocumentEditorRequestRenameEventHandler,
  GlobalDocumentEditorRequestRestoreEventHandler,
  GlobalDocumentEditorRequestSaveAsEventHandler,
  GlobalDocumentEditorRequestSelectDocumentEventHandler,
  GlobalDocumentEditorRequestSelectSpreadsheetEventHandler,
  GlobalDocumentEditorRequestSendNotifyEventHandler,
  GlobalDocumentEditorRequestSharingSettingsEventHandler,
  GlobalDocumentEditorRequestUsersEventHandler,
  GlobalDocumentEditorWarningEventHandler
} from "./events.ts"
import {
  DocumentEditorAppReadyEvent,
  DocumentEditorCollaborativeChangesEvent,
  DocumentEditorDocumentReadyEvent,
  DocumentEditorDocumentStateChangeEvent,
  DocumentEditorDownloadAsEvent,
  DocumentEditorErrorEvent,
  DocumentEditorInfoEvent,
  DocumentEditorMakeActionLinkEvent,
  DocumentEditorMetaChangeEvent,
  DocumentEditorOutdatedVersionEvent,
  DocumentEditorPluginsReadyEvent,
  DocumentEditorReadyEvent,
  DocumentEditorRequestCloseEvent,
  DocumentEditorRequestCompareFileEvent,
  DocumentEditorRequestCreateNewEvent,
  DocumentEditorRequestEditRightsEvent,
  DocumentEditorRequestHistoryEvent,
  DocumentEditorRequestHistoryCloseEvent,
  DocumentEditorRequestHistoryDataEvent,
  DocumentEditorRequestInsertImageEvent,
  DocumentEditorRequestMailMergeRecipientsEvent,
  DocumentEditorRequestOpenEvent,
  DocumentEditorRequestReferenceDataEvent,
  DocumentEditorRequestReferenceSourceEvent,
  DocumentEditorRequestRenameEvent,
  DocumentEditorRequestRestoreEvent,
  DocumentEditorRequestSaveAsEvent,
  DocumentEditorRequestSelectDocumentEvent,
  DocumentEditorRequestSelectSpreadsheetEvent,
  DocumentEditorRequestSendNotifyEvent,
  DocumentEditorRequestSharingSettingsEvent,
  DocumentEditorRequestUsersEvent,
  DocumentEditorWarningEvent
} from "./events.ts"

declare global {
  interface Window {
    DocumentEditor: typeof DocumentEditor
    DocumentEditorAppReadyEvent: typeof DocumentEditorAppReadyEvent
    DocumentEditorCollaborativeChangesEvent: typeof DocumentEditorCollaborativeChangesEvent
    DocumentEditorDocumentReadyEvent: typeof DocumentEditorDocumentReadyEvent
    DocumentEditorDocumentStateChangeEvent: typeof DocumentEditorDocumentStateChangeEvent
    DocumentEditorDownloadAsEvent: typeof DocumentEditorDownloadAsEvent
    DocumentEditorErrorEvent: typeof DocumentEditorErrorEvent
    DocumentEditorInfoEvent: typeof DocumentEditorInfoEvent
    DocumentEditorMakeActionLinkEvent: typeof DocumentEditorMakeActionLinkEvent
    DocumentEditorMetaChangeEvent: typeof DocumentEditorMetaChangeEvent
    DocumentEditorOutdatedVersionEvent: typeof DocumentEditorOutdatedVersionEvent
    DocumentEditorPluginsReadyEvent: typeof DocumentEditorPluginsReadyEvent
    DocumentEditorReadyEvent: typeof DocumentEditorReadyEvent
    DocumentEditorRequestCloseEvent: typeof DocumentEditorRequestCloseEvent
    DocumentEditorRequestCompareFileEvent: typeof DocumentEditorRequestCompareFileEvent
    DocumentEditorRequestCreateNewEvent: typeof DocumentEditorRequestCreateNewEvent
    DocumentEditorRequestEditRightsEvent: typeof DocumentEditorRequestEditRightsEvent
    DocumentEditorRequestHistoryEvent: typeof DocumentEditorRequestHistoryEvent
    DocumentEditorRequestHistoryCloseEvent: typeof DocumentEditorRequestHistoryCloseEvent
    DocumentEditorRequestHistoryDataEvent: typeof DocumentEditorRequestHistoryDataEvent
    DocumentEditorRequestInsertImageEvent: typeof DocumentEditorRequestInsertImageEvent
    DocumentEditorRequestMailMergeRecipientsEvent: typeof DocumentEditorRequestMailMergeRecipientsEvent
    DocumentEditorRequestOpenEvent: typeof DocumentEditorRequestOpenEvent
    DocumentEditorRequestReferenceDataEvent: typeof DocumentEditorRequestReferenceDataEvent
    DocumentEditorRequestReferenceSourceEvent: typeof DocumentEditorRequestReferenceSourceEvent
    DocumentEditorRequestRenameEvent: typeof DocumentEditorRequestRenameEvent
    DocumentEditorRequestRestoreEvent: typeof DocumentEditorRequestRestoreEvent
    DocumentEditorRequestSaveAsEvent: typeof DocumentEditorRequestSaveAsEvent
    DocumentEditorRequestSelectDocumentEvent: typeof DocumentEditorRequestSelectDocumentEvent
    DocumentEditorRequestSelectSpreadsheetEvent: typeof DocumentEditorRequestSelectSpreadsheetEvent
    DocumentEditorRequestSendNotifyEvent: typeof DocumentEditorRequestSendNotifyEvent
    DocumentEditorRequestSharingSettingsEvent: typeof DocumentEditorRequestSharingSettingsEvent
    DocumentEditorRequestUsersEvent: typeof DocumentEditorRequestUsersEvent
    DocumentEditorWarningEvent: typeof DocumentEditorWarningEvent
  }

  interface HTMLElementTagNameMap {
    "document-editor": DocumentEditor
  }

  namespace preact {
    namespace JSX {
      interface IntrinsicElements {
        "document-editor": HTMLAttributes<DocumentEditor> & DocumentEditorAttributes
      }
    }
  }

  interface GlobalEventHandlersEventMap {
    documenteditorappready: DocumentEditorAppReadyEvent
    documenteditorcollaborativechanges: DocumentEditorCollaborativeChangesEvent
    documenteditordocumentready: DocumentEditorDocumentReadyEvent
    documenteditordocumentstatechange: DocumentEditorDocumentStateChangeEvent
    documenteditordownloadas: DocumentEditorDownloadAsEvent
    documenteditorerror: DocumentEditorErrorEvent
    documenteditorinfo: DocumentEditorInfoEvent
    documenteditormakeactionlink: DocumentEditorMakeActionLinkEvent
    documenteditormetachange: DocumentEditorMetaChangeEvent
    documenteditoroutdatedversion: DocumentEditorOutdatedVersionEvent
    documenteditorpluginsready: DocumentEditorPluginsReadyEvent
    documenteditorready: DocumentEditorReadyEvent
    documenteditorrequestclose: DocumentEditorRequestCloseEvent
    documenteditorrequestcomparefile: DocumentEditorRequestCompareFileEvent
    documenteditorrequestcreatenew: DocumentEditorRequestCreateNewEvent
    documenteditorrequesteditrights: DocumentEditorRequestEditRightsEvent
    documenteditorrequesthistory: DocumentEditorRequestHistoryEvent
    documenteditorrequesthistoryclose: DocumentEditorRequestHistoryCloseEvent
    documenteditorrequesthistorydata: DocumentEditorRequestHistoryDataEvent
    documenteditorrequestinsertimage: DocumentEditorRequestInsertImageEvent
    documenteditorrequestmailmergerecipients: DocumentEditorRequestMailMergeRecipientsEvent
    documenteditorrequestopen: DocumentEditorRequestOpenEvent
    documenteditorrequestreferencedata: DocumentEditorRequestReferenceDataEvent
    documenteditorrequestreferencesource: DocumentEditorRequestReferenceSourceEvent
    documenteditorrequestrename: DocumentEditorRequestRenameEvent
    documenteditorrequestrestore: DocumentEditorRequestRestoreEvent
    documenteditorrequestsaveas: DocumentEditorRequestSaveAsEvent
    documenteditorrequestselectdocument: DocumentEditorRequestSelectDocumentEvent
    documenteditorrequestselectspreadsheet: DocumentEditorRequestSelectSpreadsheetEvent
    documenteditorrequestsendnotify: DocumentEditorRequestSendNotifyEvent
    documenteditorrequestsharingsettings: DocumentEditorRequestSharingSettingsEvent
    documenteditorrequestusers: DocumentEditorRequestUsersEvent
    documenteditorwarning: DocumentEditorWarningEvent
  }

  interface GlobalEventHandlers {
    ondocumenteditorappready: GlobalDocumentEditorAppReadyEventHandler | null
    ondocumenteditorcollaborativechanges: GlobalDocumentEditorCollaborativeChangesEventHandler | null
    ondocumenteditordocumentready: GlobalDocumentEditorDocumentReadyEventHandler | null
    ondocumenteditordocumentstatechange: GlobalDocumentEditorDocumentStateChangeEventHandler | null
    ondocumenteditordownloadas: GlobalDocumentEditorDownloadAsEventHandler | null
    ondocumenteditorerror: GlobalDocumentEditorErrorEventHandler | null
    ondocumenteditorinfo: GlobalDocumentEditorInfoEventHandler | null
    ondocumenteditormakeactionlink: GlobalDocumentEditorMakeActionLinkEventHandler | null
    ondocumenteditormetachange: GlobalDocumentEditorMetaChangeEventHandler | null
    ondocumenteditoroutdatedversion: GlobalDocumentEditorOutdatedVersionEventHandler | null
    ondocumenteditorpluginsready: GlobalDocumentEditorPluginsReadyEventHandler | null
    ondocumenteditorready: GlobalDocumentEditorReadyEventHandler | null
    ondocumenteditorrequestclose: GlobalDocumentEditorRequestCloseEventHandler | null
    ondocumenteditorrequestcomparefile: GlobalDocumentEditorRequestCompareFileEventHandler | null
    ondocumenteditorrequestcreatenew: GlobalDocumentEditorRequestCreateNewEventHandler | null
    ondocumenteditorrequesteditrights: GlobalDocumentEditorRequestEditRightsEventHandler | null
    ondocumenteditorrequesthistory: GlobalDocumentEditorRequestHistoryEventHandler | null
    ondocumenteditorrequesthistoryclose: GlobalDocumentEditorRequestHistoryCloseEventHandler | null
    ondocumenteditorrequesthistorydata: GlobalDocumentEditorRequestHistoryDataEventHandler | null
    ondocumenteditorrequestinsertimage: GlobalDocumentEditorRequestInsertImageEventHandler | null
    ondocumenteditorrequestmailmergerecipients: GlobalDocumentEditorRequestMailMergeRecipientsEventHandler | null
    ondocumenteditorrequestopen: GlobalDocumentEditorRequestOpenEventHandler | null
    ondocumenteditorrequestreferencedata: GlobalDocumentEditorRequestReferenceDataEventHandler | null
    ondocumenteditorrequestreferencesource: GlobalDocumentEditorRequestReferenceSourceEventHandler | null
    ondocumenteditorrequestrename: GlobalDocumentEditorRequestRenameEventHandler | null
    ondocumenteditorrequestrestore: GlobalDocumentEditorRequestRestoreEventHandler | null
    ondocumenteditorrequestsaveas: GlobalDocumentEditorRequestSaveAsEventHandler | null
    ondocumenteditorrequestselectdocument: GlobalDocumentEditorRequestSelectDocumentEventHandler | null
    ondocumenteditorrequestselectspreadsheet: GlobalDocumentEditorRequestSelectSpreadsheetEventHandler | null
    ondocumenteditorrequestsendnotify: GlobalDocumentEditorRequestSendNotifyEventHandler | null
    ondocumenteditorrequestsharingsettings: GlobalDocumentEditorRequestSharingSettingsEventHandler | null
    ondocumenteditorrequestusers: GlobalDocumentEditorRequestUsersEventHandler | null
    ondocumenteditorwarning: GlobalDocumentEditorWarningEventHandler | null
  }
}

export function define(): void {
  if (window.customElements.get(DocumentEditor.tagName)) {
    return
  }
  window.DocumentEditor = DocumentEditor
  window.customElements.define(DocumentEditor.tagName, DocumentEditor)
  window.DocumentEditorAppReadyEvent = DocumentEditorAppReadyEvent
  window.DocumentEditorCollaborativeChangesEvent = DocumentEditorCollaborativeChangesEvent
  window.DocumentEditorDocumentReadyEvent = DocumentEditorDocumentReadyEvent
  window.DocumentEditorDocumentStateChangeEvent = DocumentEditorDocumentStateChangeEvent
  window.DocumentEditorDownloadAsEvent = DocumentEditorDownloadAsEvent
  window.DocumentEditorErrorEvent = DocumentEditorErrorEvent
  window.DocumentEditorInfoEvent = DocumentEditorInfoEvent
  window.DocumentEditorMakeActionLinkEvent = DocumentEditorMakeActionLinkEvent
  window.DocumentEditorMetaChangeEvent = DocumentEditorMetaChangeEvent
  window.DocumentEditorOutdatedVersionEvent = DocumentEditorOutdatedVersionEvent
  window.DocumentEditorPluginsReadyEvent = DocumentEditorPluginsReadyEvent
  window.DocumentEditorReadyEvent = DocumentEditorReadyEvent
  window.DocumentEditorRequestCloseEvent = DocumentEditorRequestCloseEvent
  window.DocumentEditorRequestCompareFileEvent = DocumentEditorRequestCompareFileEvent
  window.DocumentEditorRequestCreateNewEvent = DocumentEditorRequestCreateNewEvent
  window.DocumentEditorRequestEditRightsEvent = DocumentEditorRequestEditRightsEvent
  window.DocumentEditorRequestHistoryEvent = DocumentEditorRequestHistoryEvent
  window.DocumentEditorRequestHistoryCloseEvent = DocumentEditorRequestHistoryCloseEvent
  window.DocumentEditorRequestHistoryDataEvent = DocumentEditorRequestHistoryDataEvent
  window.DocumentEditorRequestInsertImageEvent = DocumentEditorRequestInsertImageEvent
  window.DocumentEditorRequestMailMergeRecipientsEvent = DocumentEditorRequestMailMergeRecipientsEvent
  window.DocumentEditorRequestOpenEvent = DocumentEditorRequestOpenEvent
  window.DocumentEditorRequestReferenceDataEvent = DocumentEditorRequestReferenceDataEvent
  window.DocumentEditorRequestReferenceSourceEvent = DocumentEditorRequestReferenceSourceEvent
  window.DocumentEditorRequestRenameEvent = DocumentEditorRequestRenameEvent
  window.DocumentEditorRequestRestoreEvent = DocumentEditorRequestRestoreEvent
  window.DocumentEditorRequestSaveAsEvent = DocumentEditorRequestSaveAsEvent
  window.DocumentEditorRequestSelectDocumentEvent = DocumentEditorRequestSelectDocumentEvent
  window.DocumentEditorRequestSelectSpreadsheetEvent = DocumentEditorRequestSelectSpreadsheetEvent
  window.DocumentEditorRequestSendNotifyEvent = DocumentEditorRequestSendNotifyEvent
  window.DocumentEditorRequestSharingSettingsEvent = DocumentEditorRequestSharingSettingsEvent
  window.DocumentEditorRequestUsersEvent = DocumentEditorRequestUsersEvent
  window.DocumentEditorWarningEvent = DocumentEditorWarningEvent
}
