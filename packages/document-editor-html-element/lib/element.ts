/* eslint-disable @typescript-eslint/no-implied-eval, no-new-func */
/* eslint @stylistic/max-len: ["error", {code: 140}] */

// todo: replace uniqueString with something else
// todo: rewrite this using the https://github.com/vanyauhalin/some-container-html-element-template/
// todo: remove the on* listeners (from properties) on disconnect? (need to research)
// todo: complete the implementation of the DocumentEditorEventList class to fit the DOMTokenList interface
// todo: add the event attribute similar to the class attribute (continuation of the previous todo)
// todo: add comments to all of them, including deprecation notices
// todo: add exports, types fields to the package.json
// todo: add @since tags to all of them

import {
  type DocEditor,
  type DocEditorConfig,
  type DocEditorConfigEvents,
  type DocEditorConfigurableOptions,
} from "@onlyoffice/document-server-types"
import {
  uniqueString,
} from "@onlyoffice/strings"
import {
  DocumentEditorAppReadyEvent,
  type DocumentEditorAppReadyEventListener,
  DocumentEditorCollaborativeChangesEvent,
  type DocumentEditorCollaborativeChangesEventListener,
  DocumentEditorDocumentReadyEvent,
  type DocumentEditorDocumentReadyEventListener,
  DocumentEditorDocumentStateChangeEvent,
  type DocumentEditorDocumentStateChangeEventListener,
  DocumentEditorDownloadAsEvent,
  type DocumentEditorDownloadAsEventListener,
  DocumentEditorErrorEvent,
  type DocumentEditorErrorEventListener,
  DocumentEditorInfoEvent,
  type DocumentEditorInfoEventListener,
  DocumentEditorMakeActionLinkEvent,
  type DocumentEditorMakeActionLinkEventListener,
  DocumentEditorMetaChangeEvent,
  type DocumentEditorMetaChangeEventListener,
  DocumentEditorOutdatedVersionEvent,
  type DocumentEditorOutdatedVersionEventListener,
  DocumentEditorPluginsReadyEvent,
  type DocumentEditorPluginsReadyEventListener,
  DocumentEditorReadyEvent,
  type DocumentEditorReadyEventListener,
  DocumentEditorRequestCloseEvent,
  type DocumentEditorRequestCloseEventListener,
  DocumentEditorRequestCompareFileEvent,
  type DocumentEditorRequestCompareFileEventListener,
  DocumentEditorRequestCreateNewEvent,
  type DocumentEditorRequestCreateNewEventListener,
  DocumentEditorRequestEditRightsEvent,
  type DocumentEditorRequestEditRightsEventListener,
  DocumentEditorRequestHistoryCloseEvent,
  type DocumentEditorRequestHistoryCloseEventListener,
  DocumentEditorRequestHistoryDataEvent,
  type DocumentEditorRequestHistoryDataEventListener,
  DocumentEditorRequestHistoryEvent,
  type DocumentEditorRequestHistoryEventListener,
  DocumentEditorRequestInsertImageEvent,
  type DocumentEditorRequestInsertImageEventListener,
  DocumentEditorRequestMailMergeRecipientsEvent,
  type DocumentEditorRequestMailMergeRecipientsEventListener,
  DocumentEditorRequestOpenEvent,
  type DocumentEditorRequestOpenEventListener,
  DocumentEditorRequestReferenceDataEvent,
  type DocumentEditorRequestReferenceDataEventListener,
  DocumentEditorRequestReferenceSourceEvent,
  type DocumentEditorRequestReferenceSourceEventListener,
  DocumentEditorRequestRenameEvent,
  type DocumentEditorRequestRenameEventListener,
  DocumentEditorRequestRestoreEvent,
  type DocumentEditorRequestRestoreEventListener,
  DocumentEditorRequestSaveAsEvent,
  type DocumentEditorRequestSaveAsEventListener,
  DocumentEditorRequestSelectDocumentEvent,
  type DocumentEditorRequestSelectDocumentEventListener,
  DocumentEditorRequestSelectSpreadsheetEvent,
  type DocumentEditorRequestSelectSpreadsheetEventListener,
  DocumentEditorRequestSendNotifyEvent,
  type DocumentEditorRequestSendNotifyEventListener,
  DocumentEditorRequestSharingSettingsEvent,
  type DocumentEditorRequestSharingSettingsEventListener,
  DocumentEditorRequestUsersEvent,
  type DocumentEditorRequestUsersEventListener,
  DocumentEditorWarningEvent,
  type DocumentEditorWarningEventListener,
} from "./events.ts"
import {
  type DocumentEditorAttributeName,
  type DocumentEditorEventListenerName,
  type DocumentEditorEventType,
} from "./types.ts"

export type DocumentEditorConfig = DocEditorConfigurableOptions

export class DocumentEditor extends HTMLElement {
  static get tagName(): "document-editor" {
    return "document-editor"
  }

  static isDocumentEditorEventType(u: unknown): u is DocumentEditorEventType {
    return this.eventTypes.includes(u as DocumentEditorEventType)
  }

  static get eventTypes(): DocumentEditorEventType[] {
    return [
      "documenteditorappready",
      "documenteditorcollaborativechanges",
      "documenteditordocumentready",
      "documenteditordocumentstatechange",
      "documenteditordownloadas",
      "documenteditorerror",
      "documenteditorinfo",
      "documenteditormakeactionlink",
      "documenteditormetachange",
      "documenteditoroutdatedversion",
      "documenteditorpluginsready",
      "documenteditorready",
      "documenteditorrequestclose",
      "documenteditorrequestcomparefile",
      "documenteditorrequestcreatenew",
      "documenteditorrequesteditrights",
      "documenteditorrequesthistory",
      "documenteditorrequesthistoryclose",
      "documenteditorrequesthistorydata",
      "documenteditorrequestinsertimage",
      "documenteditorrequestmailmergerecipients",
      "documenteditorrequestopen",
      "documenteditorrequestreferencedata",
      "documenteditorrequestreferencesource",
      "documenteditorrequestrename",
      "documenteditorrequestrestore",
      "documenteditorrequestsaveas",
      "documenteditorrequestselectdocument",
      "documenteditorrequestselectspreadsheet",
      "documenteditorrequestsendnotify",
      "documenteditorrequestsharingsettings",
      "documenteditorrequestusers",
      "documenteditorwarning",
    ]
  }

