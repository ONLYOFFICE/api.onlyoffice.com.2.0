/* eslint-disable @typescript-eslint/no-implied-eval, no-new-func */
/* eslint @stylistic/max-len: ["error", {code: 140}] */

import {
  type DocEditor,
  type DocEditorConfig,
  type DocEditorConfigurableOptions,
} from "@onlyoffice/document-server-types"
import {
  uniqueString,
} from "@onlyoffice/strings"
import {
  DocumentEditorAppReadyEvent,
  type DocumentEditorAppReadyListener,
  DocumentEditorCollaborativeChangesEvent,
  type DocumentEditorCollaborativeChangesListener,
  DocumentEditorDocumentReadyEvent,
  type DocumentEditorDocumentReadyListener,
  DocumentEditorDocumentStateChangeEvent,
  type DocumentEditorDocumentStateChangeListener,
  DocumentEditorDownloadAsEvent,
  type DocumentEditorDownloadAsListener,
  DocumentEditorErrorEvent,
  type DocumentEditorErrorListener,
  DocumentEditorInfoEvent,
  type DocumentEditorInfoListener,
  DocumentEditorMakeActionLinkEvent,
  type DocumentEditorMakeActionLinkListener,
  DocumentEditorMetaChangeEvent,
  type DocumentEditorMetaChangeListener,
  DocumentEditorOutdatedVersionEvent,
  type DocumentEditorOutdatedVersionListener,
  DocumentEditorPluginsReadyEvent,
  type DocumentEditorPluginsReadyListener,
  DocumentEditorReadyEvent,
  type DocumentEditorReadyListener,
  DocumentEditorRequestCloseEvent,
  type DocumentEditorRequestCloseListener,
  DocumentEditorRequestCompareFileEvent,
  type DocumentEditorRequestCompareFileListener,
  DocumentEditorRequestCreateNewEvent,
  type DocumentEditorRequestCreateNewListener,
  DocumentEditorRequestEditRightsEvent,
  type DocumentEditorRequestEditRightsListener,
  DocumentEditorRequestHistoryCloseEvent,
  type DocumentEditorRequestHistoryCloseListener,
  DocumentEditorRequestHistoryDataEvent,
  type DocumentEditorRequestHistoryDataListener,
  DocumentEditorRequestHistoryEvent,
  type DocumentEditorRequestHistoryListener,
  DocumentEditorRequestInsertImageEvent,
  type DocumentEditorRequestInsertImageListener,
  DocumentEditorRequestMailMergeRecipientsEvent,
  type DocumentEditorRequestMailMergeRecipientsListener,
  DocumentEditorRequestOpenEvent,
  type DocumentEditorRequestOpenListener,
  DocumentEditorRequestReferenceDataEvent,
  type DocumentEditorRequestReferenceDataListener,
  DocumentEditorRequestReferenceSourceEvent,
  type DocumentEditorRequestReferenceSourceListener,
  DocumentEditorRequestRenameEvent,
  type DocumentEditorRequestRenameListener,
  DocumentEditorRequestRestoreEvent,
  type DocumentEditorRequestRestoreListener,
  DocumentEditorRequestSaveAsEvent,
  type DocumentEditorRequestSaveAsListener,
  DocumentEditorRequestSelectDocumentEvent,
  type DocumentEditorRequestSelectDocumentListener,
  DocumentEditorRequestSelectSpreadsheetEvent,
  type DocumentEditorRequestSelectSpreadsheetListener,
  DocumentEditorRequestSendNotifyEvent,
  type DocumentEditorRequestSendNotifyListener,
  DocumentEditorRequestSharingSettingsEvent,
  type DocumentEditorRequestSharingSettingsListener,
  DocumentEditorRequestUsersEvent,
  type DocumentEditorRequestUsersListener,
  DocumentEditorWarningEvent,
  type DocumentEditorWarningListener,
} from "./events.ts"

export type DocumentEditorAttribute = Exclude<keyof DocumentEditorAttributes, undefined>

export interface DocumentEditorAttributes {
  "document-server-url"?: string
  "config"?: string
  "ondocumenteditorappready"?: string
  "ondocumenteditorcollaborativechanges"?: string
  "ondocumenteditordocumentready"?: string
  "ondocumenteditordocumentstatechange"?: string
  "ondocumenteditordownloadas"?: string
  "ondocumenteditorerror"?: string
  "ondocumenteditorinfo"?: string
  "ondocumenteditormakeactionlink"?: string
  "ondocumenteditormetachange"?: string
  "ondocumenteditoroutdatedversion"?: string
  "ondocumenteditorpluginsready"?: string
  "ondocumenteditorready"?: string
  "ondocumenteditorrequestclose"?: string
  "ondocumenteditorrequestcomparefile"?: string
  "ondocumenteditorrequestcreatenew"?: string
  "ondocumenteditorrequesteditrights"?: string
  "ondocumenteditorrequesthistory"?: string
  "ondocumenteditorrequesthistoryclose"?: string
  "ondocumenteditorrequesthistorydata"?: string
  "ondocumenteditorrequestinsertimage"?: string
  "ondocumenteditorrequestmailmergerecipients"?: string
  "ondocumenteditorrequestopen"?: string
  "ondocumenteditorrequestreferencedata"?: string
  "ondocumenteditorrequestreferencesource"?: string
  "ondocumenteditorrequestrename"?: string
  "ondocumenteditorrequestrestore"?: string
  "ondocumenteditorrequestsaveas"?: string
  "ondocumenteditorrequestselectdocument"?: string
  "ondocumenteditorrequestselectspreadsheet"?: string
  "ondocumenteditorrequestsendnotify"?: string
  "ondocumenteditorrequestsharingsettings"?: string
  "ondocumenteditorrequestusers"?: string
  "ondocumenteditorwarning"?: string
}

