/* eslint @stylistic/max-len: ["error", {code: 140}] */

import {
  DocumentEditor,
} from "./element.ts"
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
  DocumentEditorRequestHistoryCloseEvent,
  DocumentEditorRequestHistoryDataEvent,
  DocumentEditorRequestHistoryEvent,
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
  DocumentEditorWarningEvent,
} from "./events.ts"

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
  window.DocumentEditorRequestHistoryCloseEvent = DocumentEditorRequestHistoryCloseEvent
  window.DocumentEditorRequestHistoryDataEvent = DocumentEditorRequestHistoryDataEvent
  window.DocumentEditorRequestHistoryEvent = DocumentEditorRequestHistoryEvent
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