  static isDocumentEditorEventHandlerName(u: unknown): u is DocumentEditorEventListenerName {
    return this.eventHandlerNames.includes(u as DocumentEditorEventListenerName)
  }

  static get eventHandlerNames(): DocumentEditorEventListenerName[] {
    return [
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
      "ondocumenteditorwarning",
    ]
  }

  #documentServerUrl = ""

  get documentServerUrl(): string {
    return this.#documentServerUrl
  }

  set documentServerUrl(u: string) {
    this.#documentServerUrl = u
  }

  #config: DocumentEditorConfig | null = null

  get config(): DocumentEditorConfig | null {
    return this.#config
  }

  set config(c: DocumentEditorConfig | null) {
    this.#config = c
  }

  #eventList = new DocumentEditorEventList()

  get eventList(): DocumentEditorEventList {
    return this.#eventList
  }

  #editor: DocEditor | null = null

  get editor(): DocEditor | null {
    return this.#editor
  }

  // todo?: map methods from the this.#editor

  #ondocumenteditorappready: DocumentEditorAppReadyEventListener | null = null

  get ondocumenteditorappready(): DocumentEditorAppReadyEventListener | null {
    return this.#ondocumenteditorappready
  }

  set ondocumenteditorappready(l: DocumentEditorAppReadyEventListener | null) {
    if (this.#ondocumenteditorappready) {
      this.removeEventListener(DocumentEditorAppReadyEvent.type, this.#ondocumenteditorappready)
    }
    this.#ondocumenteditorappready = l
    if (this.#ondocumenteditorappready) {
      this.addEventListener(DocumentEditorAppReadyEvent.type, this.#ondocumenteditorappready)
    }
  }

  #ondocumenteditorcollaborativechanges: DocumentEditorCollaborativeChangesEventListener | null = null

  get ondocumenteditorcollaborativechanges(): DocumentEditorCollaborativeChangesEventListener | null {
    return this.#ondocumenteditorcollaborativechanges
  }

  set ondocumenteditorcollaborativechanges(l: DocumentEditorCollaborativeChangesEventListener | null) {
    if (this.#ondocumenteditorcollaborativechanges) {
      this.removeEventListener(DocumentEditorCollaborativeChangesEvent.type, this.#ondocumenteditorcollaborativechanges)
    }
    this.#ondocumenteditorcollaborativechanges = l
    if (this.#ondocumenteditorcollaborativechanges) {
      this.addEventListener(DocumentEditorCollaborativeChangesEvent.type, this.#ondocumenteditorcollaborativechanges)
    }
  }

  #ondocumenteditordocumentready: DocumentEditorDocumentReadyEventListener | null = null

  get ondocumenteditordocumentready(): DocumentEditorDocumentReadyEventListener | null {
    return this.#ondocumenteditordocumentready
  }

  set ondocumenteditordocumentready(l: DocumentEditorDocumentReadyEventListener | null) {
    if (this.#ondocumenteditordocumentready) {
      this.removeEventListener(DocumentEditorDocumentReadyEvent.type, this.#ondocumenteditordocumentready)
    }
    this.#ondocumenteditordocumentready = l
    if (this.#ondocumenteditordocumentready) {
      this.addEventListener(DocumentEditorDocumentReadyEvent.type, this.#ondocumenteditordocumentready)
    }
  }

  #ondocumenteditordocumentstatechange: DocumentEditorDocumentStateChangeEventListener | null = null

  get ondocumenteditordocumentstatechange(): DocumentEditorDocumentStateChangeEventListener | null {
    return this.#ondocumenteditordocumentstatechange
  }

  set ondocumenteditordocumentstatechange(l: DocumentEditorDocumentStateChangeEventListener | null) {
    if (this.#ondocumenteditordocumentstatechange) {
      this.removeEventListener(DocumentEditorDocumentStateChangeEvent.type, this.#ondocumenteditordocumentstatechange)
    }
    this.#ondocumenteditordocumentstatechange = l
    if (this.#ondocumenteditordocumentstatechange) {
      this.addEventListener(DocumentEditorDocumentStateChangeEvent.type, this.#ondocumenteditordocumentstatechange)
    }
  }

  #ondocumenteditordownloadas: DocumentEditorDownloadAsEventListener | null = null

  get ondocumenteditordownloadas(): DocumentEditorDownloadAsEventListener | null {
    return this.#ondocumenteditordownloadas
  }

  set ondocumenteditordownloadas(l: DocumentEditorDownloadAsEventListener | null) {
    if (this.#ondocumenteditordownloadas) {
      this.removeEventListener(DocumentEditorDownloadAsEvent.type, this.#ondocumenteditordownloadas)
    }
    this.#ondocumenteditordownloadas = l
    if (this.#ondocumenteditordownloadas) {
      this.addEventListener(DocumentEditorDownloadAsEvent.type, this.#ondocumenteditordownloadas)
    }
  }

  #ondocumenteditorerror: DocumentEditorErrorEventListener | null = null

  get ondocumenteditorerror(): DocumentEditorErrorEventListener | null {
    return this.#ondocumenteditorerror
  }

  set ondocumenteditorerror(l: DocumentEditorErrorEventListener | null) {
    if (this.#ondocumenteditorerror) {
      this.removeEventListener(DocumentEditorErrorEvent.type, this.#ondocumenteditorerror)
    }
    this.#ondocumenteditorerror = l
    if (this.#ondocumenteditorerror) {
      this.addEventListener(DocumentEditorErrorEvent.type, this.#ondocumenteditorerror)
    }
  }

  #ondocumenteditorinfo: DocumentEditorInfoEventListener | null = null

  get ondocumenteditorinfo(): DocumentEditorInfoEventListener | null {
    return this.#ondocumenteditorinfo
  }

  set ondocumenteditorinfo(l: DocumentEditorInfoEventListener | null) {
    if (this.#ondocumenteditorinfo) {
      this.removeEventListener(DocumentEditorInfoEvent.type, this.#ondocumenteditorinfo)
    }
    this.#ondocumenteditorinfo = l
    if (this.#ondocumenteditorinfo) {
      this.addEventListener(DocumentEditorInfoEvent.type, this.#ondocumenteditorinfo)
    }
  }

  #ondocumenteditormakeactionlink: DocumentEditorMakeActionLinkEventListener | null = null

  get ondocumenteditormakeactionlink(): DocumentEditorMakeActionLinkEventListener | null {
    return this.#ondocumenteditormakeactionlink
  }

  set ondocumenteditormakeactionlink(l: DocumentEditorMakeActionLinkEventListener | null) {
    if (this.#ondocumenteditormakeactionlink) {
      this.removeEventListener(DocumentEditorMakeActionLinkEvent.type, this.#ondocumenteditormakeactionlink)
    }
    this.#ondocumenteditormakeactionlink = l
    if (this.#ondocumenteditormakeactionlink) {
      this.addEventListener(DocumentEditorMakeActionLinkEvent.type, this.#ondocumenteditormakeactionlink)
    }
  }

  #ondocumenteditormetachange: DocumentEditorMetaChangeEventListener | null = null

  get ondocumenteditormetachange(): DocumentEditorMetaChangeEventListener | null {
    return this.#ondocumenteditormetachange
  }

  set ondocumenteditormetachange(l: DocumentEditorMetaChangeEventListener | null) {
    if (this.#ondocumenteditormetachange) {
      this.removeEventListener(DocumentEditorMetaChangeEvent.type, this.#ondocumenteditormetachange)
    }
    this.#ondocumenteditormetachange = l
    if (this.#ondocumenteditormetachange) {
      this.addEventListener(DocumentEditorMetaChangeEvent.type, this.#ondocumenteditormetachange)
    }
  }

  #ondocumenteditoroutdatedversion: DocumentEditorOutdatedVersionEventListener | null = null

  get ondocumenteditoroutdatedversion(): DocumentEditorOutdatedVersionEventListener | null {
    return this.#ondocumenteditoroutdatedversion
  }

  set ondocumenteditoroutdatedversion(l: DocumentEditorOutdatedVersionEventListener | null) {
    if (this.#ondocumenteditoroutdatedversion) {
      this.removeEventListener(DocumentEditorOutdatedVersionEvent.type, this.#ondocumenteditoroutdatedversion)
    }
    this.#ondocumenteditoroutdatedversion = l
    if (this.#ondocumenteditoroutdatedversion) {
      this.addEventListener(DocumentEditorOutdatedVersionEvent.type, this.#ondocumenteditoroutdatedversion)
    }
  }

  #ondocumenteditorpluginsready: DocumentEditorPluginsReadyEventListener | null = null

  get ondocumenteditorpluginsready(): DocumentEditorPluginsReadyEventListener | null {
    return this.#ondocumenteditorpluginsready
  }

  set ondocumenteditorpluginsready(l: DocumentEditorPluginsReadyEventListener | null) {
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
  #ondocumenteditorready: DocumentEditorReadyEventListener | null = null

  /**
   * @deprecated Prefer {@link ondocumenteditorappready} instead.
   */
  get ondocumenteditorready(): DocumentEditorReadyEventListener | null {
    return this.#ondocumenteditorready
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorappready} instead.
   */
  set ondocumenteditorready(l: DocumentEditorReadyEventListener | null) {
    if (this.#ondocumenteditorready) {
      this.removeEventListener(DocumentEditorReadyEvent.type, this.#ondocumenteditorready)
    }
    this.#ondocumenteditorready = l
    if (this.#ondocumenteditorready) {
      this.addEventListener(DocumentEditorReadyEvent.type, this.#ondocumenteditorready)
    }
  }

  #ondocumenteditorrequestclose: DocumentEditorRequestCloseEventListener | null = null

  get ondocumenteditorrequestclose(): DocumentEditorRequestCloseEventListener | null {
    return this.#ondocumenteditorrequestclose
  }

  set ondocumenteditorrequestclose(l: DocumentEditorRequestCloseEventListener | null) {
    if (this.#ondocumenteditorrequestclose) {
      this.removeEventListener(DocumentEditorRequestCloseEvent.type, this.#ondocumenteditorrequestclose)
    }
    this.#ondocumenteditorrequestclose = l
    if (this.#ondocumenteditorrequestclose) {
      this.addEventListener(DocumentEditorRequestCloseEvent.type, this.#ondocumenteditorrequestclose)
    }
  }

  #ondocumenteditorrequestcomparefile: DocumentEditorRequestCompareFileEventListener | null = null

  get ondocumenteditorrequestcomparefile(): DocumentEditorRequestCompareFileEventListener | null {
    return this.#ondocumenteditorrequestcomparefile
  }

  set ondocumenteditorrequestcomparefile(l: DocumentEditorRequestCompareFileEventListener | null) {
    if (this.#ondocumenteditorrequestcomparefile) {
      this.removeEventListener(DocumentEditorRequestCompareFileEvent.type, this.#ondocumenteditorrequestcomparefile)
    }
    this.#ondocumenteditorrequestcomparefile = l
    if (this.#ondocumenteditorrequestcomparefile) {
      this.addEventListener(DocumentEditorRequestCompareFileEvent.type, this.#ondocumenteditorrequestcomparefile)
    }
  }

  #ondocumenteditorrequestcreatenew: DocumentEditorRequestCreateNewEventListener | null = null

  get ondocumenteditorrequestcreatenew(): DocumentEditorRequestCreateNewEventListener | null {
    return this.#ondocumenteditorrequestcreatenew
  }

  set ondocumenteditorrequestcreatenew(l: DocumentEditorRequestCreateNewEventListener | null) {
    if (this.#ondocumenteditorrequestcreatenew) {
      this.removeEventListener(DocumentEditorRequestCreateNewEvent.type, this.#ondocumenteditorrequestcreatenew)
    }
    this.#ondocumenteditorrequestcreatenew = l
    if (this.#ondocumenteditorrequestcreatenew) {
      this.addEventListener(DocumentEditorRequestCreateNewEvent.type, this.#ondocumenteditorrequestcreatenew)
    }
  }

  #ondocumenteditorrequesteditrights: DocumentEditorRequestEditRightsEventListener | null = null

  get ondocumenteditorrequesteditrights(): DocumentEditorRequestEditRightsEventListener | null {
    return this.#ondocumenteditorrequesteditrights
  }

  set ondocumenteditorrequesteditrights(l: DocumentEditorRequestEditRightsEventListener | null) {
    if (this.#ondocumenteditorrequesteditrights) {
      this.removeEventListener(DocumentEditorRequestEditRightsEvent.type, this.#ondocumenteditorrequesteditrights)
    }
    this.#ondocumenteditorrequesteditrights = l
    if (this.#ondocumenteditorrequesteditrights) {
      this.addEventListener(DocumentEditorRequestEditRightsEvent.type, this.#ondocumenteditorrequesteditrights)
    }
  }

  #ondocumenteditorrequesthistory: DocumentEditorRequestHistoryEventListener | null = null

  get ondocumenteditorrequesthistory(): DocumentEditorRequestHistoryEventListener | null {
    return this.#ondocumenteditorrequesthistory
  }

  set ondocumenteditorrequesthistory(l: DocumentEditorRequestHistoryEventListener | null) {
    if (this.#ondocumenteditorrequesthistory) {
      this.removeEventListener(DocumentEditorRequestHistoryEvent.type, this.#ondocumenteditorrequesthistory)
    }
    this.#ondocumenteditorrequesthistory = l
    if (this.#ondocumenteditorrequesthistory) {
      this.addEventListener(DocumentEditorRequestHistoryEvent.type, this.#ondocumenteditorrequesthistory)
    }
  }

  #ondocumenteditorrequesthistoryclose: DocumentEditorRequestHistoryCloseEventListener | null = null

  get ondocumenteditorrequesthistoryclose(): DocumentEditorRequestHistoryCloseEventListener | null {
    return this.#ondocumenteditorrequesthistoryclose
  }

  set ondocumenteditorrequesthistoryclose(l: DocumentEditorRequestHistoryCloseEventListener | null) {
    if (this.#ondocumenteditorrequesthistoryclose) {
      this.removeEventListener(DocumentEditorRequestHistoryCloseEvent.type, this.#ondocumenteditorrequesthistoryclose)
    }
    this.#ondocumenteditorrequesthistoryclose = l
    if (this.#ondocumenteditorrequesthistoryclose) {
      this.addEventListener(DocumentEditorRequestHistoryCloseEvent.type, this.#ondocumenteditorrequesthistoryclose)
    }
  }

  #ondocumenteditorrequesthistorydata: DocumentEditorRequestHistoryDataEventListener | null = null

  get ondocumenteditorrequesthistorydata(): DocumentEditorRequestHistoryDataEventListener | null {
    return this.#ondocumenteditorrequesthistorydata
  }

  set ondocumenteditorrequesthistorydata(l: DocumentEditorRequestHistoryDataEventListener | null) {
    if (this.#ondocumenteditorrequesthistorydata) {
      this.removeEventListener(DocumentEditorRequestHistoryDataEvent.type, this.#ondocumenteditorrequesthistorydata)
    }
    this.#ondocumenteditorrequesthistorydata = l
    if (this.#ondocumenteditorrequesthistorydata) {
      this.addEventListener(DocumentEditorRequestHistoryDataEvent.type, this.#ondocumenteditorrequesthistorydata)
    }
  }

  #ondocumenteditorrequestinsertimage: DocumentEditorRequestInsertImageEventListener | null = null

  get ondocumenteditorrequestinsertimage(): DocumentEditorRequestInsertImageEventListener | null {
    return this.#ondocumenteditorrequestinsertimage
  }

  set ondocumenteditorrequestinsertimage(l: DocumentEditorRequestInsertImageEventListener | null) {
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
  #ondocumenteditorrequestmailmergerecipients: DocumentEditorRequestMailMergeRecipientsEventListener | null = null

  /**
   * @deprecated Prefer {@link ondocumenteditorrequestselectspreadsheet} instead.
   */
  get ondocumenteditorrequestmailmergerecipients(): DocumentEditorRequestMailMergeRecipientsEventListener | null {
    return this.#ondocumenteditorrequestmailmergerecipients
  }

  /**
   * @deprecated Prefer {@link ondocumenteditorrequestselectspreadsheet} instead.
   */
  set ondocumenteditorrequestmailmergerecipients(l: DocumentEditorRequestMailMergeRecipientsEventListener | null) {
    if (this.#ondocumenteditorrequestmailmergerecipients) {
      this.removeEventListener(DocumentEditorRequestMailMergeRecipientsEvent.type, this.#ondocumenteditorrequestmailmergerecipients)
    }
    this.#ondocumenteditorrequestmailmergerecipients = l
    if (this.#ondocumenteditorrequestmailmergerecipients) {
      this.addEventListener(DocumentEditorRequestMailMergeRecipientsEvent.type, this.#ondocumenteditorrequestmailmergerecipients)
    }
  }

  #ondocumenteditorrequestopen: DocumentEditorRequestOpenEventListener | null = null

  get ondocumenteditorrequestopen(): DocumentEditorRequestOpenEventListener | null {
    return this.#ondocumenteditorrequestopen
  }

  set ondocumenteditorrequestopen(l: DocumentEditorRequestOpenEventListener | null) {
    if (this.#ondocumenteditorrequestopen) {
      this.removeEventListener(DocumentEditorRequestOpenEvent.type, this.#ondocumenteditorrequestopen)
    }
    this.#ondocumenteditorrequestopen = l
    if (this.#ondocumenteditorrequestopen) {
      this.addEventListener(DocumentEditorRequestOpenEvent.type, this.#ondocumenteditorrequestopen)
    }
  }

  #ondocumenteditorrequestreferencedata: DocumentEditorRequestReferenceDataEventListener | null = null

  get ondocumenteditorrequestreferencedata(): DocumentEditorRequestReferenceDataEventListener | null {
    return this.#ondocumenteditorrequestreferencedata
  }

  set ondocumenteditorrequestreferencedata(l: DocumentEditorRequestReferenceDataEventListener | null) {
    if (this.#ondocumenteditorrequestreferencedata) {
      this.removeEventListener(DocumentEditorRequestReferenceDataEvent.type, this.#ondocumenteditorrequestreferencedata)
    }
    this.#ondocumenteditorrequestreferencedata = l
    if (this.#ondocumenteditorrequestreferencedata) {
      this.addEventListener(DocumentEditorRequestReferenceDataEvent.type, this.#ondocumenteditorrequestreferencedata)
    }
  }

  #ondocumenteditorrequestreferencesource: DocumentEditorRequestReferenceSourceEventListener | null = null

  get ondocumenteditorrequestreferencesource(): DocumentEditorRequestReferenceSourceEventListener | null {
    return this.#ondocumenteditorrequestreferencesource
  }

  set ondocumenteditorrequestreferencesource(l: DocumentEditorRequestReferenceSourceEventListener | null) {
    if (this.#ondocumenteditorrequestreferencesource) {
      this.removeEventListener(DocumentEditorRequestReferenceSourceEvent.type, this.#ondocumenteditorrequestreferencesource)
    }
    this.#ondocumenteditorrequestreferencesource = l
    if (this.#ondocumenteditorrequestreferencesource) {
      this.addEventListener(DocumentEditorRequestReferenceSourceEvent.type, this.#ondocumenteditorrequestreferencesource)
    }
  }

  #ondocumenteditorrequestrename: DocumentEditorRequestRenameEventListener | null = null

  get ondocumenteditorrequestrename(): DocumentEditorRequestRenameEventListener | null {
    return this.#ondocumenteditorrequestrename
  }

  set ondocumenteditorrequestrename(l: DocumentEditorRequestRenameEventListener | null) {
    if (this.#ondocumenteditorrequestrename) {
      this.removeEventListener(DocumentEditorRequestRenameEvent.type, this.#ondocumenteditorrequestrename)
    }
    this.#ondocumenteditorrequestrename = l
    if (this.#ondocumenteditorrequestrename) {
      this.addEventListener(DocumentEditorRequestRenameEvent.type, this.#ondocumenteditorrequestrename)
    }
  }

  #ondocumenteditorrequestrestore: DocumentEditorRequestRestoreEventListener | null = null

  get ondocumenteditorrequestrestore(): DocumentEditorRequestRestoreEventListener | null {
    return this.#ondocumenteditorrequestrestore
  }

  set ondocumenteditorrequestrestore(l: DocumentEditorRequestRestoreEventListener | null) {
    if (this.#ondocumenteditorrequestrestore) {
      this.removeEventListener(DocumentEditorRequestRestoreEvent.type, this.#ondocumenteditorrequestrestore)
    }
    this.#ondocumenteditorrequestrestore = l
    if (this.#ondocumenteditorrequestrestore) {
      this.addEventListener(DocumentEditorRequestRestoreEvent.type, this.#ondocumenteditorrequestrestore)
    }
  }

  #ondocumenteditorrequestsaveas: DocumentEditorRequestSaveAsEventListener | null = null

  get ondocumenteditorrequestsaveas(): DocumentEditorRequestSaveAsEventListener | null {
    return this.#ondocumenteditorrequestsaveas
  }

  set ondocumenteditorrequestsaveas(l: DocumentEditorRequestSaveAsEventListener | null) {
    if (this.#ondocumenteditorrequestsaveas) {
      this.removeEventListener(DocumentEditorRequestSaveAsEvent.type, this.#ondocumenteditorrequestsaveas)
    }
    this.#ondocumenteditorrequestsaveas = l
    if (this.#ondocumenteditorrequestsaveas) {
      this.addEventListener(DocumentEditorRequestSaveAsEvent.type, this.#ondocumenteditorrequestsaveas)
    }
  }

  #ondocumenteditorrequestselectdocument: DocumentEditorRequestSelectDocumentEventListener | null = null

  get ondocumenteditorrequestselectdocument(): DocumentEditorRequestSelectDocumentEventListener | null {
    return this.#ondocumenteditorrequestselectdocument
  }

  set ondocumenteditorrequestselectdocument(l: DocumentEditorRequestSelectDocumentEventListener | null) {
    if (this.#ondocumenteditorrequestselectdocument) {
      this.removeEventListener(DocumentEditorRequestSelectDocumentEvent.type, this.#ondocumenteditorrequestselectdocument)
    }
    this.#ondocumenteditorrequestselectdocument = l
    if (this.#ondocumenteditorrequestselectdocument) {
      this.addEventListener(DocumentEditorRequestSelectDocumentEvent.type, this.#ondocumenteditorrequestselectdocument)
    }
  }

  #ondocumenteditorrequestselectspreadsheet: DocumentEditorRequestSelectSpreadsheetEventListener | null = null

  get ondocumenteditorrequestselectspreadsheet(): DocumentEditorRequestSelectSpreadsheetEventListener | null {
    return this.#ondocumenteditorrequestselectspreadsheet
  }

  set ondocumenteditorrequestselectspreadsheet(l: DocumentEditorRequestSelectSpreadsheetEventListener | null) {
    if (this.#ondocumenteditorrequestselectspreadsheet) {
      this.removeEventListener(DocumentEditorRequestSelectSpreadsheetEvent.type, this.#ondocumenteditorrequestselectspreadsheet)
    }
    this.#ondocumenteditorrequestselectspreadsheet = l
    if (this.#ondocumenteditorrequestselectspreadsheet) {
      this.addEventListener(DocumentEditorRequestSelectSpreadsheetEvent.type, this.#ondocumenteditorrequestselectspreadsheet)
    }
  }

  #ondocumenteditorrequestsendnotify: DocumentEditorRequestSendNotifyEventListener | null = null

  get ondocumenteditorrequestsendnotify(): DocumentEditorRequestSendNotifyEventListener | null {
    return this.#ondocumenteditorrequestsendnotify
  }

  set ondocumenteditorrequestsendnotify(l: DocumentEditorRequestSendNotifyEventListener | null) {
    if (this.#ondocumenteditorrequestsendnotify) {
      this.removeEventListener(DocumentEditorRequestSendNotifyEvent.type, this.#ondocumenteditorrequestsendnotify)
    }
    this.#ondocumenteditorrequestsendnotify = l
    if (this.#ondocumenteditorrequestsendnotify) {
      this.addEventListener(DocumentEditorRequestSendNotifyEvent.type, this.#ondocumenteditorrequestsendnotify)
    }
  }

  #ondocumenteditorrequestsharingsettings: DocumentEditorRequestSharingSettingsEventListener | null = null

  get ondocumenteditorrequestsharingsettings(): DocumentEditorRequestSharingSettingsEventListener | null {
    return this.#ondocumenteditorrequestsharingsettings
  }

  set ondocumenteditorrequestsharingsettings(l: DocumentEditorRequestSharingSettingsEventListener | null) {
    if (this.#ondocumenteditorrequestsharingsettings) {
      this.removeEventListener(DocumentEditorRequestSharingSettingsEvent.type, this.#ondocumenteditorrequestsharingsettings)
    }
    this.#ondocumenteditorrequestsharingsettings = l
    if (this.#ondocumenteditorrequestsharingsettings) {
      this.addEventListener(DocumentEditorRequestSharingSettingsEvent.type, this.#ondocumenteditorrequestsharingsettings)
    }
  }

  #ondocumenteditorrequestusers: DocumentEditorRequestUsersEventListener | null = null

  get ondocumenteditorrequestusers(): DocumentEditorRequestUsersEventListener | null {
    return this.#ondocumenteditorrequestusers
  }

  set ondocumenteditorrequestusers(l: DocumentEditorRequestUsersEventListener | null) {
    if (this.#ondocumenteditorrequestusers) {
      this.removeEventListener(DocumentEditorRequestUsersEvent.type, this.#ondocumenteditorrequestusers)
    }
    this.#ondocumenteditorrequestusers = l
    if (this.#ondocumenteditorrequestusers) {
      this.addEventListener(DocumentEditorRequestUsersEvent.type, this.#ondocumenteditorrequestusers)
    }
  }

  #ondocumenteditorwarning: DocumentEditorWarningEventListener | null = null

  get ondocumenteditorwarning(): DocumentEditorWarningEventListener | null {
    return this.#ondocumenteditorwarning
  }

  set ondocumenteditorwarning(l: DocumentEditorWarningEventListener | null) {
    if (this.#ondocumenteditorwarning) {
      this.removeEventListener(DocumentEditorWarningEvent.type, this.#ondocumenteditorwarning)
    }
    this.#ondocumenteditorwarning = l
    if (this.#ondocumenteditorwarning) {
      this.addEventListener(DocumentEditorWarningEvent.type, this.#ondocumenteditorwarning)
    }
  }

  static isDocumentEditorAttribute(u: unknown): u is DocumentEditorAttributeName {
    return this.observedAttributes.includes(u as DocumentEditorAttributeName)
  }

  static get observedAttributes(): DocumentEditorAttributeName[] {
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
      "ondocumenteditorwarning",
    ]
  }

  attributeChangedCallback(n: string, _: string, v: string): void {
    switch (n) {
    case "document-server-url":
      this.documentServerUrl = v
      break
    case "config":
      this.config = JSON.parse(v) as DocumentEditorConfig
      break
    case "ondocumenteditorappready":
      this.ondocumenteditorappready = new Function("event", v) as DocumentEditorAppReadyEventListener
      break
    case "ondocumenteditorcollaborativechanges":
      this.ondocumenteditorcollaborativechanges = new Function("event", v) as DocumentEditorCollaborativeChangesEventListener
      break
    case "ondocumenteditordocumentready":
      this.ondocumenteditordocumentready = new Function("event", v) as DocumentEditorDocumentReadyEventListener
      break
    case "ondocumenteditordocumentstatechange":
      this.ondocumenteditordocumentstatechange = new Function("event", v) as DocumentEditorDocumentStateChangeEventListener
      break
    case "ondocumenteditordownloadas":
      this.ondocumenteditordownloadas = new Function("event", v) as DocumentEditorDownloadAsEventListener
      break
    case "ondocumenteditorerror":
      this.ondocumenteditorerror = new Function("event", v) as DocumentEditorErrorEventListener
      break
    case "ondocumenteditorinfo":
      this.ondocumenteditorinfo = new Function("event", v) as DocumentEditorInfoEventListener
      break
    case "ondocumenteditormakeactionlink":
      this.ondocumenteditormakeactionlink = new Function("event", v) as DocumentEditorMakeActionLinkEventListener
      break
    case "ondocumenteditormetachange":
      this.ondocumenteditormetachange = new Function("event", v) as DocumentEditorMetaChangeEventListener
      break
    case "ondocumenteditoroutdatedversion":
      this.ondocumenteditoroutdatedversion = new Function("event", v) as DocumentEditorOutdatedVersionEventListener
      break
    case "ondocumenteditorpluginsready":
      this.ondocumenteditorpluginsready = new Function("event", v) as DocumentEditorPluginsReadyEventListener
      break
    case "ondocumenteditorready":
      this.ondocumenteditorready = new Function("event", v) as DocumentEditorReadyEventListener
      break
    case "ondocumenteditorrequestclose":
      this.ondocumenteditorrequestclose = new Function("event", v) as DocumentEditorRequestCloseEventListener
      break
    case "ondocumenteditorrequestcomparefile":
      this.ondocumenteditorrequestcomparefile = new Function("event", v) as DocumentEditorRequestCompareFileEventListener
      break
    case "ondocumenteditorrequestcreatenew":
      this.ondocumenteditorrequestcreatenew = new Function("event", v) as DocumentEditorRequestCreateNewEventListener
      break
    case "ondocumenteditorrequesteditrights":
      this.ondocumenteditorrequesteditrights = new Function("event", v) as DocumentEditorRequestEditRightsEventListener
      break
    case "ondocumenteditorrequesthistory":
      this.ondocumenteditorrequesthistory = new Function("event", v) as DocumentEditorRequestHistoryEventListener
      break
    case "ondocumenteditorrequesthistoryclose":
      this.ondocumenteditorrequesthistoryclose = new Function("event", v) as DocumentEditorRequestHistoryCloseEventListener
      break
    case "ondocumenteditorrequesthistorydata":
      this.ondocumenteditorrequesthistorydata = new Function("event", v) as DocumentEditorRequestHistoryDataEventListener
      break
    case "ondocumenteditorrequestinsertimage":
      this.ondocumenteditorrequestinsertimage = new Function("event", v) as DocumentEditorRequestInsertImageEventListener
      break
    case "ondocumenteditorrequestmailmergerecipients":
      this.ondocumenteditorrequestmailmergerecipients = new Function("event", v) as DocumentEditorRequestMailMergeRecipientsEventListener
      break
    case "ondocumenteditorrequestopen":
      this.ondocumenteditorrequestopen = new Function("event", v) as DocumentEditorRequestOpenEventListener
      break
    case "ondocumenteditorrequestreferencedata":
      this.ondocumenteditorrequestreferencedata = new Function("event", v) as DocumentEditorRequestReferenceDataEventListener
      break
    case "ondocumenteditorrequestreferencesource":
      this.ondocumenteditorrequestreferencesource = new Function("event", v) as DocumentEditorRequestReferenceSourceEventListener
      break
    case "ondocumenteditorrequestrename":
      this.ondocumenteditorrequestrename = new Function("event", v) as DocumentEditorRequestRenameEventListener
      break
    case "ondocumenteditorrequestrestore":
      this.ondocumenteditorrequestrestore = new Function("event", v) as DocumentEditorRequestRestoreEventListener
      break
    case "ondocumenteditorrequestsaveas":
      this.ondocumenteditorrequestsaveas = new Function("event", v) as DocumentEditorRequestSaveAsEventListener
      break
    case "ondocumenteditorrequestselectdocument":
      this.ondocumenteditorrequestselectdocument = new Function("event", v) as DocumentEditorRequestSelectDocumentEventListener
      break
    case "ondocumenteditorrequestselectspreadsheet":
      this.ondocumenteditorrequestselectspreadsheet = new Function("event", v) as DocumentEditorRequestSelectSpreadsheetEventListener
      break
    case "ondocumenteditorrequestsendnotify":
      this.ondocumenteditorrequestsendnotify = new Function("event", v) as DocumentEditorRequestSendNotifyEventListener
      break
    case "ondocumenteditorrequestsharingsettings":
      this.ondocumenteditorrequestsharingsettings = new Function("event", v) as DocumentEditorRequestSharingSettingsEventListener
      break
    case "ondocumenteditorrequestusers":
      this.ondocumenteditorrequestusers = new Function("event", v) as DocumentEditorRequestUsersEventListener
      break
    case "ondocumenteditorwarning":
      this.ondocumenteditorwarning = new Function("event", v) as DocumentEditorWarningEventListener
      break
    default:
      throw new Error(`The attribute '${n}' is not supported`)
    }
  }

  connectedCallback(): void {
    const f = this.#queryInstance()
    if (f) {
      const er = new Error("The Document Editor is already mounted")
      const ev = new DocumentEditorErrorEvent({bubbles: true, error: er, message: er.message})
      this.dispatchEvent(ev)
      return
    }

    let u: string
    try {
      u = this.#scriptSource()
    } catch (e) {
      let m = "Unknown Error"
      if (e instanceof Error) {
        m = e.message
      }
      const ev = new DocumentEditorErrorEvent({bubbles: true, error: e, message: m})
      this.dispatchEvent(ev)
      return
    }

    let c: DocEditorConfig
    try {
      c = this.#scriptConfig()
    } catch (e) {
      let m = "Unknown Error"
      if (e instanceof Error) {
        m = e.message
      }
      const ev = new DocumentEditorErrorEvent({bubbles: true, error: e, message: m})
      this.dispatchEvent(ev)
      return
    }

    let p = this.#queryPlaceholder()
    if (!p) {
      p = this.#createPlaceholder()
      this.insertBefore(p, this.lastChild)
    }

    let s = this.#queryScript(u)
    if (!s) {
      s = this.#createScript(u)

      s.addEventListener("error", () => {
        const er = new Error(`Failed to load the Document Editor API script from '${u}'`)
        const ev = new DocumentEditorErrorEvent({bubbles: true, error: er, message: er.message})
        this.dispatchEvent(ev)
      })

      s.addEventListener("load", () => {
        try {
          this.#mount(c, p)
        } catch (e) {
          let m = "Unknown Error"
          if (e instanceof Error) {
            m = e.message
          }
          const ev = new DocumentEditorErrorEvent({bubbles: true, error: e, message: m})
          this.dispatchEvent(ev)
        }
      })

      p.after(s)
    } else {
      this.#unmount()

      try {
        this.#mount(c, p)
      } catch (e) {
        let m = "Unknown Error"
        if (e instanceof Error) {
          m = e.message
        }
        const ev = new DocumentEditorErrorEvent({bubbles: true, error: e, message: m})
        this.dispatchEvent(ev)
      }
    }
  }

  #queryInstance(): HTMLElement | null {
    return this.querySelector("iframe")
  }

  #queryPlaceholder(): HTMLElement | null {
    return this.querySelector("div[id$='-placeholder']")
  }

  #createPlaceholder(): HTMLElement {
    const e = document.createElement("div")
    e.id = `${uniqueString()}-placeholder`
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

  #queryScript(u: string): HTMLElement | null {
    return this.querySelector(`script[src="${u}"]`)
  }

  #createScript(u: string): HTMLElement {
    const s = document.createElement("script")
    s.async = true
    s.src = u
    return s
  }

  #scriptSource(): string {
    const b = this.#documentServerUrl
    if (b === "") {
      throw new Error("The attribute 'document-server-url' is required, but it is missing")
    }
    if (!b.endsWith("/")) {
      throw new Error("The attribute 'document-server-url' must have a trailing slash, but it does not")
    }
    const u = new URL("web-apps/apps/api/documents/api.js", b)
    return u.toString()
  }

  #scriptConfig(): DocEditorConfig {
    if (!this.#config) {
      throw new Error("The attribute 'config' is required, but it is missing")
    }

    const c: DocEditorConfig = {
      ...structuredClone(this.#config),
    }

    const e: DocEditorConfigEvents = {}

    if (this.#eventList.contains("documenteditorappready")) {
      e.onAppReady = () => {
        const e = new DocumentEditorAppReadyEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorcollaborativechanges")) {
      e.onCollaborativeChanges = () => {
        const e = new DocumentEditorCollaborativeChangesEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditordocumentready")) {
      e.onDocumentReady = () => {
        const e = new DocumentEditorDocumentReadyEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditordocumentstatechange")) {
      e.onDocumentStateChange = (ev) => {
        const e = new DocumentEditorDocumentStateChangeEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditordownloadas")) {
      e.onDownloadAs = (ev) => {
        const e = new DocumentEditorDownloadAsEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorerror")) {
      e.onError = (ev) => {
        const er = new Error(`${ev.data.errorDescription} (${ev.data.errorCode})`)
        const e = new DocumentEditorErrorEvent({...ev, bubbles: true, error: er, message: er.message})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorinfo")) {
      e.onInfo = (ev) => {
        const e = new DocumentEditorInfoEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditormakeactionlink")) {
      e.onMakeActionLink = (ev) => {
        const e = new DocumentEditorMakeActionLinkEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditormetachange")) {
      e.onMetaChange = (ev) => {
        const e = new DocumentEditorMetaChangeEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditoroutdatedversion")) {
      e.onOutdatedVersion = () => {
        const e = new DocumentEditorOutdatedVersionEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorpluginsready")) {
      e.onPluginsReady = () => {
        const e = new DocumentEditorPluginsReadyEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorready")) {
      e.onReady = () => {
        const e = new DocumentEditorReadyEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestclose")) {
      e.onRequestClose = () => {
        const e = new DocumentEditorRequestCloseEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestcomparefile")) {
      e.onRequestCompareFile = () => {
        const e = new DocumentEditorRequestCompareFileEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestcreatenew")) {
      e.onRequestCreateNew = () => {
        const e = new DocumentEditorRequestCreateNewEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequesteditrights")) {
      e.onRequestEditRights = () => {
        const e = new DocumentEditorRequestEditRightsEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequesthistory")) {
      e.onRequestHistory = () => {
        const e = new DocumentEditorRequestHistoryEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequesthistoryclose")) {
      e.onRequestHistoryClose = () => {
        const e = new DocumentEditorRequestHistoryCloseEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequesthistorydata")) {
      e.onRequestHistoryData = (ev) => {
        const e = new DocumentEditorRequestHistoryDataEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestinsertimage")) {
      e.onRequestInsertImage = (ev) => {
        const e = new DocumentEditorRequestInsertImageEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestmailmergerecipients")) {
      e.onRequestMailMergeRecipients = () => {
        const e = new DocumentEditorRequestMailMergeRecipientsEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestopen")) {
      e.onRequestOpen = (ev) => {
        const e = new DocumentEditorRequestOpenEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestreferencedata")) {
      e.onRequestReferenceData = (ev) => {
        const e = new DocumentEditorRequestReferenceDataEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestreferencesource")) {
      e.onRequestReferenceSource = (ev) => {
        const e = new DocumentEditorRequestReferenceSourceEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestrename")) {
      e.onRequestRename = (ev) => {
        const e = new DocumentEditorRequestRenameEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestrestore")) {
      e.onRequestRestore = (ev) => {
        const e = new DocumentEditorRequestRestoreEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestsaveas")) {
      e.onRequestSaveAs = (ev) => {
        const e = new DocumentEditorRequestSaveAsEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestselectdocument")) {
      e.onRequestSelectDocument = (ev) => {
        const e = new DocumentEditorRequestSelectDocumentEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestselectspreadsheet")) {
      e.onRequestSelectSpreadsheet = (ev) => {
        const e = new DocumentEditorRequestSelectSpreadsheetEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestsendnotify")) {
      e.onRequestSendNotify = (ev) => {
        const e = new DocumentEditorRequestSendNotifyEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestsharingsettings")) {
      e.onRequestSharingSettings = () => {
        const e = new DocumentEditorRequestSharingSettingsEvent({bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorrequestusers")) {
      e.onRequestUsers = (ev) => {
        const e = new DocumentEditorRequestUsersEvent({...ev, bubbles: true})
        this.dispatchEvent(e)
      }
    }

    if (this.#eventList.contains("documenteditorwarning")) {
      e.onWarning = (ev) => {
        const er = new Error(`${ev.data.warningDescription} (${ev.data.warningCode})`)
        const e = new DocumentEditorWarningEvent({...ev, bubbles: true, error: er, message: er.message})
        this.dispatchEvent(e)
      }
    }

    if (Object.keys(e).length !== 0) {
      c.events = e
    }

    return c
  }

  #unmount(): void {
    this.#editor = null
  }

  #mount(c: DocEditorConfig, p: HTMLElement): void {
    if (!window.DocsAPI) {
      throw new Error("The Document Editor API is not defined")
    }
    // eslint-disable-next-line new-cap
    this.#editor = window.DocsAPI.DocEditor(p.id, c)
  }
}

export class DocumentEditorEventList {
  #s = new Set<string>()

  add(...a: DocumentEditorEventType[]): void {
    for (const e of a) {
      this.#s.add(e)
    }
  }

  contains(e: DocumentEditorEventType): boolean {
    return this.#s.has(e)
  }

  remove(...a: DocumentEditorEventType[]): void {
    for (const e of a) {
      this.#s.delete(e)
    }
  }
}