export type DocumentEditorEventType = {
  [K in keyof GlobalEventHandlersEventMap]: K extends `documenteditor${string}` ? K : never
}[keyof GlobalEventHandlersEventMap]

export type DocumentEditorEventHandlerName = Exclude<{
  [K in keyof GlobalEventHandlers]: K extends `ondocumenteditor${string}` ? K : never
}[keyof GlobalEventHandlers], undefined>

export type DocumentEditorConfig = DocEditorConfigurableOptions

export class DocumentEditor extends HTMLElement {
  static get tagName(): string {
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

  static isDocumentEditorEventHandlerName(u: unknown): u is DocumentEditorEventHandlerName {
    return this.eventHandlerNames.includes(u as DocumentEditorEventHandlerName)
  }

  static get eventHandlerNames(): DocumentEditorEventHandlerName[] {
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

  static isDocumentEditorAttribute(u: unknown): u is DocumentEditorAttribute {
    return this.observedAttributes.includes(u as DocumentEditorAttribute)
  }

  static get observedAttributes(): DocumentEditorAttribute[] {
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

    return {
      ...structuredClone(this.#config),
      events: {
        onAppReady: () => {
          const e = new DocumentEditorAppReadyEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onCollaborativeChanges: () => {
          const e = new DocumentEditorCollaborativeChangesEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onDocumentReady: () => {
          const e = new DocumentEditorDocumentReadyEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onDocumentStateChange: (ev) => {
          const e = new DocumentEditorDocumentStateChangeEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onDownloadAs: (ev) => {
          const e = new DocumentEditorDownloadAsEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onError: (ev) => {
          const er = new Error(`${ev.data.errorDescription} (${ev.data.errorCode})`)
          const e = new DocumentEditorErrorEvent({...ev, bubbles: true, error: er, message: er.message})
          this.dispatchEvent(e)
        },
        onInfo: (ev) => {
          const e = new DocumentEditorInfoEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onMakeActionLink: (ev) => {
          const e = new DocumentEditorMakeActionLinkEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onMetaChange: (ev) => {
          const e = new DocumentEditorMetaChangeEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onOutdatedVersion: () => {
          const e = new DocumentEditorOutdatedVersionEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onPluginsReady: () => {
          const e = new DocumentEditorPluginsReadyEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onReady: () => {
          const e = new DocumentEditorReadyEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestClose: () => {
          const e = new DocumentEditorRequestCloseEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestCompareFile: () => {
          const e = new DocumentEditorRequestCompareFileEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestCreateNew: () => {
          const e = new DocumentEditorRequestCreateNewEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestEditRights: () => {
          const e = new DocumentEditorRequestEditRightsEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestHistory: () => {
          const e = new DocumentEditorRequestHistoryEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestHistoryClose: () => {
          const e = new DocumentEditorRequestHistoryCloseEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestHistoryData: (ev) => {
          const e = new DocumentEditorRequestHistoryDataEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestInsertImage: (ev) => {
          const e = new DocumentEditorRequestInsertImageEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestMailMergeRecipients: () => {
          const e = new DocumentEditorRequestMailMergeRecipientsEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestOpen: (ev) => {
          const e = new DocumentEditorRequestOpenEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestReferenceData: (ev) => {
          const e = new DocumentEditorRequestReferenceDataEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestReferenceSource: (ev) => {
          const e = new DocumentEditorRequestReferenceSourceEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestRename: (ev) => {
          const e = new DocumentEditorRequestRenameEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestRestore: (ev) => {
          const e = new DocumentEditorRequestRestoreEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestSaveAs: (ev) => {
          const e = new DocumentEditorRequestSaveAsEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestSelectDocument: (ev) => {
          const e = new DocumentEditorRequestSelectDocumentEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestSelectSpreadsheet: (ev) => {
          const e = new DocumentEditorRequestSelectSpreadsheetEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestSendNotify: (ev) => {
          const e = new DocumentEditorRequestSendNotifyEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestSharingSettings: () => {
          const e = new DocumentEditorRequestSharingSettingsEvent({bubbles: true})
          this.dispatchEvent(e)
        },
        onRequestUsers: (ev) => {
          const e = new DocumentEditorRequestUsersEvent({...ev, bubbles: true})
          this.dispatchEvent(e)
        },
        onWarning: (ev) => {
          const er = new Error(`${ev.data.warningDescription} (${ev.data.warningCode})`)
          const e = new DocumentEditorWarningEvent({...ev, bubbles: true, error: er, message: er.message})
          this.dispatchEvent(e)
        },
      },
    }
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
