/* eslint @stylistic/max-len: ["error", {code: 140}] */
import type {
  DocEditor,
  DocEditorConfig,
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
import {uniqueString} from "@onlyoffice/unique-string"

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
        "document-editor": Partial<Omit<DocumentEditor, keyof HTMLElement>> & JSXBase["span"]
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
    // todo
  }
}

function main(): void {
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

export type DocumentEditorConfig = Omit<DocEditorConfig, "events">

export class DocumentEditor extends HTMLElement {
  static get tagName(): string {
    return "document-editor"
  }

  #documentServerURL: string = ""

  get documentServerURL(): string {
    return this.#documentServerURL
  }

  set documentServerURL(u: string) {
    this.#documentServerURL = u
  }

  #config: DocumentEditorConfig | null = null

  get config(): DocumentEditorConfig | null {
    return this.#config
  }

  set config(c: DocumentEditorConfig | null) {
    this.#config = c
  }

  #editor: DocEditor | null = null

  get editor(): DocEditor | null {
    return this.#editor
  }

  // todo?: map methods from the this.#editor

  #ondocumenteditorappready: DocumentEditorAppReadyListener | null = null

  get ondocumenteditorappready(): DocumentEditorAppReadyListener | null {
    return this.#ondocumenteditorappready
  }

  set ondocumenteditorappready(l: DocumentEditorAppReadyListener | null) {
    if (this.#ondocumenteditorappready) {
      this.removeEventListener(DocumentEditorAppReadyEvent.type, this.#ondocumenteditorappready)
    }
    this.#ondocumenteditorappready = l
    if (this.#ondocumenteditorappready) {
      this.addEventListener(DocumentEditorAppReadyEvent.type, this.#ondocumenteditorappready)
    }
  }

  #ondocumenteditorcollaborativechanges: DocumentEditorCollaborativeChangesListener | null = null

  get ondocumenteditorcollaborativechanges(): DocumentEditorCollaborativeChangesListener | null {
    return this.#ondocumenteditorcollaborativechanges
  }

  set ondocumenteditorcollaborativechanges(l: DocumentEditorCollaborativeChangesListener | null) {
    if (this.#ondocumenteditorcollaborativechanges) {
      this.removeEventListener(DocumentEditorCollaborativeChangesEvent.type, this.#ondocumenteditorcollaborativechanges)
    }
    this.#ondocumenteditorcollaborativechanges = l
    if (this.#ondocumenteditorcollaborativechanges) {
      this.addEventListener(DocumentEditorCollaborativeChangesEvent.type, this.#ondocumenteditorcollaborativechanges)
    }
  }

  #ondocumenteditordocumentready: DocumentEditorDocumentReadyListener | null = null

  get ondocumenteditordocumentready(): DocumentEditorDocumentReadyListener | null {
    return this.#ondocumenteditordocumentready
  }

  set ondocumenteditordocumentready(l: DocumentEditorDocumentReadyListener | null) {
    if (this.#ondocumenteditordocumentready) {
      this.removeEventListener(DocumentEditorDocumentReadyEvent.type, this.#ondocumenteditordocumentready)
    }
    this.#ondocumenteditordocumentready = l
    if (this.#ondocumenteditordocumentready) {
      this.addEventListener(DocumentEditorDocumentReadyEvent.type, this.#ondocumenteditordocumentready)
    }
  }

  #ondocumenteditordocumentstatechange: DocumentEditorDocumentStateChangeListener | null = null

  get ondocumenteditordocumentstatechange(): DocumentEditorDocumentStateChangeListener | null {
    return this.#ondocumenteditordocumentstatechange
  }

  set ondocumenteditordocumentstatechange(l: DocumentEditorDocumentStateChangeListener | null) {
    if (this.#ondocumenteditordocumentstatechange) {
      this.removeEventListener(DocumentEditorDocumentStateChangeEvent.type, this.#ondocumenteditordocumentstatechange)
    }
    this.#ondocumenteditordocumentstatechange = l
    if (this.#ondocumenteditordocumentstatechange) {
      this.addEventListener(DocumentEditorDocumentStateChangeEvent.type, this.#ondocumenteditordocumentstatechange)
    }
  }

  #ondocumenteditordownloadas: DocumentEditorDownloadAsListener | null = null

  get ondocumenteditordownloadas(): DocumentEditorDownloadAsListener | null {
    return this.#ondocumenteditordownloadas
  }

  set ondocumenteditordownloadas(l: DocumentEditorDownloadAsListener | null) {
    if (this.#ondocumenteditordownloadas) {
      this.removeEventListener(DocumentEditorDownloadAsEvent.type, this.#ondocumenteditordownloadas)
    }
    this.#ondocumenteditordownloadas = l
    if (this.#ondocumenteditordownloadas) {
      this.addEventListener(DocumentEditorDownloadAsEvent.type, this.#ondocumenteditordownloadas)
    }
  }

  #ondocumenteditorerror: DocumentEditorErrorListener | null = null

  get ondocumenteditorerror(): DocumentEditorErrorListener | null {
    return this.#ondocumenteditorerror
  }

  set ondocumenteditorerror(l: DocumentEditorErrorListener | null) {
    if (this.#ondocumenteditorerror) {
      this.removeEventListener(DocumentEditorErrorEvent.type, this.#ondocumenteditorerror)
    }
    this.#ondocumenteditorerror = l
    if (this.#ondocumenteditorerror) {
      this.addEventListener(DocumentEditorErrorEvent.type, this.#ondocumenteditorerror)
    }
  }

  #ondocumenteditorinfo: DocumentEditorInfoListener | null = null

  get ondocumenteditorinfo(): DocumentEditorInfoListener | null {
    return this.#ondocumenteditorinfo
  }

  set ondocumenteditorinfo(l: DocumentEditorInfoListener | null) {
    if (this.#ondocumenteditorinfo) {
      this.removeEventListener(DocumentEditorInfoEvent.type, this.#ondocumenteditorinfo)
    }
    this.#ondocumenteditorinfo = l
    if (this.#ondocumenteditorinfo) {
      this.addEventListener(DocumentEditorInfoEvent.type, this.#ondocumenteditorinfo)
    }
  }

  #ondocumenteditormakeactionlink: DocumentEditorMakeActionLinkListener | null = null

  get ondocumenteditormakeactionlink(): DocumentEditorMakeActionLinkListener | null {
    return this.#ondocumenteditormakeactionlink
  }

  set ondocumenteditormakeactionlink(l: DocumentEditorMakeActionLinkListener | null) {
    if (this.#ondocumenteditormakeactionlink) {
      this.removeEventListener(DocumentEditorMakeActionLinkEvent.type, this.#ondocumenteditormakeactionlink)
    }
    this.#ondocumenteditormakeactionlink = l
    if (this.#ondocumenteditormakeactionlink) {
      this.addEventListener(DocumentEditorMakeActionLinkEvent.type, this.#ondocumenteditormakeactionlink)
    }
  }

  #ondocumenteditormetachange: DocumentEditorMetaChangeListener | null = null

  get ondocumenteditormetachange(): DocumentEditorMetaChangeListener | null {
    return this.#ondocumenteditormetachange
  }

  set ondocumenteditormetachange(l: DocumentEditorMetaChangeListener | null) {
    if (this.#ondocumenteditormetachange) {
      this.removeEventListener(DocumentEditorMetaChangeEvent.type, this.#ondocumenteditormetachange)
    }
    this.#ondocumenteditormetachange = l
    if (this.#ondocumenteditormetachange) {
      this.addEventListener(DocumentEditorMetaChangeEvent.type, this.#ondocumenteditormetachange)
    }
  }

  #ondocumenteditoroutdatedversion: DocumentEditorOutdatedVersionListener | null = null

  get ondocumenteditoroutdatedversion(): DocumentEditorOutdatedVersionListener | null {
    return this.#ondocumenteditoroutdatedversion
  }

  set ondocumenteditoroutdatedversion(l: DocumentEditorOutdatedVersionListener | null) {
    if (this.#ondocumenteditoroutdatedversion) {
      this.removeEventListener(DocumentEditorOutdatedVersionEvent.type, this.#ondocumenteditoroutdatedversion)
    }
    this.#ondocumenteditoroutdatedversion = l
    if (this.#ondocumenteditoroutdatedversion) {
      this.addEventListener(DocumentEditorOutdatedVersionEvent.type, this.#ondocumenteditoroutdatedversion)
    }
  }

  #ondocumenteditorpluginsready: DocumentEditorPluginsReadyListener | null = null

  get ondocumenteditorpluginsready(): DocumentEditorPluginsReadyListener | null {
    return this.#ondocumenteditorpluginsready
  }

  set ondocumenteditorpluginsready(l: DocumentEditorPluginsReadyListener | null) {
    if (this.#ondocumenteditorpluginsready) {
      this.removeEventListener(DocumentEditorPluginsReadyEvent.type, this.#ondocumenteditorpluginsready)
    }
    this.#ondocumenteditorpluginsready = l
    if (this.#ondocumenteditorpluginsready) {
      this.addEventListener(DocumentEditorPluginsReadyEvent.type, this.#ondocumenteditorpluginsready)
    }
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorappready} instead.
   */
  #ondocumenteditorready: DocumentEditorReadyListener | null = null

  /**
   * @deprecated Prefer {@link ondocumenteditorappready} instead.
   */
  get ondocumenteditorready(): DocumentEditorReadyListener | null {
    return this.#ondocumenteditorready
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorappready} instead.
   */
  set ondocumenteditorready(l: DocumentEditorReadyListener | null) {
    if (this.#ondocumenteditorready) {
      this.removeEventListener(DocumentEditorReadyEvent.type, this.#ondocumenteditorready)
    }
    this.#ondocumenteditorready = l
    if (this.#ondocumenteditorready) {
      this.addEventListener(DocumentEditorReadyEvent.type, this.#ondocumenteditorready)
    }
  }

  #ondocumenteditorrequestclose: DocumentEditorRequestCloseListener | null = null

  get ondocumenteditorrequestclose(): DocumentEditorRequestCloseListener | null {
    return this.#ondocumenteditorrequestclose
  }

  set ondocumenteditorrequestclose(l: DocumentEditorRequestCloseListener | null) {
    if (this.#ondocumenteditorrequestclose) {
      this.removeEventListener(DocumentEditorRequestCloseEvent.type, this.#ondocumenteditorrequestclose)
    }
    this.#ondocumenteditorrequestclose = l
    if (this.#ondocumenteditorrequestclose) {
      this.addEventListener(DocumentEditorRequestCloseEvent.type, this.#ondocumenteditorrequestclose)
    }
  }

  #ondocumenteditorrequestcomparefile: DocumentEditorRequestCompareFileListener | null = null

  get ondocumenteditorrequestcomparefile(): DocumentEditorRequestCompareFileListener | null {
    return this.#ondocumenteditorrequestcomparefile
  }

  set ondocumenteditorrequestcomparefile(l: DocumentEditorRequestCompareFileListener | null) {
    if (this.#ondocumenteditorrequestcomparefile) {
      this.removeEventListener(DocumentEditorRequestCompareFileEvent.type, this.#ondocumenteditorrequestcomparefile)
    }
    this.#ondocumenteditorrequestcomparefile = l
    if (this.#ondocumenteditorrequestcomparefile) {
      this.addEventListener(DocumentEditorRequestCompareFileEvent.type, this.#ondocumenteditorrequestcomparefile)
    }
  }

  #ondocumenteditorrequestcreatenew: DocumentEditorRequestCreateNewListener | null = null

  get ondocumenteditorrequestcreatenew(): DocumentEditorRequestCreateNewListener | null {
    return this.#ondocumenteditorrequestcreatenew
  }

  set ondocumenteditorrequestcreatenew(l: DocumentEditorRequestCreateNewListener | null) {
    if (this.#ondocumenteditorrequestcreatenew) {
      this.removeEventListener(DocumentEditorRequestCreateNewEvent.type, this.#ondocumenteditorrequestcreatenew)
    }
    this.#ondocumenteditorrequestcreatenew = l
    if (this.#ondocumenteditorrequestcreatenew) {
      this.addEventListener(DocumentEditorRequestCreateNewEvent.type, this.#ondocumenteditorrequestcreatenew)
    }
  }

  #ondocumenteditorrequesteditrights: DocumentEditorRequestEditRightsListener | null = null

  get ondocumenteditorrequesteditrights(): DocumentEditorRequestEditRightsListener | null {
    return this.#ondocumenteditorrequesteditrights
  }

  set ondocumenteditorrequesteditrights(l: DocumentEditorRequestEditRightsListener | null) {
    if (this.#ondocumenteditorrequesteditrights) {
      this.removeEventListener(DocumentEditorRequestEditRightsEvent.type, this.#ondocumenteditorrequesteditrights)
    }
    this.#ondocumenteditorrequesteditrights = l
    if (this.#ondocumenteditorrequesteditrights) {
      this.addEventListener(DocumentEditorRequestEditRightsEvent.type, this.#ondocumenteditorrequesteditrights)
    }
  }

  #ondocumenteditorrequesthistory: DocumentEditorRequestHistoryListener | null = null

  get ondocumenteditorrequesthistory(): DocumentEditorRequestHistoryListener | null {
    return this.#ondocumenteditorrequesthistory
  }

  set ondocumenteditorrequesthistory(l: DocumentEditorRequestHistoryListener | null) {
    if (this.#ondocumenteditorrequesthistory) {
      this.removeEventListener(DocumentEditorRequestHistoryEvent.type, this.#ondocumenteditorrequesthistory)
    }
    this.#ondocumenteditorrequesthistory = l
    if (this.#ondocumenteditorrequesthistory) {
      this.addEventListener(DocumentEditorRequestHistoryEvent.type, this.#ondocumenteditorrequesthistory)
    }
  }

  #ondocumenteditorrequesthistoryclose: DocumentEditorRequestHistoryCloseListener | null = null

  get ondocumenteditorrequesthistoryclose(): DocumentEditorRequestHistoryCloseListener | null {
    return this.#ondocumenteditorrequesthistoryclose
  }

  set ondocumenteditorrequesthistoryclose(l: DocumentEditorRequestHistoryCloseListener | null) {
    if (this.#ondocumenteditorrequesthistoryclose) {
      this.removeEventListener(DocumentEditorRequestHistoryCloseEvent.type, this.#ondocumenteditorrequesthistoryclose)
    }
    this.#ondocumenteditorrequesthistoryclose = l
    if (this.#ondocumenteditorrequesthistoryclose) {
      this.addEventListener(DocumentEditorRequestHistoryCloseEvent.type, this.#ondocumenteditorrequesthistoryclose)
    }
  }

  #ondocumenteditorrequesthistorydata: DocumentEditorRequestHistoryDataListener | null = null

  get ondocumenteditorrequesthistorydata(): DocumentEditorRequestHistoryDataListener | null {
    return this.#ondocumenteditorrequesthistorydata
  }

  set ondocumenteditorrequesthistorydata(l: DocumentEditorRequestHistoryDataListener | null) {
    if (this.#ondocumenteditorrequesthistorydata) {
      this.removeEventListener(DocumentEditorRequestHistoryDataEvent.type, this.#ondocumenteditorrequesthistorydata)
    }
    this.#ondocumenteditorrequesthistorydata = l
    if (this.#ondocumenteditorrequesthistorydata) {
      this.addEventListener(DocumentEditorRequestHistoryDataEvent.type, this.#ondocumenteditorrequesthistorydata)
    }
  }

  #ondocumenteditorrequestinsertimage: DocumentEditorRequestInsertImageListener | null = null

  get ondocumenteditorrequestinsertimage(): DocumentEditorRequestInsertImageListener | null {
    return this.#ondocumenteditorrequestinsertimage
  }

  set ondocumenteditorrequestinsertimage(l: DocumentEditorRequestInsertImageListener | null) {
    if (this.#ondocumenteditorrequestinsertimage) {
      this.removeEventListener(DocumentEditorRequestInsertImageEvent.type, this.#ondocumenteditorrequestinsertimage)
    }
    this.#ondocumenteditorrequestinsertimage = l
    if (this.#ondocumenteditorrequestinsertimage) {
      this.addEventListener(DocumentEditorRequestInsertImageEvent.type, this.#ondocumenteditorrequestinsertimage)
    }
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorrequestselectspreadsheet} instead.
   */
  #ondocumenteditorrequestmailmergerecipients: DocumentEditorRequestMailMergeRecipientsListener | null = null

  /**
   * @deprecated Prefer {@link ondocumenteditorrequestselectspreadsheet} instead.
   */
  get ondocumenteditorrequestmailmergerecipients(): DocumentEditorRequestMailMergeRecipientsListener | null {
    return this.#ondocumenteditorrequestmailmergerecipients
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorrequestselectspreadsheet} instead.
   */
  set ondocumenteditorrequestmailmergerecipients(l: DocumentEditorRequestMailMergeRecipientsListener | null) {
    if (this.#ondocumenteditorrequestmailmergerecipients) {
      this.removeEventListener(DocumentEditorRequestMailMergeRecipientsEvent.type, this.#ondocumenteditorrequestmailmergerecipients)
    }
    this.#ondocumenteditorrequestmailmergerecipients = l
    if (this.#ondocumenteditorrequestmailmergerecipients) {
      this.addEventListener(DocumentEditorRequestMailMergeRecipientsEvent.type, this.#ondocumenteditorrequestmailmergerecipients)
    }
  }

  #ondocumenteditorrequestopen: DocumentEditorRequestOpenListener | null = null

  get ondocumenteditorrequestopen(): DocumentEditorRequestOpenListener | null {
    return this.#ondocumenteditorrequestopen
  }

  set ondocumenteditorrequestopen(l: DocumentEditorRequestOpenListener | null) {
    if (this.#ondocumenteditorrequestopen) {
      this.removeEventListener(DocumentEditorRequestOpenEvent.type, this.#ondocumenteditorrequestopen)
    }
    this.#ondocumenteditorrequestopen = l
    if (this.#ondocumenteditorrequestopen) {
      this.addEventListener(DocumentEditorRequestOpenEvent.type, this.#ondocumenteditorrequestopen)
    }
  }

  #ondocumenteditorrequestreferencedata: DocumentEditorRequestReferenceDataListener | null = null

  get ondocumenteditorrequestreferencedata(): DocumentEditorRequestReferenceDataListener | null {
    return this.#ondocumenteditorrequestreferencedata
  }

  set ondocumenteditorrequestreferencedata(l: DocumentEditorRequestReferenceDataListener | null) {
    if (this.#ondocumenteditorrequestreferencedata) {
      this.removeEventListener(DocumentEditorRequestReferenceDataEvent.type, this.#ondocumenteditorrequestreferencedata)
    }
    this.#ondocumenteditorrequestreferencedata = l
    if (this.#ondocumenteditorrequestreferencedata) {
      this.addEventListener(DocumentEditorRequestReferenceDataEvent.type, this.#ondocumenteditorrequestreferencedata)
    }
  }

  #ondocumenteditorrequestreferencesource: DocumentEditorRequestReferenceSourceListener | null = null

  get ondocumenteditorrequestreferencesource(): DocumentEditorRequestReferenceSourceListener | null {
    return this.#ondocumenteditorrequestreferencesource
  }

  set ondocumenteditorrequestreferencesource(l: DocumentEditorRequestReferenceSourceListener | null) {
    if (this.#ondocumenteditorrequestreferencesource) {
      this.removeEventListener(DocumentEditorRequestReferenceSourceEvent.type, this.#ondocumenteditorrequestreferencesource)
    }
    this.#ondocumenteditorrequestreferencesource = l
    if (this.#ondocumenteditorrequestreferencesource) {
      this.addEventListener(DocumentEditorRequestReferenceSourceEvent.type, this.#ondocumenteditorrequestreferencesource)
    }
  }

  #ondocumenteditorrequestrename: DocumentEditorRequestRenameListener | null = null

  get ondocumenteditorrequestrename(): DocumentEditorRequestRenameListener | null {
    return this.#ondocumenteditorrequestrename
  }

  set ondocumenteditorrequestrename(l: DocumentEditorRequestRenameListener | null) {
    if (this.#ondocumenteditorrequestrename) {
      this.removeEventListener(DocumentEditorRequestRenameEvent.type, this.#ondocumenteditorrequestrename)
    }
    this.#ondocumenteditorrequestrename = l
    if (this.#ondocumenteditorrequestrename) {
      this.addEventListener(DocumentEditorRequestRenameEvent.type, this.#ondocumenteditorrequestrename)
    }
  }

  #ondocumenteditorrequestrestore: DocumentEditorRequestRestoreListener | null = null

  get ondocumenteditorrequestrestore(): DocumentEditorRequestRestoreListener | null {
    return this.#ondocumenteditorrequestrestore
  }

  set ondocumenteditorrequestrestore(l: DocumentEditorRequestRestoreListener | null) {
    if (this.#ondocumenteditorrequestrestore) {
      this.removeEventListener(DocumentEditorRequestRestoreEvent.type, this.#ondocumenteditorrequestrestore)
    }
    this.#ondocumenteditorrequestrestore = l
    if (this.#ondocumenteditorrequestrestore) {
      this.addEventListener(DocumentEditorRequestRestoreEvent.type, this.#ondocumenteditorrequestrestore)
    }
  }

  #ondocumenteditorrequestsaveas: DocumentEditorRequestSaveAsListener | null = null

  get ondocumenteditorrequestsaveas(): DocumentEditorRequestSaveAsListener | null {
    return this.#ondocumenteditorrequestsaveas
  }

  set ondocumenteditorrequestsaveas(l: DocumentEditorRequestSaveAsListener | null) {
    if (this.#ondocumenteditorrequestsaveas) {
      this.removeEventListener(DocumentEditorRequestSaveAsEvent.type, this.#ondocumenteditorrequestsaveas)
    }
    this.#ondocumenteditorrequestsaveas = l
    if (this.#ondocumenteditorrequestsaveas) {
      this.addEventListener(DocumentEditorRequestSaveAsEvent.type, this.#ondocumenteditorrequestsaveas)
    }
  }

  #ondocumenteditorrequestselectdocument: DocumentEditorRequestSelectDocumentListener | null = null

  get ondocumenteditorrequestselectdocument(): DocumentEditorRequestSelectDocumentListener | null {
    return this.#ondocumenteditorrequestselectdocument
  }

  set ondocumenteditorrequestselectdocument(l: DocumentEditorRequestSelectDocumentListener | null) {
    if (this.#ondocumenteditorrequestselectdocument) {
      this.removeEventListener(DocumentEditorRequestSelectDocumentEvent.type, this.#ondocumenteditorrequestselectdocument)
    }
    this.#ondocumenteditorrequestselectdocument = l
    if (this.#ondocumenteditorrequestselectdocument) {
      this.addEventListener(DocumentEditorRequestSelectDocumentEvent.type, this.#ondocumenteditorrequestselectdocument)
    }
  }

  #ondocumenteditorrequestselectspreadsheet: DocumentEditorRequestSelectSpreadsheetListener | null = null

  get ondocumenteditorrequestselectspreadsheet(): DocumentEditorRequestSelectSpreadsheetListener | null {
    return this.#ondocumenteditorrequestselectspreadsheet
  }

  set ondocumenteditorrequestselectspreadsheet(l: DocumentEditorRequestSelectSpreadsheetListener | null) {
    if (this.#ondocumenteditorrequestselectspreadsheet) {
      this.removeEventListener(DocumentEditorRequestSelectSpreadsheetEvent.type, this.#ondocumenteditorrequestselectspreadsheet)
    }
    this.#ondocumenteditorrequestselectspreadsheet = l
    if (this.#ondocumenteditorrequestselectspreadsheet) {
      this.addEventListener(DocumentEditorRequestSelectSpreadsheetEvent.type, this.#ondocumenteditorrequestselectspreadsheet)
    }
  }

  #ondocumenteditorrequestsendnotify: DocumentEditorRequestSendNotifyListener | null = null

  get ondocumenteditorrequestsendnotify(): DocumentEditorRequestSendNotifyListener | null {
    return this.#ondocumenteditorrequestsendnotify
  }

  set ondocumenteditorrequestsendnotify(l: DocumentEditorRequestSendNotifyListener | null) {
    if (this.#ondocumenteditorrequestsendnotify) {
      this.removeEventListener(DocumentEditorRequestSendNotifyEvent.type, this.#ondocumenteditorrequestsendnotify)
    }
    this.#ondocumenteditorrequestsendnotify = l
    if (this.#ondocumenteditorrequestsendnotify) {
      this.addEventListener(DocumentEditorRequestSendNotifyEvent.type, this.#ondocumenteditorrequestsendnotify)
    }
  }

  #ondocumenteditorrequestsharingsettings: DocumentEditorRequestSharingSettingsListener | null = null

  get ondocumenteditorrequestsharingsettings(): DocumentEditorRequestSharingSettingsListener | null {
    return this.#ondocumenteditorrequestsharingsettings
  }

  set ondocumenteditorrequestsharingsettings(l: DocumentEditorRequestSharingSettingsListener | null) {
    if (this.#ondocumenteditorrequestsharingsettings) {
      this.removeEventListener(DocumentEditorRequestSharingSettingsEvent.type, this.#ondocumenteditorrequestsharingsettings)
    }
    this.#ondocumenteditorrequestsharingsettings = l
    if (this.#ondocumenteditorrequestsharingsettings) {
      this.addEventListener(DocumentEditorRequestSharingSettingsEvent.type, this.#ondocumenteditorrequestsharingsettings)
    }
  }

  #ondocumenteditorrequestusers: DocumentEditorRequestUsersListener | null = null

  get ondocumenteditorrequestusers(): DocumentEditorRequestUsersListener | null {
    return this.#ondocumenteditorrequestusers
  }

  set ondocumenteditorrequestusers(l: DocumentEditorRequestUsersListener | null) {
    if (this.#ondocumenteditorrequestusers) {
      this.removeEventListener(DocumentEditorRequestUsersEvent.type, this.#ondocumenteditorrequestusers)
    }
    this.#ondocumenteditorrequestusers = l
    if (this.#ondocumenteditorrequestusers) {
      this.addEventListener(DocumentEditorRequestUsersEvent.type, this.#ondocumenteditorrequestusers)
    }
  }

  #ondocumenteditorwarning: DocumentEditorWarningListener | null = null

  get ondocumenteditorwarning(): DocumentEditorWarningListener | null {
    return this.#ondocumenteditorwarning
  }

  set ondocumenteditorwarning(l: DocumentEditorWarningListener | null) {
    if (this.#ondocumenteditorwarning) {
      this.removeEventListener(DocumentEditorWarningEvent.type, this.#ondocumenteditorwarning)
    }
    this.#ondocumenteditorwarning = l
    if (this.#ondocumenteditorwarning) {
      this.addEventListener(DocumentEditorWarningEvent.type, this.#ondocumenteditorwarning)
    }
  }

  static get observedAttributes(): string[] {
    return [
      "document-server-url",
      "config",
      "ondocumenteditorappready",
      "ondocumenteditorcollaborativechanges",
      "ondocumenteditordocumentready",
      "ondocumenteditordocumentstatechange",
      "ondocumenteditordownloadas",
      "ondocumenteditorerror",
      "ondocumenteditorinfo",
      "ondocumenteditormakeactionlink",
      "ondocumenteditormetachange",
      "ondocumenteditoroutdatedversion",
      "ondocumenteditorpluginsready",
      "ondocumenteditorready",
      "ondocumenteditorrequestclose",
      "ondocumenteditorrequestcomparefile",
      "ondocumenteditorrequestcreatenew",
      "ondocumenteditorrequesteditrights",
      "ondocumenteditorrequesthistory",
      "ondocumenteditorrequesthistoryclose",
      "ondocumenteditorrequesthistorydata",
      "ondocumenteditorrequestinsertimage",
      "ondocumenteditorrequestmailmergerecipients",
      "ondocumenteditorrequestopen",
      "ondocumenteditorrequestreferencedata",
      "ondocumenteditorrequestreferencesource",
      "ondocumenteditorrequestrename",
      "ondocumenteditorrequestrestore",
      "ondocumenteditorrequestsaveas",
      "ondocumenteditorrequestselectdocument",
      "ondocumenteditorrequestselectspreadsheet",
      "ondocumenteditorrequestsendnotify",
      "ondocumenteditorrequestsharingsettings",
      "ondocumenteditorrequestusers",
      "ondocumenteditorwarning"
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "document-server-url":
      this.documentServerURL = v
      break
    case "config":
      this.config = JSON.parse(v) as DocumentEditorConfig
      break
    case "ondocumenteditorappready":
      this.ondocumenteditorappready = new Function("event", v) as DocumentEditorAppReadyListener
      break
    case "ondocumenteditorcollaborativechanges":
      this.ondocumenteditorcollaborativechanges = new Function("event", v) as DocumentEditorCollaborativeChangesListener
      break
    case "ondocumenteditordocumentready":
      this.ondocumenteditordocumentready = new Function("event", v) as DocumentEditorDocumentReadyListener
      break
    case "ondocumenteditordocumentstatechange":
      this.ondocumenteditordocumentstatechange = new Function("event", v) as DocumentEditorDocumentStateChangeListener
      break
    case "ondocumenteditordownloadas":
      this.ondocumenteditordownloadas = new Function("event", v) as DocumentEditorDownloadAsListener
      break
    case "ondocumenteditorerror":
      this.ondocumenteditorerror = new Function("event", v) as DocumentEditorErrorListener
      break
    case "ondocumenteditorinfo":
      this.ondocumenteditorinfo = new Function("event", v) as DocumentEditorInfoListener
      break
    case "ondocumenteditormakeactionlink":
      this.ondocumenteditormakeactionlink = new Function("event", v) as DocumentEditorMakeActionLinkListener
      break
    case "ondocumenteditormetachange":
      this.ondocumenteditormetachange = new Function("event", v) as DocumentEditorMetaChangeListener
      break
    case "ondocumenteditoroutdatedversion":
      this.ondocumenteditoroutdatedversion = new Function("event", v) as DocumentEditorOutdatedVersionListener
      break
    case "ondocumenteditorpluginsready":
      this.ondocumenteditorpluginsready = new Function("event", v) as DocumentEditorPluginsReadyListener
      break
    case "ondocumenteditorready":
      this.ondocumenteditorready = new Function("event", v) as DocumentEditorReadyListener
      break
    case "ondocumenteditorrequestclose":
      this.ondocumenteditorrequestclose = new Function("event", v) as DocumentEditorRequestCloseListener
      break
    case "ondocumenteditorrequestcomparefile":
      this.ondocumenteditorrequestcomparefile = new Function("event", v) as DocumentEditorRequestCompareFileListener
      break
    case "ondocumenteditorrequestcreatenew":
      this.ondocumenteditorrequestcreatenew = new Function("event", v) as DocumentEditorRequestCreateNewListener
      break
    case "ondocumenteditorrequesteditrights":
      this.ondocumenteditorrequesteditrights = new Function("event", v) as DocumentEditorRequestEditRightsListener
      break
    case "ondocumenteditorrequesthistory":
      this.ondocumenteditorrequesthistory = new Function("event", v) as DocumentEditorRequestHistoryListener
      break
    case "ondocumenteditorrequesthistoryclose":
      this.ondocumenteditorrequesthistoryclose = new Function("event", v) as DocumentEditorRequestHistoryCloseListener
      break
    case "ondocumenteditorrequesthistorydata":
      this.ondocumenteditorrequesthistorydata = new Function("event", v) as DocumentEditorRequestHistoryDataListener
      break
    case "ondocumenteditorrequestinsertimage":
      this.ondocumenteditorrequestinsertimage = new Function("event", v) as DocumentEditorRequestInsertImageListener
      break
    case "ondocumenteditorrequestmailmergerecipients":
      this.ondocumenteditorrequestmailmergerecipients = new Function("event", v) as DocumentEditorRequestMailMergeRecipientsListener
      break
    case "ondocumenteditorrequestopen":
      this.ondocumenteditorrequestopen = new Function("event", v) as DocumentEditorRequestOpenListener
      break
    case "ondocumenteditorrequestreferencedata":
      this.ondocumenteditorrequestreferencedata = new Function("event", v) as DocumentEditorRequestReferenceDataListener
      break
    case "ondocumenteditorrequestreferencesource":
      this.ondocumenteditorrequestreferencesource = new Function("event", v) as DocumentEditorRequestReferenceSourceListener
      break
    case "ondocumenteditorrequestrename":
      this.ondocumenteditorrequestrename = new Function("event", v) as DocumentEditorRequestRenameListener
      break
    case "ondocumenteditorrequestrestore":
      this.ondocumenteditorrequestrestore = new Function("event", v) as DocumentEditorRequestRestoreListener
      break
    case "ondocumenteditorrequestsaveas":
      this.ondocumenteditorrequestsaveas = new Function("event", v) as DocumentEditorRequestSaveAsListener
      break
    case "ondocumenteditorrequestselectdocument":
      this.ondocumenteditorrequestselectdocument = new Function("event", v) as DocumentEditorRequestSelectDocumentListener
      break
    case "ondocumenteditorrequestselectspreadsheet":
      this.ondocumenteditorrequestselectspreadsheet = new Function("event", v) as DocumentEditorRequestSelectSpreadsheetListener
      break
    case "ondocumenteditorrequestsendnotify":
      this.ondocumenteditorrequestsendnotify = new Function("event", v) as DocumentEditorRequestSendNotifyListener
      break
    case "ondocumenteditorrequestsharingsettings":
      this.ondocumenteditorrequestsharingsettings = new Function("event", v) as DocumentEditorRequestSharingSettingsListener
      break
    case "ondocumenteditorrequestusers":
      this.ondocumenteditorrequestusers = new Function("event", v) as DocumentEditorRequestUsersListener
      break
    case "ondocumenteditorwarning":
      this.ondocumenteditorwarning = new Function("event", v) as DocumentEditorWarningListener
      break
    default:
      throw new Error(`The attribute '${n}' is not supported`)
    }
  }

  connectedCallback(): void {
    try {
      const p = this.#createPlaceholder()
      const s = this.#createScript(p)
      this.append(p, s)
    } catch (er) {
      let m = ""
      if (er instanceof Error) {
        m = er.message
      }
      const ev = new DocumentEditorErrorEvent({error: er, message: m})
      this.dispatchEvent(ev)
    }
  }

  #createPlaceholder(): HTMLElement {
    const e = document.createElement("div")
    e.id = this.#placeholderID()
    e.textContent = "Waiting for the Document Editor API to load..."
    e.style.border = "0"
    e.style.clipPath = "rect(0, 0, 0, 0)"
    e.style.height = "1px"
    e.style.overflow = "hidden"
    e.style.overflowWrap = "normal"
    e.style.padding = "0"
    e.style.position = "absolute"
    e.style.width = "1px"
    return e
  }

  #placeholderID(): string {
    return `${uniqueString()}-placeholder`
  }

  #createScript(p: HTMLElement): HTMLScriptElement {
    const u = this.#scriptSource()
    const c = this.#scriptConfig()
    const s = document.createElement("script")
    s.async = true
    s.src = u
    s.addEventListener("error", () => {
      const er = new Error(`Failed to load the Document Editor API script from '${u}'`)
      const ev = new DocumentEditorErrorEvent({error: er, message: er.message})
      this.dispatchEvent(ev)
    })
    s.addEventListener("load", () => {
      if (!window.DocsAPI) {
        const er = new Error("The Document Editor API is not defined")
        const ev = new DocumentEditorErrorEvent({error: er, message: er.message})
        this.dispatchEvent(ev)
        return
      }
      this.#editor = window.DocsAPI.DocEditor(p.id, c)
    })
    return s
  }

  #scriptSource(): string {
    const u = this.#documentServerURL
    if (u === "") {
      throw new Error("The attribute 'document-server-url' is required, but it is missing")
    }
    if (!u.endsWith("/")) {
      throw new Error("The attribute 'document-server-url' must have a trailing slash, but it does not")
    }
    return `${u}web-apps/apps/api/documents/api.js`
  }

  #scriptConfig(): DocEditorConfig {
    const c = this.#config
    if (!c) {
      throw new Error("The attribute 'config' is required, but it is missing")
    }
    return {
      ...c,
      events: {
        onAppReady: () => {
          const e = new DocumentEditorAppReadyEvent()
          this.dispatchEvent(e)
        },
        onCollaborativeChanges: () => {
          const e = new DocumentEditorCollaborativeChangesEvent()
          this.dispatchEvent(e)
        },
        onDocumentReady: () => {
          const e = new DocumentEditorDocumentReadyEvent()
          this.dispatchEvent(e)
        },
        onDocumentStateChange: (ev) => {
          const e = new DocumentEditorDocumentStateChangeEvent(ev)
          this.dispatchEvent(e)
        },
        onDownloadAs: (ev) => {
          const e = new DocumentEditorDownloadAsEvent(ev)
          this.dispatchEvent(e)
        },
        onError: (ev) => {
          const er = new Error(`${ev.data.errorDescription} (${ev.data.errorCode})`)
          const e = new DocumentEditorErrorEvent({...ev, error: er, message: er.message})
          this.dispatchEvent(e)
        },
        onInfo: (ev) => {
          const e = new DocumentEditorInfoEvent(ev)
          this.dispatchEvent(e)
        },
        onMakeActionLink: (ev) => {
          const e = new DocumentEditorMakeActionLinkEvent(ev)
          this.dispatchEvent(e)
        },
        onMetaChange: (ev) => {
          const e = new DocumentEditorMetaChangeEvent(ev)
          this.dispatchEvent(e)
        },
        onOutdatedVersion: () => {
          const e = new DocumentEditorOutdatedVersionEvent()
          this.dispatchEvent(e)
        },
        onPluginsReady: () => {
          const e = new DocumentEditorPluginsReadyEvent()
          this.dispatchEvent(e)
        },
        onReady: () => {
          const e = new DocumentEditorReadyEvent()
          this.dispatchEvent(e)
        },
        onRequestClose: () => {
          const e = new DocumentEditorRequestCloseEvent()
          this.dispatchEvent(e)
        },
        onRequestCompareFile: () => {
          const e = new DocumentEditorRequestCompareFileEvent()
          this.dispatchEvent(e)
        },
        onRequestCreateNew: () => {
          const e = new DocumentEditorRequestCreateNewEvent()
          this.dispatchEvent(e)
        },
        onRequestEditRights: () => {
          const e = new DocumentEditorRequestEditRightsEvent()
          this.dispatchEvent(e)
        },
        onRequestHistory: () => {
          const e = new DocumentEditorRequestHistoryEvent()
          this.dispatchEvent(e)
        },
        onRequestHistoryClose: () => {
          const e = new DocumentEditorRequestHistoryCloseEvent()
          this.dispatchEvent(e)
        },
        onRequestHistoryData: (ev) => {
          const e = new DocumentEditorRequestHistoryDataEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestInsertImage: (ev) => {
          const e = new DocumentEditorRequestInsertImageEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestMailMergeRecipients: () => {
          const e = new DocumentEditorRequestMailMergeRecipientsEvent()
          this.dispatchEvent(e)
        },
        onRequestOpen: (ev) => {
          const e = new DocumentEditorRequestOpenEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestReferenceData: (ev) => {
          const e = new DocumentEditorRequestReferenceDataEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestReferenceSource: (ev) => {
          const e = new DocumentEditorRequestReferenceSourceEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestRename: (ev) => {
          const e = new DocumentEditorRequestRenameEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestRestore: (ev) => {
          const e = new DocumentEditorRequestRestoreEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestSaveAs: (ev) => {
          const e = new DocumentEditorRequestSaveAsEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestSelectDocument: (ev) => {
          const e = new DocumentEditorRequestSelectDocumentEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestSelectSpreadsheet: (ev) => {
          const e = new DocumentEditorRequestSelectSpreadsheetEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestSendNotify: (ev) => {
          const e = new DocumentEditorRequestSendNotifyEvent(ev)
          this.dispatchEvent(e)
        },
        onRequestSharingSettings: () => {
          const e = new DocumentEditorRequestSharingSettingsEvent()
          this.dispatchEvent(e)
        },
        onRequestUsers: (ev) => {
          const e = new DocumentEditorRequestUsersEvent(ev)
          this.dispatchEvent(e)
        },
        onWarning: (ev) => {
          const er = new Error(`${ev.data.warningDescription} (${ev.data.warningCode})`)
          const e = new DocumentEditorWarningEvent({...ev, error: er, message: er.message})
          this.dispatchEvent(e)
        }
      }
    }
  }

  reload(): void {
    // or reuse events?
    if (!window.DocsAPI) {
      throw new Error("The Document Editor API is not defined")
    }
    const p = this.querySelector("[id$=-placeholder]")
    if (!p) {
      throw new Error("The placeholder element is missing")
    }
    p.id = this.#placeholderID()
    const c = this.#scriptConfig()
    this.#editor = window.DocsAPI.DocEditor(p.id, c)
  }
}

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

/**
 * {@link https://api.onlyoffice.com/editors/config/events#onReady ONLYOFFICE Reference}
 * @deprecated Use {@link DocumentEditorAppReadyEvent} instead
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
 * @deprecated Use {@link DocumentEditorAppReadyListener} instead
 */
export interface DocumentEditorReadyListener extends EventListener {
  (this: DocumentEditor, event: DocumentEditorReadyEvent): void
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

main()
