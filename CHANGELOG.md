# Change Log

- docbuilder: added the onWorksheetChange event to Spreadsheet API
- editors: added the WordPress plugin

## 2.8.1
- docbuilder: fix run examples

## 2.8.0
- editors: the services.CoAuthoring.token.inbox.inBody and services.CoAuthoring.token.outbox.inBody parameters for enabling token in body are deprecated
- editors: added the X-LOOL-WOPI-IsModifiedByUser, X-LOOL-WOPI-IsAutosave and X-LOOL-WOPI-IsExitSave request headers to the PutFile WOPI operation
- editors: added the document.permissions.chat parameter
- editors: added conversion from xlsb format
- editors: added opening for xlsb format
- editors: added the editorConfig.customization.layout parameter section
- editors: added the editorConfig.customization.features parameter section
- editors: added the documentLayout parameter to the conversion request
- editors: added the documentRenderer parameter to the conversion request
- editors: added conversion from pdf/xps/oxps formats to docx
- editors: added the document.permissions.userInfoGroups parameter
- plugins: the access to the window and document objects and the alert function is restricted from the plugin command code and macros
- plugins: added the GetAllOleObjects, RemoveOleObject, RemoveOleObjects and SelectOleObject methods
- plugins: added the ConvertDocument and ReplaceTextSmart methods
- docbuilder: v7.1
- desktop: added the --ascdesktop-support-debug-info-keep flag to run the application
- portals: api v12.0

## 2.7.0
- editors: test examples v1.2.0
- editors: added the Strapi plugin
- editors: added the information for Nextcloud and ownCloud about validating certificates
- editors: added the important security information to the test examples
- editors: link to helpcenter about themes
- plugins: updated the information about adding plugins to ONLYOFFICE Cloud


## 2.6.0
- plugins: added the "version" parameter to config
- desktop: v7.0
- desktop: added the extraLogout parameter to config

## 2.5.0
- editors: test examples v1.1.0
- editors: docxf and oform on try page
- editors: changed the recommended list of parameters to be signed when performing the client-side browser requests to ONLYOFFICE Document Server
- editors: the parameter list in the initialization config signature has become strictly regulated
- editors: added the FAQ page concerning using WOPI
- editors: added an example for outgoing request for document changes data download
- editors: added conversion to and from docxf format
- editors: added the .docxf and .oform document formats
- editors: a table of differences between ONLYOFFICE Docs API and WOPI
- editors: the callbackUrl is used from the last tab of the same user
- editors: added the UI_InsertGraphic message for the PostMessage WOPI protocol
- editors: added the logoDark field to the editorConfig.customization.customer parameter
- editors: added the imageDark field to the editorConfig.customization.logo parameter
- editors: the imageEmbedded field of the editorConfig.customization.logo parameter is removed
- editors: added the signature to the request for file changes
- editors: added the document.permissions.protect field
- editors: added the fileType parameter to the onDownloadAs, onRequestRestore and onRequestSaveAs events
- editors: added the possibility to insert several images via the insertImage method
- editors: the assemblyFormatAsOrigin server setting is enabled by default
- editors: added the ooxml and odf values to the outputtype parameter of the conversion request
- editors: added the fileType and previous.fileType parameters to the setHistoryData method
- editors: added the filetype parameter to the Callback handler
- editors: added the fileType field to the conversion response
- editors: conversion to docm, dotm, xlsm, xltm, pptm, potm
- editors: added editorConfig.customization.review
- editors: added the possibility to view the document history in spreadsheets
- editors: added the ability to use custom path for file storage in the test examples
- editors: added the Redmine plugin
- editors: changed get docs page
- editors: added the Moodle plugin
- plugins: added parameters to the GetSelectedText method
- plugins: added the ConvertDocument, AddContentControlCheckBox, AddContentControlDatePicker, AddContentControlList and AddContentControlPicture methods
- docbuilder: v7.0
- docbuilder: try now page
- desktop: restructured the Encryption page
- desktop: added the How it workds section
- portals: api v11.6

