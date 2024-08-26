The list of changes of ONLYOFFICE Docs API.

## Version 8.1

- Added the [startFilling](../../Usage%20API/Methods/index.md#startfilling) method.
- Added the [events.onRequestStartFilling](../../Usage%20API/Config/Events/index.md#onrequeststartfilling) event.
- Added the [docs\_api\_config](../../Using%20WOPI/Host%20page/index.md#parameters) parameter to the *form* element of the WOPI host page.
- Added the [pdf](../../Additional%20API/Conversion%20API/index.md#pdf) field to the conversion request.
- Added the [events.onSubmit](../../Usage%20API/Config/Events/index.md#onsubmit) event.
- The *docxf* format is deprecated, please use the *pdf* format to create and edit forms.
- Changed the [documentType](../../Usage%20API/Config/index.md#documenttype) of the *docxf* and *oform* formats to *pdf*.
- Added the *roles* field to the [editorConfig.customization.features](../../Usage%20API/Config/Editor/Customization/index.md#features) parameter.
- Added the [shardkey](../../Get%20Started/How%20It%20Works/index.md#shard-key) parameter to the URL query string when sending requests to the document command service, document conversion service, or document builder service.
- Added the [addContextMenuItem](../../Usage%20API/Automation%20API/index.md#addcontextmenuitem), [addToolbarMenuItem](../../Usage%20API/Automation%20API/index.md#addtoolbarmenuitem) and [updateContextMenuItem](../../Usage%20API/Automation%20API/index.md#updatecontextmenuitem) methods to the *Automation API*.
- Added the [-10 error code](../../Additional%20API/Conversion%20API/index.md#possible-error-codes-and-their-description) to the Conversion API.
- The [editorConfig.customization.logo](../../Usage%20API/Config/Editor/Customization/index.md#logo) parameter is now available for the mobile editors.
- Added the *visible* field to the [editorConfig.customization.logo](../../Usage%20API/Config/Editor/Customization/index.md#logo) parameter.
- Added the [formsubmit](../../Using%20WOPI/WOPI%20discovery/index.md#wopi-actions) action to the WOPI discovery.
- The [editorConfig.customization.goback.requestClose](../../Usage%20API/Config/Editor/Customization/index.md#goback) field is deprecated, please use the [editorConfig.customization.close](../../Usage%20API/Config/Editor/Customization/index.md#close) field instead.
- Added the [Save Copy As](../../Using%20WOPI/WOPI%20REST%20API/PutRelativeFile/index.md#save-copy-as) functionality to WOPI.
- Change the default value of the [editorConfig.customization.hideRightMenu](../../Usage%20API/Config/Editor/Customization/index.md#hiderightmenu) parameter to *true*.

## Version 8.0

- Added the [WOPISrc](../../Using%20WOPI/Overview/index.md#wopisrc) query parameter to the requests from the browser to the server.
- Added the [watermark](../../Additional%20API/Conversion%20API/index.md#watermark) field to the conversion request.
- Added the *pdf* document type to the [documentType](../../Usage%20API/Config/index.md#documenttype) parameter.
- Added the [formsdataurl](../../Usage%20API/Callback%20handler/index.md#formsdataurl) parameter to the *Callback handler*.
- Added the *data.id* parameter to the [events.onRequestUsers](../../Usage%20API/Config/Events/index.md#onrequestusers) event.
- Added the *users.image* field to the [setUsers](../../Usage%20API/Methods/index.md#setusers) method.
- Added the *info* operation type to the [setUsers](../../Usage%20API/Methods/index.md#setusers) method and [events.onRequestUsers](../../Usage%20API/Config/Events/index.md#onrequestusers) event.
- Added the *image* field to the [editorConfig.user](../../Usage%20API/Config/Editor/index.md#user) parameter.
- Added the [editorConfig.customization.mobileForceView](../../Usage%20API/Config/Editor/Customization/index.md#mobileforceview) parameter.
- Added the *link* field to the *data* object which is sent to the [events.onRequestReferenceData](../../Usage%20API/Config/Events/index.md#onrequestreferencedata) event.

## Version 7.5

- Added the **3** type for the [forcesavetype](../../Usage%20API/Callback%20handler/index.md#forcesavetype) parameter of the callback handler.
- Added the [editorConfig.customization.submitForm](../../Usage%20API/Config/Editor/Customization/index.md#submitform) parameter.
- The [events.onRequestMailMergeRecipients](../../Usage%20API/Config/Events/index.md#onrequestmailmergerecipients) event is deprecated, please use the [events.onRequestSelectSpreadsheet](../../Usage%20API/Config/Events/index.md#onrequestselectspreadsheet) event instead.
- The [setMailMergeRecipients](../../Usage%20API/Methods/index.md#setmailmergerecipients) method is deprecated, please use the [setRequestedSpreadsheet](../../Usage%20API/Methods/index.md#setrequestedspreadsheet) method instead.
- Added the [setReferenceSource](../../Usage%20API/Methods/index.md#setreferencesource) method.
- Added the [events.onRequestReferenceSource](../../Usage%20API/Config/Events/index.md#onrequestreferencesource) event.
- Added the [-9 error code](../../Additional%20API/Conversion%20API/index.md#possible-error-codes-and-their-description) to the Conversion API.
- Added the *key* field to the [document.referenceData](../../Usage%20API/Config/Document/index.md#referencedata) parameter.
- The [events.onRequestCompareFile](../../Usage%20API/Config/Events/index.md#onrequestcomparefile) event is deprecated, please use the [events.onRequestSelectDocument](../../Usage%20API/Config/Events/index.md#onrequestselectdocument) event instead.
- The [setRevisedFile](../../Usage%20API/Methods/index.md#setrevisedfile) method is deprecated, please use the [setRequestedDocument](../../Usage%20API/Methods/index.md#setrequesteddocument) method instead.
- Added the [events.onRequestOpen](../../Usage%20API/Config/Events/index.md#onrequestopen) event.
- Added the [deleteForgotten](../../Additional%20API/Command%20service/deleteForgotten/index.md), [getForgotten](../../Additional%20API/Command%20service/getForgotten/index.md), and [getForgottenList](../../Additional%20API/Command%20service/getForgottenList/index.md) commands.

## Version 7.4

- Added opening for [dps, dpt, et, ett, mhtml, stw, sxc, sxi, sxw, wps, wpt](../../Usage%20API/Config/index.md#documenttype) formats.
- Added the *users.id* field to the [setUsers](../../Usage%20API/Methods/index.md#setusers) method.
- Added the *c* parameter to the [setUsers](../../Usage%20API/Methods/index.md#setusers) method and [events.onRequestUsers](../../Usage%20API/Config/Events/index.md#onrequestusers) event.

## Version 7.3

- Added the WOPI [Conversion API](../../Using%20WOPI/Conversion%20API/index.md).
- Added the [setReferenceData](../../Usage%20API/Methods/index.md#setreferencedata) method.
- Added the [events.onRequestReferenceData](../../Usage%20API/Config/Events/index.md#onrequestreferencedata) event.
- Added the [document.referenceData](../../Usage%20API/Config/Document/index.md#referencedata) parameter.
- Added the [UserCanNotWriteRelative](../../Using%20WOPI/WOPI%20REST%20API/CheckFileInfo/index.md#usercannotwriterelative) property to the *CheckFileInfo* WOPI operation.
- Added a scheme for [editing binary document formats](../../Using%20WOPI/Editing%20binary%20documents/index.md).
- Added the [convert](../../Using%20WOPI/WOPI%20discovery/index.md#wopi-actions) action to the WOPI discovery.
- Added the [PutRelativeFile](../../Using%20WOPI/WOPI%20REST%20API/PutRelativeFile/index.md) WOPI operation.

## Version 7.2

- Added the [editorConfig.customization.integrationMode](../../Usage%20API/Config/Editor/Customization/index.md#integrationmode) parameter.
- Added the [Connector](../../Usage%20API/Automation%20API/index.md) class to interact with text documents, spreadsheets, presentations, and fillable forms from the outside.
- Added the *theme-contrast-dark* theme id to the [editorConfig.customization.uiTheme](../../Usage%20API/Config/Editor/Customization/index.md#uitheme) parameter.
- Added the *phone* field to the [editorConfig.customization.customer](../../Usage%20API/Config/Editor/Customization/index.md#customer) parameter.
- Added the *connections\_view*, *users\_view\_count* and *users\_view* parameters to the [license response](../../Additional%20API/Command%20service/license/index.md#response-parameters).
- Added the [live viewer](../../Get%20Started/How%20It%20Works/Viewing/index.md) mode to the text document, spreadsheet and presentation editors.
- Added the [embedview](../../Using%20WOPI/WOPI%20discovery/index.md#wopi-actions) action to the WOPI discovery.
- The [services.CoAuthoring.secret.browser.string](../../Additional%20API/Signature/index.md#parameters) parameter is deprecated, please use the [services.CoAuthoring.secret.inbox.string](../../Additional%20API/Signature/index.md#parameters) parameter instead.

## Version 7.1

- The *services.CoAuthoring.token.inbox.inBody* and *services.CoAuthoring.token.outbox.inBody* parameters for enabling [token in body](../../Additional%20API/Signature/Request/Token%20in%20body/index.md) are deprecated.
- Added the *X-LOOL-WOPI-IsModifiedByUser*, *X-LOOL-WOPI-IsAutosave* and *X-LOOL-WOPI-IsExitSave* request headers to the [PutFile](../../Using%20WOPI/WOPI%20REST%20API/PutFile/index.md) WOPI operation to distinguish between the type of document saving.
- The [editorConfig.customization.chat](../../Usage%20API/Config/Editor/Customization/index.md#chat) parameter is deprecated, please use the [document.permissions.chat](../../Usage%20API/Config/Document/Permissions/index.md#chat) parameter instead.
- Added conversion from [dps, dpt, et, ett, htm, mhtml, stw, sxc, sxi, sxw, wps, wpt, xlsb, xml](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format.
- Added opening for [xlsb](../../Usage%20API/Config/index.md#documenttype) format.
- The parameter list in the initialization config [signature](../../Additional%20API/Signature/Browser/index.md#opening-file) has become strictly regulated.
- The [editorConfig.customization.spellcheck](../../Usage%20API/Config/Editor/Customization/index.md#spellcheck) field is deprecated, please use the [editorConfig.customization.features.spellcheck](../../Usage%20API/Config/Editor/Customization/index.md#features) field instead.
- Added the [editorConfig.customization.features](../../Usage%20API/Config/Editor/Customization/index.md#features) parameter section.
- Added the [documentLayout](../../Additional%20API/Conversion%20API/index.md#documentlayout) parameter to the conversion request.
- Added the [documentRenderer](../../Additional%20API/Conversion%20API/index.md#documentrenderer) parameter to the conversion request.
- Added conversion from [pdf/xps/oxps](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) formats to *docx*.
- Added the [document.permissions.userInfoGroups](../../Usage%20API/Config/Document/Permissions/index.md#userinfogroups) parameter.
- Added conversion from [djvu](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format to *pdf*.
- Added conversion to [ppsm, ppsx](../../Additional%20API/Conversion%20API/index.md#presentation-file-formats) formats.

## Version 7.0

- Added the *.docxf* and *.oform* [document formats](../../Usage%20API/Config/index.md#documenttype).
- Added conversion to and from [docxf](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format.
- The [callbackUrl](../../Usage%20API/Callback%20handler/index.md) is used from the last tab of the same user.
- Added the *logoDark* field to the [editorConfig.customization.customer](../../Usage%20API/Config/Editor/Customization/index.md#customer) parameter.
- Added the *imageDark* field to the [editorConfig.customization.logo](../../Usage%20API/Config/Editor/Customization/index.md#logo) parameter.
- The *imageEmbedded* field of the [editorConfig.customization.logo](../../Usage%20API/Config/Editor/Customization/index.md#logo) parameter is deprecated, please use the *image* field instead.
- Added a signature to the request for file changes specified with the *changesUrl* parameter of the [setHistoryData](../../Usage%20API/Methods/index.md#sethistorydata) method.
- Added the [document.permissions.protect](../../Usage%20API/Config/Document/Permissions/index.md#protect) field.
- Added the *fileType* parameter to the [onDownloadAs](../../Usage%20API/Config/Events/index.md#ondownloadas), [onRequestRestore](../../Usage%20API/Config/Events/index.md#onrequestrestore) and [onRequestSaveAs](../../Usage%20API/Config/Events/index.md#onrequestsaveas) events.
- Added the possibility to insert several images via the [insertImage](../../Usage%20API/Methods/index.md#insertimage) method.
- The [assemblyFormatAsOrigin](../../Get%20Started/How%20It%20Works/Saving%20file/index.md#saving-in-original-format) server setting is enabled by default.
- Added the *ooxml* and *odf* values to the [outputtype](../../Additional%20API/Conversion%20API/index.md#outputtype) parameter of the conversion request.
- Added the *fileType* and *previous.fileType* parameters to the [setHistoryData](../../Usage%20API/Methods/index.md#sethistorydata) method.
- Added the [filetype](../../Usage%20API/Callback%20handler/index.md#filetype) parameter to the *Callback handler*.
- Added the [fileType](../../Additional%20API/Conversion%20API/index.md#filetype) field to the conversion response.
- Added conversion to [docm, dotm, xlsm, xltm, pptm, potm](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) formats.
- The [editorConfig.customization.reviewDisplay](../../Usage%20API/Config/Editor/Customization/index.md#reviewdisplay), [editorConfig.customization.showReviewChanges](../../Usage%20API/Config/Editor/Customization/index.md#showreviewchanges), [editorConfig.customization.trackChanges](../../Usage%20API/Config/Editor/Customization/index.md#trackchanges) parameters are deprecated, please use the [editorConfig.customization.review](../../Usage%20API/Config/Editor/Customization/index.md#review) parameter instead.
- Added the [editorConfig.customization.review.hideReviewDisplay](../../Usage%20API/Config/Editor/Customization/index.md#review) field.
- Added the [editorConfig.customization.review.hoverMode](../../Usage%20API/Config/Editor/Customization/index.md#review) field.
- Added the possibility to view the [document history](../../Get%20Started/How%20It%20Works/Document%20history/index.md) of the spreadsheet files.
- Added the [UI\_InsertGraphic](../../Using%20WOPI/PostMessage/index.md#ui_insertgraphic) message for the PostMessage WOPI protocol.

## Version 6.4

- Added opening for [oxps](../../Usage%20API/Config/index.md#documenttype) format.
- Added support for [WOPI protocol](../../Using%20WOPI/Overview/index.md).
- Added the *simple* value to the [editorConfig.customization.reviewDisplay](../../Usage%20API/Config/Editor/Customization/index.md#reviewdisplay) parameter.
- Added the [threaded comments](../../Get%20Started/How%20It%20Works/Commenting/index.md#threaded-comments-in-spreadsheets) saving in the spreadsheet files.
- Added the [editorConfig.customization.uiTheme](../../Usage%20API/Config/Editor/Customization/index.md#uitheme) field.
- Added the possibility to view the [document history](../../Get%20Started/How%20It%20Works/Document%20history/index.md) for the presentation files.
- Added the [editorConfig.customization.hideNotes](../../Usage%20API/Config/Editor/Customization/index.md#hidenotes) field.
- Added the [editorConfig.coEditing](../../Usage%20API/Config/Editor/index.md#coediting) field.
- Added the [requestClose](../../Usage%20API/Methods/index.md#requestclose) method.
- Added the [document.permissions.commentGroups](../../Usage%20API/Config/Document/Permissions/index.md#commentgroups) field.
- Added the [events.onPluginsReady](../../Usage%20API/Config/Events/index.md#onpluginsready) event.

## Version 6.3

- Added the [license](../../Additional%20API/Command%20service/license/index.md) command.
- Added the [editorConfig.customization.hideRulers](../../Usage%20API/Config/Editor/Customization/index.md#hiderulers) field.
- Added the [editorConfig.customization.anonymous](../../Usage%20API/Config/Editor/Customization/index.md#anonymous) field.
- The [editorConfig.customization.commentAuthorOnly](../../Usage%20API/Config/Editor/Customization/index.md#commentauthoronly) field is deprecated, please use the [document.permissions.editCommentAuthorOnly](../../Usage%20API/Config/Document/Permissions/index.md#editcommentauthoronly) and [document.permissions.deleteCommentAuthorOnly](../../Usage%20API/Config/Document/Permissions/index.md#deletecommentauthoronly) fields.
- Added the [setFavorite](../../Usage%20API/Methods/index.md#setfavorite) method.
- Added the *data.favorite* parameter to the [events.onMetaChange](../../Usage%20API/Config/Events/index.md#onmetachange) event.
- Added the [document.info.favorite](../../Usage%20API/Config/Document/Info/index.md#favorite) field.
- Added the [document.permissions.reviewGroups](../../Usage%20API/Config/Document/Permissions/index.md#reviewgroups) field.
- Added conversion to [epub, fb2, html](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) formats.
- Added conversion from [xml](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format.

## Version 6.2

- Added a new [actions.type](../../Usage%20API/Callback%20handler/index.md#actions) field value (*actions.type = 2*).
- Added the [editorConfig.customization.trackChanges](../../Usage%20API/Config/Editor/Customization/index.md#trackchanges) field.
- Added the [editorConfig.customization.toolbarHideFileName](../../Usage%20API/Config/Editor/Customization/index.md#toolbarhidefilename) field.
- The *callbackUrl* for *status* **6** is selected based on [forcesavetype](../../Usage%20API/Callback%20handler/index.md).
- Added opening for [fb2](../../Usage%20API/Config/index.md#documenttype) format.

## Version 6.1

- The *text*, *spreadsheet* and *presentation* values for [documentType](../../Usage%20API/Config/index.md#documenttype) parameter is deprecated, please use *word*, *cell* and *slide* values instead.
- Added the *group* field to the [editorConfig.user](../../Usage%20API/Config/Editor/index.md#user).
- Added conversion from [fb2](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format.

## Version 6.0

- Added the type of insertion in [events.onRequestInsertImage](../../Usage%20API/Config/Events/index.md#onrequestinsertimage) event.
- Added the [editorConfig.templates](../../Usage%20API/Config/Editor/index.md#templates) field.
- Added the [editorConfig.customization.plugins](../../Usage%20API/Config/Editor/Customization/index.md#plugins) field.
- Added the [editorConfig.customization.macros](../../Usage%20API/Config/Editor/Customization/index.md#macros) field.
- Added the [editorConfig.customization.macrosMode](../../Usage%20API/Config/Editor/Customization/index.md#macrosmode) field.
- Added the [events.onRequestCreateNew](../../Usage%20API/Config/Events/index.md#onrequestcreatenew) event.
- Added the [document.permissions.copy](../../Usage%20API/Config/Document/Permissions/index.md#copy) field.
- The [document.permissions.rename](../../Usage%20API/Config/Document/Permissions/index.md#rename) field is deprecated, please add the [events.onRequestRename](../../Usage%20API/Config/Events/index.md#onrequestrename) field instead.

## Version 5.5

- Added the [editorConfig.customization.spellcheck](../../Usage%20API/Config/Editor/Customization/index.md#spellcheck) field.
- Added conversion to [pdfa](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) format.
- Added the [events.onRequestCompareFile](../../Usage%20API/Config/Events/index.md#onrequestcomparefile) event.
- Added the [setRevisedFile](../../Usage%20API/Methods/index.md#setrevisedfile) method.
- Token in [methods](../../Additional%20API/Signature/Browser/index.md#methods) parameters.
- The [document.permissions.changeHistory](../../Usage%20API/Config/Document/Permissions/index.md#changehistory) field is deprecated, please add the [events.onRequestRestore](../../Usage%20API/Config/Events/index.md#onrequestrestore) field instead.
- Added the [editorConfig.customization.goback.requestClose](../../Usage%20API/Config/Editor/Customization/index.md#goback) field.
- Added the [events.onRequestSharingSettings](../../Usage%20API/Config/Events/index.md#onrequestsharingsettings) event.
- Added the [editorConfig.customization.unit](../../Usage%20API/Config/Editor/Customization/index.md#unit) field.
- Added the [region](../../Additional%20API/Conversion%20API/index.md#region) field.
- Added the [spreadsheetLayout](../../Additional%20API/Conversion%20API/index.md#spreadsheetlayout) field.
- Added [input error](../../Additional%20API/Conversion%20API/index.md#possible-error-codes-and-their-description) for conversion.
- The [events.onRequestSendNotify](../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event and the [events.onRequestUsers](../../Usage%20API/Config/Events/index.md#onrequestusers) event can be set independently.
- Added the [editorConfig.customization.mentionShare](../../Usage%20API/Config/Editor/Customization/index.md#mentionshare) field.
- The *callbackUrl* is selected based on [status](../../Usage%20API/Callback%20handler/index.md).
- Added the [editorConfig.customization.compatibleFeatures](../../Usage%20API/Config/Editor/Customization/index.md#compatiblefeatures) field.

## Version 5.4

- Added the [editorConfig.region](../../Usage%20API/Config/Editor/index.md#region) field.
- The [document.info.created](../../Usage%20API/Config/Document/Info/index.md#created) field is deprecated, please use the [document.info.uploaded](../../Usage%20API/Config/Document/Info/index.md#uploaded) field instead.
- The [document.info.author](../../Usage%20API/Config/Document/Info/index.md#author) field is deprecated, please use the [document.info.owner](../../Usage%20API/Config/Document/Info/index.md#owner) field instead.
- The [events.onReady](../../Usage%20API/Config/Events/index.md#onready) event is removed.
- The *firstname* and *lastname* fields in the [editorConfig.user](../../Usage%20API/Config/Editor/index.md#user) object is removed.
- Added the [events.onRequestSaveAs](../../Usage%20API/Config/Events/index.md#onrequestsaveas) event.
- Added the [events.onRequestInsertImage](../../Usage%20API/Config/Events/index.md#onrequestinsertimage) event.
- Added the [insertImage](../../Usage%20API/Methods/index.md#insertimage) method.
- Added the [events.onRequestMailMergeRecipients](../../Usage%20API/Config/Events/index.md#onrequestmailmergerecipients) event.
- Added the [setMailMergeRecipients](../../Usage%20API/Methods/index.md#setmailmergerecipients) method.
- Added the [setSharingSettings](../../Usage%20API/Methods/index.md#setsharingsettings) method.
- Added the [events.onRequestUsers](../../Usage%20API/Config/Events/index.md#onrequestusers) event.
- Added the [setUsers](../../Usage%20API/Methods/index.md#setusers) method.
- Added the [events.onRequestSendNotify](../../Usage%20API/Config/Events/index.md#onrequestsendnotify) event.

## Version 5.3

- Added [conversion](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) to the OOXML (dotx, xltx, potx) and ODF (ott, ots, otp) templates.
- Added the [editorConfig.customization.reviewDisplay](../../Usage%20API/Config/Editor/Customization/index.md#reviewdisplay) field.
- The [editorConfig.customization.commentAuthorOnly](../../Usage%20API/Config/Editor/Customization/index.md#commentauthoronly) field is now used to restrict comment deletion as well.
- Added the [editorConfig.customization.compactHeader](../../Usage%20API/Config/Editor/Customization/index.md#compactheader) field.
- Added the [editorConfig.customization.hideRightMenu](../../Usage%20API/Config/Editor/Customization/index.md#hiderightmenu) field.
- Added the [editorConfig.customization.toolbarNoTabs](../../Usage%20API/Config/Editor/Customization/index.md#toolbarnotabs) field.
- Added [conversion error](../../Additional%20API/Conversion%20API/index.md#possible-error-codes-and-their-description) for password protected documents.
- Added the [editorConfig.actionLink](../../Usage%20API/Config/Editor/index.md#actionlink) field.
- Added the [setActionLink](../../Usage%20API/Methods/index.md#setactionlink) method.
- Added the [events.onMakeActionLink](../../Usage%20API/Config/Events/index.md#onmakeactionlink) event.

## Version 5.2

- Token in request [body](../../Additional%20API/Signature/Request/Token%20in%20body/index.md) parameters.
- [document.permissions.comment](../../Usage%20API/Config/Document/Permissions/index.md#comment) is available in all types of editors.
- Added the [document.permissions.fillForms](../../Usage%20API/Config/Document/Permissions/index.md#fillforms) field.
- Added the [editorConfig.customization.help](../../Usage%20API/Config/Editor/Customization/index.md#help) field.
- Added the possibility to make the [editorConfig.customization.logo](../../Usage%20API/Config/Editor/Customization/index.md#logo) not clickable.
- Added for the [aspect](../../Additional%20API/Conversion%20API/index.md#thumbnailaspect) field value *2* for the conversion.

## Version 5.1

- Added the *format* parameter to the [downloadAs](../../Usage%20API/Methods/index.md#downloadas) method.
- Added the [document.permissions.modifyContentControl](../../Usage%20API/Config/Document/Permissions/index.md#modifycontentcontrol) field.
- Added conversion for [OpenDocument Template](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats) formats.
- Added the [events.onRequestClose](../../Usage%20API/Config/Events/index.md#onrequestclose) event.
- Added the [editorConfig.customization.goback.blank](../../Usage%20API/Config/Editor/Customization/index.md#goback) field.

## Version 5.0

- Added the [document.permissions.modifyFilter](../../Usage%20API/Config/Document/Permissions/index.md#modifyfilter) field.
- Added conversion for macro-enabled document, document template and flat document [formats](../../Additional%20API/Conversion%20API/index.md#text-document-file-formats).
- The [events.onReady](../../Usage%20API/Config/Events/index.md#onready) event is deprecated, please use the [events.onAppReady](../../Usage%20API/Config/Events/index.md#onappready) events instead.
- Added the [events.onDocumentReady](../../Usage%20API/Config/Events/index.md#ondocumentready) event.
- Added the [editorConfig.plugins.autostart](../../Usage%20API/Config/Editor/Plugins/index.md#autostart) field.
- Added the [events.onWarning](../../Usage%20API/Config/Events/index.md#onwarning) event.
- Added the [Document Builder service](../../Additional%20API/Document%20Builder%20API/index.md).

## Version 4.4

- Changed the [showMessage](../../Usage%20API/Methods/index.md#showmessage) method.
- Added conversion to [odp](../../Additional%20API/Conversion%20API/index.md#presentation-file-formats) format.
- Added the [document.permissions.comment](../../Usage%20API/Config/Document/Permissions/index.md#comment) field.
- Added the [document.permissions.changeHistory](../../Usage%20API/Config/Document/Permissions/index.md#changehistory) field.
- Added the [events.onRequestRestore](../../Usage%20API/Config/Events/index.md#onrequestrestore) event.
- Added the [document.permissions.rename](../../Usage%20API/Config/Document/Permissions/index.md#rename) field.
- Added the [events.onRequestRename](../../Usage%20API/Config/Events/index.md#onrequestrename) event.
- Added the [meta](../../Additional%20API/Command%20service/meta/index.md) command.
- Added the [events.onMetaChange](../../Usage%20API/Config/Events/index.md#onmetachange) event.
- Changed the use of *callbackUrl* from the [last user](../../Usage%20API/Callback%20handler/index.md) who joined the co-editing.
- Added the [editorConfig.location](../../Usage%20API/Config/Editor/index.md#location) field.

## Version 4.3

- Added the [destroyEditor](../../Usage%20API/Methods/index.md#destroyeditor) method.
- Removed the [editorConfig.plugins.url](../../Usage%20API/Config/Editor/Plugins/index.md#url) field from the plugin connection pattern.
- Added the [editorConfig.customization.commentAuthorOnly](../../Usage%20API/Config/Editor/Customization/index.md#commentauthoronly) field.
- Added the [editorConfig.customization.forcesave](../../Usage%20API/Config/Editor/Customization/index.md#forcesave) field.
- Added the [editorConfig.customization.showReviewChanges](../../Usage%20API/Config/Editor/Customization/index.md#showreviewchanges) field.
- Added the [forcesavetype](../../Usage%20API/Callback%20handler/index.md#forcesavetype) field in the callback handler request when force saving the file.
- Added the [JSON format for response](../../Additional%20API/Conversion%20API/index.md#response-parameters-and-their-description) from document conversion service.

## Version 4.2

- The [firstname](../../Usage%20API/Config/Editor/index.md#user) and [lastname](../../Usage%20API/Config/Editor/index.md#user) fields is deprecated, please use the [name](../../Usage%20API/Config/Editor/index.md#user) field instead.
- Added the possibility to specify the values for the [editorConfig.customization.chat](../../Usage%20API/Config/Editor/Customization/index.md#chat) and [editorConfig.customization.comments](../../Usage%20API/Config/Editor/Customization/index.md#comments) in the Open Source version.
- Added the [editorConfig.customization.compactToolbar](../../Usage%20API/Config/Editor/Customization/index.md#compacttoolbar) field.
- Added the [editorConfig.customization.zoom](../../Usage%20API/Config/Editor/Customization/index.md#zoom) field.
- Added the [editorConfig.customization.autosave](../../Usage%20API/Config/Editor/Customization/index.md#autosave) field.
- The [changeshistory](../../Usage%20API/Callback%20handler/index.md#changeshistory) field is removed, please use the [history](../../Usage%20API/Callback%20handler/index.md#history) field instead.
- Changed the [setHistoryData](../../Usage%20API/Methods/index.md#sethistorydata) method.
- Added the possibility to convert files to [thumbnail](../../Additional%20API/Conversion%20API/index.md#sample-of-json-object-sent-to-document-conversion-service-used-to-generate-png-thumbnail-of-file-in-docx-format) in the [document conversion service](../../Additional%20API/Conversion%20API/index.md).
- The POST requests are now used for the interaction with the [document command service](../../Additional%20API/Command%20service/index.md) and the [document conversion service](../../Additional%20API/Conversion%20API/index.md).
- Added the [version](../../Additional%20API/Command%20service/version/index.md) command.
- Added the [signature](../../Additional%20API/Signature/index.md) for the editor opening and for the incoming and outgoing requests.
