The list of changes for ONLYOFFICE Plugins and Macros API.

## Version 8.1

- Added the ability to add the plugin [toolbar menu items](../../Get%20Started/Plugin%20types/index.md).
- Added the ability to create [multiple left panels](../../Usage%20API/Config/Plugin%20variations/index.md) for plugins.
- Added the information about the current position of the context menu plugin event.
- Added the onToolbarMenuClick event.
- Added the ActivateWindow method to *window\.Asc.plugin.executeMethod*.
- Added the AddToolbarMenuItem method to *window\.Asc.plugin.executeMethod*.
- Added the GetSelectedOleObjects method to *window\.Asc.plugin.executeMethod*.
- Added the GetAllComments method to *window\.Asc.plugin.executeMethod* for Spreadsheet Api.
- Added the GetCustomFunctions method to *window\.Asc.plugin.executeMethod* for Spreadsheet Api.
- Added the SetCustomFunctions method to *window\.Asc.plugin.executeMethod* for Spreadsheet Api.
- Added the GetAllComments method to *window\.Asc.plugin.executeMethod* for Presentation Api.
- Added the OLEProperties type to the simple type definitions.
- Added the ToolbarMenuItem type to the simple type definitions.
- Added the ToolbarMenuMainItem type to the simple type definitions.
- Added the ToolbarMenuTab type to the simple type definitions.
- Added the ToolbarMenuItemType type to the simple type definitions.
- Added the *icons* and *data* parameters to the ContextMenuItem object.
- Added the [menu](../../Usage%20API/Config/index.md#menu) config parameter.

## Version 8.0

- Added the SearchNext method to *window\.Asc.plugin.executeMethod*.
- Added the EndSlideShow method to *window\.Asc.plugin.executeMethod*.
- Added the GoToNextSlideInSlideShowmethod to *window\.Asc.plugin.executeMethod*.
- Added the GoToPreviousSlideInSlideShow method to *window\.Asc.plugin.executeMethod*.
- Added the GoToSlideInSlideShow method to *window\.Asc.plugin.executeMethod*.
- Added the PauseSlideShow method to *window\.Asc.plugin.executeMethod*.
- Added the ResumeSlideShow method to *window\.Asc.plugin.executeMethod*.
- Added the StartSlideShow method to *window\.Asc.plugin.executeMethod*.

## Version 7.5

- Added the *align* parameter to the ShowButton method of *window\.Asc.plugin.executeMethod*.

## Version 7.4

- Added the ability to download ready-to-use plugins from [ONLYOFFICE Plugin Marketplace](../../Plugins/Adding%20plugins/ONLYOFFICE%20Desktop%20Editors/index.md#adding-plugins-through-the-plugin-manager) in ONLYOFFICE Desktop Editors.
- Added the sendToPlugin method to the *Plugin* object.
- Added the onContextMenuClick event.
- Added the onContextMenuShow event.
- Added the AddContextMenuItem method to *window\.Asc.plugin.executeMethod*.
- Added the CloseWindow method to *window\.Asc.plugin.executeMethod*.
- Added the GetCurrentSentence method to *window\.Asc.plugin.executeMethod*.
- Added the GetCurrentWord method to *window\.Asc.plugin.executeMethod*.
- Added the GetDocumentLang method to *window\.Asc.plugin.executeMethod*.
- Added the InstallDeveloperPlugin method to *window\.Asc.plugin.executeMethod*.
- Added the MouseMoveWindow method to *window\.Asc.plugin.executeMethod*.
- Added the MouseUpWindow method to *window\.Asc.plugin.executeMethod*.
- Added the ReplaceCurrentSentence method to *window\.Asc.plugin.executeMethod*.
- Added the ReplaceCurrentWord method to *window\.Asc.plugin.executeMethod*.
- Added the ResizeWindow method to *window\.Asc.plugin.executeMethod*.
- Added the SendToWindow method to *window\.Asc.plugin.executeMethod*.
- Added the ShowWindow method to *window\.Asc.plugin.executeMethod*.
- Added the UpdateContextMenuItem method to *window\.Asc.plugin.executeMethod*.
- Added the *backup* parameter to the RemovePlugin method of *window\.Asc.plugin.executeMethod*.
- Added the *NewLineSeparator* parameter to the GetSelectedText method of *window\.Asc.plugin.executeMethod*.
- Added the *replaceMode* parameter to the ImageData object.

## Version 7.3

- Added the *sign* type to the [initDataType](../../Usage%20API/Config/index.md#initdatatype) config parameter.
- Added the AddAddinField method to *window\.Asc.plugin.executeMethod*.
- Added the GetAllAddinFields method to *window\.Asc.plugin.executeMethod*.
- Added the GetVBAMacros method to *window\.Asc.plugin.executeMethod*.
- Added the OnDropEvent method to *window\.Asc.plugin.executeMethod*.
- Added the RemoveFieldWrapper method to *window\.Asc.plugin.executeMethod*.
- Added the SetEditingRestrictions method to *window\.Asc.plugin.executeMethod*.
- Added the UpdateAddinFields method to *window\.Asc.plugin.executeMethod*.
- Added the Spreadsheet Api methods to *window\.Asc.plugin.executeMethod*.
- Added the Presentation Api methods to *window\.Asc.plugin.executeMethod*.

## Version 7.2

- Added the onAddComment event.
- Added the onChangeCommentData event.
- Added the onRemoveComment event.
- Added the AcceptReviewChanges method to *window\.Asc.plugin.executeMethod*.
- Added the MoveToNextReviewChange method to *window\.Asc.plugin.executeMethod*.
- Added the RejectReviewChanges method to *window\.Asc.plugin.executeMethod*.
- Changed the plugin [localization](../../Plugins/Plugin%20localization/index.md) scheme.
- Added the [ONLYOFFICE Plugin Marketplace](../../Plugins/Adding%20plugins/ONLYOFFICE%20Docs%20on-premises/index.md#adding-plugins-through-the-plugin-manager).
- Added the ChangeOleObject method to *window\.Asc.plugin.executeMethod*.
- Added the GetAllForms method to *window\.Asc.plugin.executeMethod*.
- Added the GetFileToDownload method to *window\.Asc.plugin.executeMethod*.
- Added the GetFormsByTag method to *window\.Asc.plugin.executeMethod*.
- Added the GetFormValue method to *window\.Asc.plugin.executeMethod*.
- Added the GetImageDataFromSelection method to *window\.Asc.plugin.executeMethod*.
- Added the GetInstalledPlugins method to *window\.Asc.plugin.executeMethod*.
- Added the InstallPlugin method to *window\.Asc.plugin.executeMethod*.
- Added the PutImageDataToSelection method to *window\.Asc.plugin.executeMethod*.
- Added the RemovePlugin method to *window\.Asc.plugin.executeMethod*.
- Added the SetFormValue method to *window\.Asc.plugin.executeMethod*.
- Added the ShowButton method to *window\.Asc.plugin.executeMethod*.
- Added the UpdatePlugin method to *window\.Asc.plugin.executeMethod*.
- Added the onBlurContentControl event.
- Added the onChangeContentControl event.
- Added the onFocusContentControl event.