## 2.4.1
- editors: fix macrosMode default

## 2.4.0
- editors: added the Jira integration app
- editors: added the Java Spring integration example
- editors: added the Mattermost plugin
- editors: added opening for oxps format
- editors: added the RefreshLock operation for WOPI protocol
- editors: added the ip filter information
- editors: added the wopi.enable parameter
- editors: added the Proof keys page
- macros: added the Currency exchange rates macro sample
- desktop: v6.4
- desktop: added icons for the dark and light UI themes
- desktop: updated the debugging page

## 2.3.0
- mobile view
- global search
- search via google
- editors: added support for WOPI protocol
- editors: added the description of conversion response parameters
- editors: added the Get ONLYOFFICE Docs page
- editors: added the simple value to the editorConfig.customization.reviewDisplay
- editors: information about threaded comments
- editors: commentGroups on try page
- editors: added the Commenting page
- editors: added document.permissions.commentGroups
- editors: added the onPluginsReady event
- editors: added the requestClose method
- editors: added editorConfig.coEditing
- editors: added the possibility to view the document history for the presentation files
- editors: added editorConfig.customization.hideNotes
- editors: added editorConfig.customization.uiTheme
- editors: conversion from djvu to the image formats
- editors: added the format parameter to the downloadAs method
- editors: conversion to OOXML and ODF templates
- editors: how it works navigation
- editors: restructured the Command service page
- editors: added the Comparing documents page
- editors: try reviewGroups
- editors: added the license command
- macros: assigning macros to the graphic objects
- plugins: added the SetDisplayModeInReview and CoAuthoringChatSendMessage methods
- plugins: restructured the config.json page and added navigation to it
- plugins: updated config parameters
- plugins: added the GetSelectionType and GetVersion methods
- desktop: v6.3
- desktop: added the entryPage parameter to config
- desktop: added the updateEncryptionKeys command type to cloudCryptoCommand
- docbuilder: v6.4
- docbuilder: added changelog page
- docbuilder: added the How it works section
- docbuilder: added the Comparing documents page
- portals: api v11.5.3

## 2.2.0
- docbuilder: api v6.3.0
- docbuilder: display class properties
- editors: added the Anonymous users page
- editors: added editorConfig.customization.hideRulers
- editors: added document.permissions.reviewGroups
- editors: added document.info.favorite
- editors: added setFavorite method
- editors: added events.onMetaChange
- editors: added document.permissions.editCommentAuthorOnly and document.permissions.deleteCommentAuthorOnly
- editors: added editorConfig.customization.anonymous
- editors: epub, fb2, html conversion
- editors: converting xml
- plugins: changed variations.isModal parameter
- plugins: new icon parameters
- plugins: examples
- plugins: methods
- portals: api v11.5.1

## 2.1.0
- plugins: added the InputHelper object and its methods
- plugins: added new methods
- plugins: added events
- plugins: updated config parameters
- fix xss
- portals: api v11.5

## 2.0.0
- redesign
- specifying products version
- changed highlighting style
- thirdparty licenses
- editors: update test examples
- editors: install and update plone instruction
- editors: added new value for actions.type for callback
- editors: added chamilo plugin
- editors: opening fb2
- plugins: added plugin types page
- plugins: getting started page for macros
- docbuilder: api v6.2.0
- docbuilder: applying examples on page
- added Desktop Editors section

## 1.1.0
- editors: added editorConfig.customization.toolbarHideFileName
- editors: the callbackUrl depends on forcesavetype
- editors: added editorConfig.customization.trackChanges
- editors: support sharepoint 2019
- docbuilder: updated builder examples
- portals: api v11.1
- plugins: updated plugin styles information
- plugins: added faq
- plugins: added getting started page
- plugins: expanded installation
- plugins: new methods

## 1.0.0
- Initial changelog